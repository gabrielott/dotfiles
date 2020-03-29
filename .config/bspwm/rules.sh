#!/bin/sh

id="$1"
class="$2"
instance="$3"

case "$class" in
	'Hydrus Client')
		case "$(xprop -id "$id" WM_NAME | cut -d'"' -f2)" in
			'hydrus client media viewer') echo 'state=floating' ;;
			'hydrus main') echo 'locked=on' ;;
			*) echo 'focus=on desktop=DP-4:^3' ;;
		esac ;;
	'Anki')
		case "$(xprop -id "$id" WM_NAME | cut -d'"' -f2)" in
			'ユーザー 1 - Anki') echo 'desktop=DP-4:^2 locked=on' ;;
			'Dictionary') echo 'desktop=DVI-D-0:^1 locked=on' ;;
		esac ;;
	'qBittorrent')
		case "$(xprop -id "$id" WM_NAME | cut -d'"' -f2)" in
			'qBittorrent v'*) echo 'desktop=DVI-D-0:^2 locked=on' ;;
		esac ;;
	'pick-song') echo 'state=floating' ;;
esac
