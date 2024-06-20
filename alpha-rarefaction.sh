#!/bin/bash -l
#SBATCH -J alpha-rarefaction
#SBATCH --time 14:00:00
#SBATCH --mem 5gb
#SBATCH -N 1
#SBATCH -c 1


# Load Qiime2 environment
conda activate qiime2-shotgun-2023.9

qiime diversity alpha-rarefaction \
  --i-table metaphlan4species_readstats_transposed.qza \
  --p-max-depth 6000 \
  --o-visualization alpha-rarefaction-metaphlan4_6000.qzv
