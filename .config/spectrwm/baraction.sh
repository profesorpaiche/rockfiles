#!/bin/bash
# baraction.sh for spectrwm status bar
# From DistroTube https://www.youtube.com/watch?v=XK3KpLZdoO4&t=192s
# From DistroTube https://www.youtube.com/watch?v=hGwoRyykifw&t=219s

## DATE
dte() {
    dte=$(date +"%F %H:%M")
    echo -e "+@bg=0;+@fg=0; | +@bg=0;+@fg=7; $dte"
}

## SOLID DISK
sdd() {
    sdd=$(df -h | awk 'NR==4{print $5}')
    echo -e "SDD: $sdd"
}

## HARD DISK

hdd() {
    hdd=$(df -h | awk '/sdb1/ {print $5}')
    echo -e "HDD: $hdd"
}

## RAM
mem() {

    # mem=`free | awk '/Mem/ {printf "%d MiB / %d MiB\n", $3 / 1024.0, $2 / 1024.0 }'`
    mem=$(free | awk '/Mem/ {printf "%d\n", $3 / $2 * 100}')

    [ $mem -gt 75 ] && mem_bg="+@bg=1;" || mem_bg="+@bg=0;"
    [ $mem -gt 75 ] && mem_fg="+@fg=0;" || mem_fg="+@fg=7;"

    echo -e "+@bg=0;+@fg=0; | $mem_bg$mem_fg MEM: $mem%"

}

## CPU 
cpu() {

    read cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 0.5
    
    read cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))

    [ $cpu -gt 50 ] && cpu_bg="+@bg=1;" || cpu_bg="+@bg=0;"
    [ $cpu -gt 50 ] && cpu_fg="+@fg=0;" || cpu_fg="+@fg=5;"

    echo -e "+@bg=0;+@fg=0; | $cpu_bg$cpu_fg CPU: $cpu%"

}

## VOLUMEN
vol() {

    vol=$(amixer -c 1 get Master | awk -F'[][]' 'END{ print $2 }' | cut -d'%' -f 1)

    [ $vol -gt 80 ] && vol_bg="+@bg=1;" || vol_bg="+@bg=0;"
    [ $vol -gt 80 ] && vol_fg="+@fg=0;" || vol_fg="+@fg=7;"
    
    echo -e "+@bg=0;+@fg=0; | $vol_bg$vol_fg VOL: $vol%"

}

## BATERIA
bat(){

    bat=$(cat /sys/class/power_supply/BAT0/capacity)

    [ $bat -lt 25 ] && bat_bg="+@bg=1;" || bat_bg="+@bg=0;"
    [ $bat -lt 25 ] && bat_fg="+@fg=0;" || bat_fg="+@fg=5;"

    echo -e "+@bg=0;+@fg=0; | $bat_bg$bat_fg BAT: $bat%"

}

## TEMPERATURA
tmp() {

    tmp=$(sensors | awk '/temp1/ {print $2}')
    tmp_con=$(echo $tmp | cut -d'.' -f 1 | cut -d'+' -f 2)

    [ $tmp_con -gt 50 ] && tmp_bg="+@bg=1;" || tmp_bg="+@bg=0;"
    [ $tmp_con -gt 50 ] && tmp_fg="+@fg=0;" || tmp_fg="+@fg=5;"

    echo -e "+@bg=0;+@fg=0; | $tmp_bg$tmp_fg TMP: $tmp"

}

## MENSAJE
SLEEP_SEC=3
#loops forever outputting a line every SLEEP_SEC secs
while :; do
    # echo "+@fg=1; +@fn=1;💻+@fn=0; $(cpu) +@fg=0; | +@fg=2; +@fn=1;💾+@fn=0; $(mem) +@fg=0; | +@fg=3; +@fn=1;💿+@fn=0; $(sdd) +@fg=0; | +@fg=4; +@fn=1;🔈+@fn=0; $(vol) +@fg=0; |"   
    # echo "+@fg=0; | +@fg=5; $(cpu) +@fg=0; | +@fg=7; $(mem) +@fg=0; | +@fg=5; $(tmp) +@fg=0; | +@fg=7; $(vol) +@fg=0; | +@fg=5; $(bat) +@fg=0; | +@fg=7; $(dte)"
    echo " $(cpu) $(mem) $(tmp) $(vol) $(bat) $(dte)"
    sleep $SLEEP_SEC
done

# 
