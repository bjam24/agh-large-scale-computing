#!/bin/bash
#SBATCH --job-name=render_blender
#SBATCH --time=02:00:00
#SBATCH --account=plglscclass24-cpu
#SBATCH --partition=plgrid
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4  #4
#SBATCH --mem=4G
#SBATCH --array=1-100
#SBATCH --output=joblog.txt
#SBATCH --error=joberr.txt

# Load Blender module
module load blender

# Render the specific frame using the command line
blender -b repeat_zone_flower_by_MiRA.blend -t $SLURM_CPUS_PER_TASK -o //frame_# -f $SLURM_ARRAY_TASK_ID
