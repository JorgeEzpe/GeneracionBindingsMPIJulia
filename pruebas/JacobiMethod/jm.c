#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <mpi.h>
#include <time.h>
#include <stdint.h>
#include <unistd.h>

void load_data(double *a, double *b, int n) {
    FILE *fa = fopen("a_matrix.bin", "rb");
    if (!fa) {
        perror("Error opening a_matrix.bin");
        exit(EXIT_FAILURE);
    }

    int r1= fread(a, sizeof(double), n * n, fa);
    fclose(fa);

    FILE *fb = fopen("b_vector.bin", "rb");
    if (!fb) {
        perror("Error opening b_vector.bin");
        exit(EXIT_FAILURE);
    }
    int r2=fread(b, sizeof(double), n, fb);
    fclose(fb);
}

void jacobi(int n, int max_iter, double tol) {

    double total_time_sum = 0.0;

    MPI_Init(NULL, NULL);
    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm comm = MPI_COMM_WORLD;

    if (n % size != 0) {
        n = ((n + size - 1) / size) * size;
    }

    double *a = aligned_alloc(64, n * n * sizeof(double));
    double *x = aligned_alloc(64, n * sizeof(double));
    double *b = aligned_alloc(64, n * sizeof(double));
    
    if (rank == 0) {
        load_data(a,b,n);
    }

    double *x_new = malloc(n * sizeof(double));
    double norm = 0.0;
    int iter = 0;

    struct timespec t_start, t_end;
    MPI_Barrier(MPI_COMM_WORLD);
    clock_gettime(CLOCK_MONOTONIC, &t_start);  

    MPI_Bcast(a, n * n, MPI_DOUBLE, 0, comm);
    MPI_Bcast(b, n, MPI_DOUBLE, 0, comm);

    int chunk_size = (int)ceil((double)n / (double)size);
    int start = rank * chunk_size;
    int end_idx = (start + chunk_size > n) ? n : start + chunk_size;

    while (iter < max_iter) {
        norm = 0.0;
        for (int i = start; i < end_idx; i++) {
            double sigma = 0.0;
            for (int j = 0; j < i; j++) {
                sigma += a[i * n + j] * x[j];
            }
            for (int j = i + 1; j < n; j++) {
                sigma += a[i * n + j] * x[j];
            }
            x_new[i] = (b[i] - sigma) / a[i * n + i];
            norm += (x_new[i] - x[i]) * (x_new[i] - x[i]);
        }

        MPI_Allreduce(MPI_IN_PLACE, &norm, 1, MPI_DOUBLE, MPI_SUM, comm);

        if (sqrt(norm) < tol) {
            break;
        }

        MPI_Allgather(x_new + start, end_idx - start, MPI_DOUBLE,x, end_idx - start, MPI_DOUBLE, comm);
        iter++;
    }

    clock_gettime(CLOCK_MONOTONIC, &t_end);
    double total_time=(t_end.tv_sec - t_start.tv_sec) + (t_end.tv_nsec - t_start.tv_nsec) / 1e9;
    MPI_Reduce(&total_time, &total_time_sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);

    if (rank == 0) {
        FILE *f = fopen("../Resultados/JM/JMC.txt", "a");
        if (f != NULL) {
            fprintf(f, "%d,%d,%.9f\n", size, n, total_time_sum / size);
            fclose(f);
        }
    }
    
    if (rank==0){
        free(a); 
        free(b); 
        free(x); 
        free(x_new);
    }

    MPI_Finalize();
}

int main(int argc, char** argv) {

    int n = atoi(argv[1]);
    int i = atoi(argv[2]);
    double t = atof(argv[3]);

    jacobi(n, i, t);
    return 0;
}
