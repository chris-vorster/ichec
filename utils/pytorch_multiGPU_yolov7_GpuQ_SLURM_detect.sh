#!/bin/sh
#SBATCH -p GpuQ
#SBATCH -N 1
#SBATCH -t 0:10:00
#SBATCH -A DCU01

cd $SLURM_SUBMIT_DIR

module load cuda/11.2
module load conda/2

source activate /ichec/work/dcu01/cvorster/py37

HOME_DIR='/ichec/home/users/cvorster/yolov7'
WORK_DIR='/ichec/work/dcu01/cvorster'

echo "This is the GpuQ detect run using https://github.com/WongKinYiu/yolov7"
cd $HOME_DIR
time python detect.py --weights runs/train/yolov7-ipcam/weights/best.pt --conf 0.1 --source "$WORK_DIR/test/images"
