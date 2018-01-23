#
# Regular cron jobs for the sublime package
#
0 4	* * *	root	[ -x /usr/bin/sublime_maintenance ] && /usr/bin/sublime_maintenance
