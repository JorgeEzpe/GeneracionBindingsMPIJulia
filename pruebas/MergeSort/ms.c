#define _POSIX_C_SOURCE 199309L
#include <mpi.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdint.h>
#include <unistd.h>


int cmpfunc(const void* a, const void* b) {
    double da = *(double*)a;
    double db = *(double*)b;
    return (da > db) - (da < db);
}

void merge(int i, int chunk_i, int j, int chunk_j, double* v, double* tmp) {
    int i0 = i;
    int p = 0;

    while (chunk_i > 0 && chunk_j > 0) {
        if (v[i] < v[j]) {
            tmp[p++] = v[i++];
            chunk_i--;
        } else {
            tmp[p++] = v[j++];
            chunk_j--;
        }
    }

    while (chunk_i-- > 0) tmp[p++] = v[i++];
    while (chunk_j-- > 0) tmp[p++] = v[j++];

    for (int c = 0; c < p; ++c) {
        v[i0 + c] = tmp[c];
    }
}

void load_vector(double *v, int n) {
    FILE *f = fopen("random_vector.bin", "rb");
    if (!f) {
        perror("Error opening random_vector.bin");
        exit(EXIT_FAILURE);
    }
    int r=fread(v, sizeof(double), n, f);
    fclose(f);
}

int main(int argc, char** argv){
    
    int n = atoi(argv[1]);
    int r = atoi(argv[2]);

    double total_comm_time = 0.0;

    MPI_Init(&argc, &argv);

    int rank, size;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);

    if (n % size != 0) {
        n = ((n / size) + 1) * size;
    }

    int chunk = n / size;

    double* v = NULL;
    if (rank == 0) {
        v = aligned_alloc(64, n * sizeof(double));
        load_vector(v,n);
    }

    double* local_v = aligned_alloc(64, chunk * sizeof(double));
    double* result = NULL;
    double* tmp = NULL;

    if (rank == 0) {
        result = aligned_alloc(64, n * sizeof(double));
        tmp    = aligned_alloc(64, n * sizeof(double));
    }

    struct timespec t_start, t_end, ts1, ts2, ts3, ts4;
    double sort_time = 0.0;
    double merge_time = 0.0;
    
    MPI_Barrier(MPI_COMM_WORLD);
    clock_gettime(CLOCK_MONOTONIC, &t_start);

    for (int j = 0; j < r; j++) {

        MPI_Scatter(v, chunk, MPI_DOUBLE, local_v, chunk, MPI_DOUBLE, 0, MPI_COMM_WORLD);

        clock_gettime(CLOCK_MONOTONIC, &ts1);
        qsort(local_v, chunk, sizeof(double), cmpfunc);
        clock_gettime(CLOCK_MONOTONIC, &ts2);

        sort_time+= (ts2.tv_sec - ts1.tv_sec) + (ts2.tv_nsec - ts1.tv_nsec) / 1e9;

        MPI_Gather(local_v, chunk, MPI_DOUBLE, result, chunk, MPI_DOUBLE, 0, MPI_COMM_WORLD);

        clock_gettime(CLOCK_MONOTONIC, &ts3);
        if (rank == 0) {
            for (int i = 1; i < size; ++i) {
                merge(0, i * chunk, i * chunk, chunk, result, tmp);
            }
        }
        MPI_Barrier(MPI_COMM_WORLD);
        clock_gettime(CLOCK_MONOTONIC, &ts4);
        merge_time+=(ts4.tv_sec - ts3.tv_sec) + (ts4.tv_nsec - ts3.tv_nsec) / 1e9;
    }

    clock_gettime(CLOCK_MONOTONIC, &t_end);
    double total_time = (t_end.tv_sec - t_start.tv_sec) + (t_end.tv_nsec - t_start.tv_nsec) / 1e9;
    double comm_time = total_time - sort_time - merge_time;
    MPI_Reduce(&comm_time, &total_comm_time, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
    
    if (rank == 0) {
        FILE *f = fopen("../Resultados/MS/MSC.txt", "a");
        if (f != NULL) {
            fprintf(f, "%d,%d,%.9f\n", size, n, total_comm_time / size);
            fclose(f);
        }
    }

    free(local_v);
    if (rank == 0) {
        free(v);
        free(result);
        free(tmp);
    }

    MPI_Finalize();
    return 0;
}
