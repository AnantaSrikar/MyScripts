function temp()
{
	awk '{printf "CPU temp : %.3f °C\n", $1/1000}' /sys/class/thermal/thermal_zone0/temp
}

#this one is for showing the CPU temperature of my Raspi