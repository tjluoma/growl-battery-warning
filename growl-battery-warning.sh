#!/usr/bin/env zsh -f
# Purpose: use Growl to warn when your batter is below a certain percentage
#
# From:	Timothy J. Luoma
# Mail:	luomat at gmail dot com
# Date:	2020-06-28

	# what is the % rate that you want to warn at
WARNING_THRESHOLD='40'

NAME="$0:t:r"

if [[ -e "$HOME/.path" ]]
then
	source "$HOME/.path"
else
	PATH='/usr/local/scripts:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin'
fi

STATUS=($(pmset -g batt | tr "\012|%|'" ' ' | awk '{print $8" "$4}'))

	# if we are on A/C power power, exit without staying anything else
[[ "$STATUS[2]" = 'AC' ]] && exit 0

if [ "$STATUS[1]" -gt "$WARNING_THRESHOLD" ]
then
	# if we are above the warning threshold, exit without staying anything else
	exit 0
fi

if (( $+commands[growlnotify] ))
then

	growlnotify --sticky \
		--appIcon 'System Preferences' \
		--message "${WARNING_THRESHOLD}% Remains" \
		"Current Battery Threshold"

else

	echo "$NAME: 'growlnotify' not found in '$PATH'." >>/dev/stderr
	exit 1

fi

exit 0
#EOF
