#!/bin/bash
ROOTFS="lucid64"
ROOTFS_PATH="/var/vcap/packages/rootfs_$ROOTFS"


case $1 in
  "" )
    echo "Usage: ./chroot.sh 'apt-get install vim -y"
    exit
  ;;
esac

script=$1
unshare -m $SHELL <<EOS
  chroot $ROOTFS_PATH env -i $(cat $chroot/etc/environment) http_proxy=${http_proxy:-} bash -e -c "$script"
EOS
