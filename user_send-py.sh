#!/usr/bin/bash
#File: user_send-py.sh

#
# created by: Jim Lemanowicz
# last edit date:       08/16/2018
#

#variables
#
output_user='/ifs/isi1/jal2850_vol1/EMC-SR/total-UserID.txt'

# fomatting
echo "Total users" > $output_user
echo "-----------" >> $output_user
#total users
isi statistics client --totalby UserId --sort Ops | tail -n 1 >> $output_user 

# formatting
echo "" >> $output_user
echo "Epic Blob Service Connections" >> $output_user
echo "-----------------------------" >> $output_user
#epic stats
isi statistics client --sort Ops --nodes all | grep -i 'svc_blob\|TimeAvg' >> $output_user

# formatting
echo "" >> $output_user
echo "Total Sessions" >> $output_user
echo "-----------------------------" >> $output_user

# sessions
isi_for_array -s 'isi smb sessions list -a -z | wc -l' | cut -c 10-20 | awk '{total = total + $1}END{print total}' >> $output_user

# formatting
echo "" >> $output_user
echo "Heat List" >> $output_user
echo "-----------------------------" >> $output_user

# isi statistics heat
isi statistics heat list --sort=Ops --limit=20 --long >> $output_user

#email send
python /ifs/isi1/jal2850_vol1/EMC-SR/smtp-user-py.py 



