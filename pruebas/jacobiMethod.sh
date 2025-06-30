#!/bin/bash
#SBATCH -J MPI4ALL_benchmarks
#SBATCH -o M4A_%j.out
#SBATCH -e M4A_%j.err
#SBATCH -N 1
#SBATCH -n 8
#SBATCH -t 01:00:00
#SBATCH --mem-per-cpu=4G

np=8
n=14000

module load gcc openmpi/4.1.1_ft3
module load julia

echo "=== Ejecutando pruebas JacobiMethod ==="
echo ">>> np = $np | n = $n"

cd JacobiMethod
mpicc -O2 jm.c -o jm -lm
./jm.sh "$np" "$n" 1000 0.000001 1234
cd ..

echo "=== Pruebas JacobiMethod completadas ==="
