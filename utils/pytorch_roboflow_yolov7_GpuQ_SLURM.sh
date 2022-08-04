#!/bin/sh
#SBATCH -p GpuQ
#SBATCH -N 2
#SBATCH -t 00:30:00
#SBATCH -A DCU01

cd $SLURM_SUBMIT_DIR

module load cuda/11.2
module load conda/2

source activate /ichec/work/dcu01/cvorster/py37

echo "This is the GpuQ run."
cd $HOME_DIR
time python train.py --batch 16 --cfg "$HOME_DIR/cfg/training/yolov7.yaml" --epochs 2 --data "$WORK_DIR/data.yaml" --weights "$HOME_DIR/yolov7.pt" --device 0 --project "$WORK_DIR/test1"