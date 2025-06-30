#!/bin/bash

np=$1    
n=$2
r=$3
tol=$4
seed=$5

julia generacionRandomJM.jl $n $seed $np

srun ./jm $n $r $tol

srun julia jm.jl $n $r $tol

srun julia jmmpi.jl $n $r $tol