#!/bin/bash
#SBATCH -J MPI4ALL_benchmarks
#SBATCH -o M4A_%j.out
#SBATCH -e M4A_%j.err
#SBATCH -N 1
#SBATCH -n 8
#SBATCH -t 01:00:00
#SBATCH --mem-per-cpu=4G

np=8
n=30000

module load gcc openmpi/4.1.1_ft3
module load julia

echo "=== Ejecutando pruebas MolecularDynamics ==="
echo ">>> np = $np | n = $n"

cd MolecularDynamics
mpicc -O2 md.c -o md -lm
./md.sh "$np" "$n" 500 1234 
cd ..

echo "=== Pruebas MolecularDynamics completadas ==="
