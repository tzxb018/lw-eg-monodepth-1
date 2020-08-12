#!/bin/bash
encoder_='vggASPP'
batch_=8
epoch_=100
alpha_image_loss_=0.85
disp_gradient_loss_weight_=0.75
dataset_='kitti'
data_path_='/groups/ditzler/'
lr_loss_=0.5

model_name="$(printf '%s_%s_%dx%d_Cds_75_ccor_50' ${dataset_%} ${encoder_%} ${batch_%} ${epoch_%})"
echo ">>> ${model_name}"

singularity run --nv /groups/ditzler/envImg/tfcvpy36tf15.img \
monodepth_main.py --mode train \
--data_path "$(printf '%s%s/data/' ${data_path_%} ${dataset_%})" \
--filenames_file "$(printf 'utils/filenames/%s_train_files.txt' ${dataset_%})" \
--log_directory models/ \
--model_name ${model_name} \
--dataset ${dataset_} \
--encoder ${encoder_} \
--batch_size ${batch_} \
--num_epochs ${epoch_} \
--lr_loss_weight ${lr_loss_} \
--alpha_image_loss ${alpha_image_loss_} \
--disp_gradient_loss_weight ${disp_gradient_loss_weight_} \
