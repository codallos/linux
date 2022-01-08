
RED='\033[0;31m'
NC='\033[0m'


bateria=$(cat /sys/class/power_supply/BAT1/capacity)
(date '+%d/%^b/%Y %I:%M %p' & echo "$bateria %") | figlet -f /usr/share/figlet/smmono12

