# shimpack
Basic shims that will hide nc|netcat|ncat|curl|wget|keyword:
 - htop
 - lsof
 - netstat
 - ps
 - ss
 - top

 The `ls` shim will hide contents based on defined keyword  

 The `mount` shim will hide anything mounted from the `/proc` directory (used for proc hiding)  

 The `cat` and `vim` shims will select an actual binary if the user attempts to cat/vim any of the shims.
  - Example: attempting to `cat ls` will show some output from /bin/echo, instead of the ls shim


