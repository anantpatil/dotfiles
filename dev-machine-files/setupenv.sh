#!/usr/bin/env bash

set -x
set -e

cd $ws
export LD_LIBRARY_PATH=$ws/build/lib

cp /mnt/files/openstack/eng/setup_env_vmw.py $ws/test/robot/new/lib/tools/

# cd $ws/test/robot/new/lib/tools/

# Make sure your tb file is correct... verify the details like URL,
# host, storage etc from the DC
# python setup_env.py -n /opt/adminusedr/tb-conf-files/ananta_tb_2_working_india_dc.conf -o /mnt/builds/17.2.12/ci-build-17.2.12-9128


# Update ovftool
sudo /bin/bash /mnt/files/VMware-ovftool-4.3.0-7948156-lin.x86_64.bundle 
export PYTHONHTTPSVERIFY=0
# python test/robot/new/lib/tools/setup_env.py -n ~/tb-conf-files/ananta_testbed.conf -o /mnt/builds/20.1.1/last-good-smoke/ -u aviuser1 -p AviUser1234\!. --parent_folder Anant
# python3 test/robot/new/lib/tools/setup_env_vmw.py -n ~/tb-conf-files/ananta_testbed.json -o /mnt/builds/20.1.1/last-good-smoke/ -u aviuser1 -p AviUser1234\!. --parent_folder Anant
# python3 test/robot/new/lib/tools/setup_env_vmw.py -n ~/tb-conf-files/ananta_testbed_c2.json -o /mnt/builds/18.2.6/ci-build-18.2.6-9134/ -u aviuser1 -p AviUser1234\!. --parent_folder Anant
python3 test/robot/new/lib/tools/setup_env_vmw.py -n ~/tb-conf-files/ananta_testbed_c22.json -o /mnt/builds/18.2.6/ci-build-18.2.6-9134/ -u aviuser1 -p AviUser1234\!. --parent_folder Anant
# python test/robot/new/lib/tools/setup_env.py -n ~/tb-conf-files/ananta_testbed.conf -o $ws/build/ -u aviuser1 -p AviUser1234\!. --parent_folder Anant
# python test/robot/new/lib/tools/setup_env.py -n ~/tb-conf-files/ananta_testbed.conf.us-dc -o $ws/build/ -u aviuser1 -p AviUser1234\!. --parent_folder Anant
# python test/robot/new/lib/tools/setup_env.py -n ~/tb-conf-files/ananta_testbed.conf.us-dc -o /mnt/builds/eng/last-good-smoke/ -u aviuser1 -p AviUser1234\!. --parent_folder Anant

cd -
