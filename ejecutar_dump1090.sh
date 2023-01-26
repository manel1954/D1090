#!/bin/bash

SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_BlueDV.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_dump1090.sh'" /home/pi/Abrir_BlueDV.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_AVION_ON.png" /home/pi/Abrir_BlueDV.desktop
sed -i "10c Name[es_ES]=Cerrar Dump1090" /home/pi/Abrir_BlueDV.desktop

cd /home/pi
sudo cp Abrir_BlueDV.desktop /home/pi/Desktop
sudo rm /home/pi/Abrir_BlueDV.desktop
cd /home/pi/dump1090

stick=$(awk "NR==40" /home/pi/status.ini)
puerto=$(awk "NR==42" /home/pi/status.ini)
ppm=$(awk "NR==44" /home/pi/status.ini)
http=$(awk "NR==46" /home/pi/status.ini)
gain=$(awk "NR==48" /home/pi/status.ini)

if [ "$stick" = 'RSP1' ];then
xterm -geometry 88x17+22+0 -bg brown -fg white -fa ‘verdana’ -fs 9x -T DUMP1090 -e sudo ./dump1090 --enable-agc --net --interactive --dev-sdrplay --net-ro-port $puerto --ppm $ppm --net-http-port $http

elif [ "$gain" = 'autogain' ];then
xterm -geometry 88x17+22+0 -bg brown -fg white -fa ‘verdana’ -fs 9x -T DUMP1090 -e sudo ./dump1090 --enable-agc --net --interactive --net-ro-port $puerto --gain -10 --ppm $ppm --net-http-port $http
else
xterm -geometry 88x17+22+0 -bg brown -fg white -fa ‘verdana’ -fs 9x -T DUMP1090 -e sudo ./dump1090 --enable-agc --net --interactive --net-ro-port $puerto --ppm $ppm --net-http-port $http
fi













cd /home/pi/Desktop
sudo cp Abrir_BlueDV.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sh ejecutar_dump1090.sh'" /home/pi/Abrir_BlueDV.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_AVION_OFF.png" /home/pi/Abrir_BlueDV.desktop
sed -i "10c Name[es_ES]=Abrir Dump1090" /home/pi/Abrir_BlueDV.desktop
#sed -i "7c MMDVMBM=OFF" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_BlueDV.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_BlueDV.desktop
