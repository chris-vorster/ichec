#!/bin/sh
#SBATCH -p GpuQ
#SBATCH -N 1
#SBATCH -t 04:00:00
#SBATCH -A DCU01

cd $SLURM_SUBMIT_DIR

module load cuda/11.2
module load conda/2

source activate /ichec/work/dcu01/cvorster/py37

echo "This is the GpuQ run using https://github.com/WongKinYiu/yolov7"
cd $HOME_DIR
time python -m torch.distributed.launch --nproc_per_node 2 --master_port 9527 train.py --workers 8 --device 0,1 --sync-bn --batch-size 16 --data "$WORK_DIR/data.yaml" --img 640 640 --cfg "$HOME_DIR/cfg/training/yolov7.yaml" --weights "$HOME_DIR/yolov7.pt" --name yolov7-ipcam --hyp data/hyp.scratch.p5.yaml
