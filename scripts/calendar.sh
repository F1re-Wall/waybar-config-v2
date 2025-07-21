#!/bin/bash

current_day=$(date +"%d" | sed 's/^0//')
current_month=$(date +"%m")
current_year=$(date +"%Y")

calendar=$(ncal "$current_month" "$current_year")

highlighted_calendar=$(sed "s/\<$current_day\>/<span background='#5e81ac' foreground='#eceff4'>&<\/span>/" <<< $calendar)

if pgrep "rofi"; then
	pkill "rofi"
else
	echo -e "$highlighted_calendar" | rofi -dmenu -no-input -mouse -markup-rows -p "Calendar" -theme '~/.config/rofi/calendar.rasi'
fi

#<span background='#5e81ac' foreground='#eceff4'>&<\/span>/
