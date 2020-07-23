import os
import sys

os.system('ls -l')

a_file = open("./bash/ua_hpc_user/bash_train_kitti_ua.sh", "r")
lines = a_file.readlines()
a_file.close()

del lines[-3:]

new_file = open("./bash/ua_hpc_user/bash_train_kitti_ua.sh", "w+")

for line in lines:
    new_file.write(line)
    
new_file.write("--lr_loss_weight 1 \n")
new_file.write("--image_loss_weight .5")
new_file.write("--disp_gradient_loss_weight 1 \n")

new_file.close()

os.system('cat ./bash/ua_hpc_user/bash_train_kitti_ua.sh')
os.system('sh ./bash/ua_hpc_user/bash_train_kitti_ua.sh')