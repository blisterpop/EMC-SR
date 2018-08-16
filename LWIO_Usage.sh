isi_for_array -sn1-36 'ps auwx | egrep "lwio" | grep -v grep' | awk '$6 = $6/1024{print $1"\t"$4"\t"$6"MB"}'
