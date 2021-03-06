#!/bin/sh
#!/bin/bash
#*-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**
# 
#       Script:         check_ram.sh
#       Usage:          ./check_ram.sh
#       Created By:     Hariprasath Ravichandran
#       Created Date:   25/10/2014
#       E-mail:         udthariprasath@gmail.com
#       License:        GNU GPL
#       More Plugins:   https://github.com/udthariprasath/
#
#*-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**-**
SHELL=/bin/bash
PATH=/usr/lib/qt-3.3/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
warn=90
full=`free | grep Mem | sed -r 's/\ +/\ /g' | cut -d \  -f 2`
free=`free | grep Mem | sed -r 's/\ +/\ /g' | cut -d \  -f 4`
use=$(( ($free * 100) / $full ))
if [ $use \< $warn ]; then
        echo "RAM OK - $use% free memory | $use% free memory"
        exit 0
 elif [ $use \> $warn ]; then
        echo "RAM CRITICAL - $use% free memory | $use% free memory"
        exit 2
 else
        echo "Unknown"
        exit 3
fi
