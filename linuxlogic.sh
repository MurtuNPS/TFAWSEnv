#!/bin/bash
for i in "${disk_array[@]}"
do
        letter_size=($(echo $i | tr ":" "\n"))
        volumename=${letter_size[0]}
        declare -i size=${letter_size[1]}-1
        diskname=${disknames[$count]}
        G=G
        vg=vg
        lv=lv
        slash=/
        dev=dev
    
sudo pvcreate $diskname
sudo vgcreate $vg$count $diskname
sudo lvcreate -L $size$G -n $lv$count $vg$count
sudo mkfs -t xfs $slash$dev$slash$vg$count$slash$lv$count
sudo mkdir $slash$volumename
sudo mount -t xfs $slash$dev$slash$vg$count$slash$lv$count $slash$volumename
sudo cp /etc/fstab /etc/fstab.bkp
sudo echo "$slash$dev$slash$vg$count$slash$lv$count $slash$volumename   xfs defaults    0   2" >> /etc/fstab

                        count=$count+1
                done