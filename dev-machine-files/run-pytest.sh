#!/usr/bin/env bash

C1=10.79.168.98
C2=10.79.109.32
# GHOSTRIDER=10.50.66.207
GR=10.50.66.207
OSC_IP=10.50.66.214

# Source pytest from proper dir/git worktree
# source ~/.pytest.env
python3 -m pytest --controller-ip=$C1 --os-controller-ip=$GR --loglevel TRACE -s $*

# For 18.2.x, change above command to use python2
# python2 -m pytest --controller-ip=$C1 --os-controller-ip=$GHOSTRIDER --loglevel TRACE -s $*
