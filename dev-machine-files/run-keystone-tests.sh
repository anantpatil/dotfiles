#!/usr/bin/env bash

sudo rm -rf /tmp/py3-client-v1.0
cd /tmp/
cp /mnt/files/jenkins_venv/openstack/py3-client-v1.0.tar.gz /tmp/py3-client-v1.0.tar.gz
tar -xf /tmp/py3-client-v1.0.tar.gz
virtualenv -p python3.7 py3-client-v1.0
/tmp/py3-client-v1.0/bin/replace_shebang.sh
dirname /tmp/py3-client-v1.0/bin/replace_shebang.sh
cd /tmp/py3-client-v1.0/bin
pwd
DIRNAME=/tmp/py3-client-v1.0/bin
grep -lrH -E '^\#\!.*\/bin\/python3*$' /tmp/py3-client-v1.0/bin/
xargs -r sed -i -E 's/^\#\!.*bin\/python3*$/\#\!\/usr\/bin\/env python/g'
source /tmp/py3-client-v1.0/bin/activate
deactivate nondestructive
unset -f pydoc
hash -r
unset VIRTUAL_ENV
VIRTUAL_ENV=/tmp/py3-client-v1.0
export VIRTUAL_ENV
_OLD_VIRTUAL_PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
PATH=/tmp/py3-client-v1.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
export PATH
_OLD_VIRTUAL_PS1=$PS1
basename /tmp/py3-client-v1.0
PS1='(py3-client-v1.0) '
export PS1

pytest $ws/test/avitest/functional/controller/users/test_keystone_auth.py --testbed /opt/adminuser/tb-conf-files/ananta_testbed.conf --loglevel TRACE -v -s --robot_html robot_func_os.html --techsupport --platform openstack

deactivate
PATH=$_OLD_VIRTUAL_PATH
export $PATH
PS1=$_OLD_VIRTUAL_PS1
export PS1
