#!/bin/bash

np=$1    
n=$2
r=$3
seed=$4

julia generacionRandomMS.jl $n $seed $np

srun ./ms $n $r

srun julia ms.jl $n $r

srun julia msmpi.jl $n $r


