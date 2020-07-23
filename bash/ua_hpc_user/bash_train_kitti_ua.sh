#!/bin/bash
encoder_='vggASPP'
batch_=8
epoch_=100
alpha_image_loss_=0.85
dataset_='kitti'
data_path_='~/group/ditzler/'

model_name="$(printf '%s_%s_%dx%d' ${dataset_%} ${encoder_%} ${batch_%} ${epoch_%})"
echo ">>> ${model_name}"

singularity run --nv /groups/ditzler/envImg/tfcvpy36tf15.img \
python monodepth_main.py --mode train \
--data_path "$(printf '%s%s/data/' ${data_path_%} ${dataset_%})" \
--filenames_file "$(printf 'utils/filenames/%s_train_files.txt' ${dataset_%})" \
--log_directory models/ \
--model_name ${model_name} \
--dataset ${dataset_} \
--encoder ${encoder_} \
--lr_loss_weight 1 
--image_loss_weight .5--disp_gradient_loss_weight 1 
