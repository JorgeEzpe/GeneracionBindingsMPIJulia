#define _POSIX_C_SOURCE 199309L
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <mpi.h>
#include <time.h>
#include <sys/time.h>

#ifndef M_PI
#define M_PI 3.141592653589793238462643383279502884
#endif

#define PI2 (M_PI / 2.0)

void load_data(double *box, double *pos, int nd, int n) {
    FILE *fbox = fopen("box.bin", "rb");
    if (!fbox || fread(box, sizeof(double), nd, fbox) != nd) {
        fprintf(stderr, "Error leyendo box.bin\n");
        exit(EXIT_FAILURE);
    }
    fclose(fbox);

    FILE *fpos = fopen("pos.bin", "rb");
    if (!fpos || fread(pos, sizeof(double), nd * n, fpos) != nd * n) {
        fprintf(stderr, "Error leyendo pos.bin\n");
        exit(EXIT_FAILURE);
    }
    fclose(fpos);
}

double v(double x) {
    return x < PI2 ? pow(sin(x), 2) : 1.0;
}

double dv(double x) {
    return x < PI2 ? 2 * sin(x) * cos(x) : 0.0;
}

double dot_prod(int n, double *x, double *y) {
    double t = 0.0;
    for (int i = 0; i < n; ++i)
        t += x[i] * y[i];
    return t;
}

double dist(int nd, double *r1, double *r2, double *dr) {
    double d = 0.0;
    for (int i = 0; i < nd; ++i) {
        dr[i] = r1[i] - r2[i];
        d += dr[i] * dr[i];
    }
    return sqrt(d);
}

void compute(int n, int nd, double *pos, double *vel, double *f,double mass, double *rij, int procs, int rank, double *pot_out, double *kin_out) {
    double pot = 0.0, kin = 0.0;
    int chunk = n / procs;
    int i_start = chunk * rank;
    int i_end = i_start + chunk;

    for (int i = i_start; i < i_end; ++i) {
        for (int j = 0; j < nd; ++j)
            f[i * nd + j] = 0.0;

        for (int j = 0; j < n; ++j) {
            if (i != j) {
                double d = dist(nd, &pos[i * nd], &pos[j * nd], rij);
                pot += 0.5 * v(d);
                for (int k = 0; k < nd; ++k) {
                    if (d == 0.0) d = 1e-15;
                    f[i * nd + k] -= rij[k] * dv(d) / d;
                }
            }
        }

        kin += dot_prod(nd, &vel[i * nd], &vel[(n - 1) * nd]);
    }

    MPI_Allreduce(MPI_IN_PLACE, &pot, 1, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);
    MPI_Allreduce(MPI_IN_PLACE, &kin, 1, MPI_DOUBLE, MPI_SUM, MPI_COMM_WORLD);

    MPI_Allgather(MPI_IN_PLACE, 0, MPI_DOUBLE, f, chunk * nd, MPI_DOUBLE, MPI_COMM_WORLD);

    *pot_out = pot;
    *kin_out = 0.5 * mass * kin;
}

void update(int n, int nd, double *pos, double *vel, double *f, double *a,double mass, double dt, int procs, int rank) {
    double rmass = 1.0 / mass;
    int chunk = n / procs;
    int i_start = chunk * rank;
    int i_end = i_start + chunk;

    for (int i = i_start; i < i_end; ++i) {
        for (int j = 0; j < nd; ++j) {
            int idx = i * nd + j;
            pos[idx] += vel[idx] * dt + 0.5 * dt * dt * a[idx];
            vel[idx] += 0.5 * dt * (f[idx] * rmass + a[idx]);
            a[idx] = f[idx] * rmass;
        }
    }

    MPI_Allgather(MPI_IN_PLACE, 0, MPI_DOUBLE, pos, chunk * nd, MPI_DOUBLE, MPI_COMM_WORLD);
    MPI_Allgather(MPI_IN_PLACE, 0, MPI_DOUBLE, vel, chunk * nd, MPI_DOUBLE, MPI_COMM_WORLD);
    MPI_Allgather(MPI_IN_PLACE, 0, MPI_DOUBLE, a, chunk * nd, MPI_DOUBLE, MPI_COMM_WORLD);
}

int main(int argc, char **argv) {

    double total_time_sum = 0.0;
    int n = atoi(argv[1]);
    int steps = atoi(argv[2]);
    int nd = 3;
    double mass = 1.0;
    double dt = 1.0e-4;


    MPI_Init(&argc, &argv);

    int rank, procs;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &procs);

    if (n % procs != 0)
        n = ((n + procs - 1) / procs) * procs;

    double *box = malloc(sizeof(double) * nd);
    double *pos = malloc(sizeof(double) * nd * n);
    double *vel = calloc(nd * n, sizeof(double));
    double *f = calloc(nd * n, sizeof(double));
    double *a = calloc(nd * n, sizeof(double));
    double *rij = malloc(sizeof(double) * nd);

    if (rank == 0)
        load_data(box, pos, nd, n);

    struct timespec t_start, t_end;
    MPI_Barrier(MPI_COMM_WORLD);
    clock_gettime(CLOCK_MONOTONIC, &t_start);

    MPI_Bcast(pos, nd * n, MPI_DOUBLE, 0, MPI_COMM_WORLD);
    MPI_Bcast(vel, nd * n, MPI_DOUBLE, 0, MPI_COMM_WORLD);
    MPI_Bcast(f, nd * n, MPI_DOUBLE, 0, MPI_COMM_WORLD);
    MPI_Bcast(a, nd * n, MPI_DOUBLE, 0, MPI_COMM_WORLD);

    double pot, kin;
    compute(n, nd, pos, vel, f, mass, rij, procs, rank, &pot, &kin);

    for (int i = 0; i < steps; ++i) {
        compute(n, nd, pos, vel, f, mass, rij, procs, rank, &pot, &kin);
        update(n, nd, pos, vel, f, a, mass, dt, procs, rank);
    }

    clock_gettime(CLOCK_MONOTONIC, &t_end);
    double total_time=(t_end.tv_sec - t_start.tv_sec) + (t_end.tv_nsec - t_start.tv_nsec) / 1e9;
    MPI_Reduce(&total_time, &total_time_sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);

    if (rank == 0) {
        FILE *f = fopen("../Resultados/MD/MDC.txt", "a");
        if (f != NULL) {
            fprintf(f, "%d,%d,%.9f\n", procs, n, total_time_sum / procs);
            fclose(f);
        }
    }
    
    free(box);
    free(pos);
    free(vel);
    free(f);
    free(a);
    free(rij);

    MPI_Finalize();
    return 0;
}
