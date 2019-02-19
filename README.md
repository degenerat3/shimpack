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

 The `cat` shim will show random random output if the user tries to "cat" any of the shims.
  - Example: attempting to `cat ls` will show some output from /dev/urandom, instead of the ls shim


