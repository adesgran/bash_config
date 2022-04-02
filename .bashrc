# ~/.bashrc: executed by bash(1) for non-login shells.

# Configs
export CURR_USR=adesgran
export USR_DIR=/mnt/nfs/homes/$CURR_USR


if [ -f ~/.mybash ]; then
    . ~/.mybash
fi
