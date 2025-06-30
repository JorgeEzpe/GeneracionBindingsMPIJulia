#!/bin/bash

np=$1    
n=$2
s=$3
seed=$4

julia generacionRandomMD.jl $n $seed $np

srun ./md $n $s

srun julia md.jl $n $s

srun julia mdmpi.jl $n $s