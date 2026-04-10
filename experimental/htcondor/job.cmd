#!/bin/bash

CONTAINER_PATH="ecloud-gpu.sif"

tar -xf sim_template.tar
rm sim_template.tar

apptainer exec --nv --env PYTHONNOUSERSITE=1 --env PYECL_USE_GPU=1 --env CUDA_VISIBLE_DEVICES=0,1 --home "$_CONDOR_SCRATCH_DIR" $CONTAINER_PATH bash -lc 'date; echo $ECLOUD_CONTAINER_VERSION' >> envinfo.txt
apptainer exec --nv --env PYTHONNOUSERSITE=1 --env PYECL_USE_GPU=1 --env CUDA_VISIBLE_DEVICES=0,1 --home "$_CONDOR_SCRATCH_DIR" $CONTAINER_PATH python -m PyPARIS.multiprocexec -n 8 sim_class=PyPARIS_sim_class.Simulation.Simulation >> stdout.txt 2>> stderr.txt

tar -cvf output.tar ./
