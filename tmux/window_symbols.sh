#!/bin/bash
echo "$1" | sed \
-e 's/*//' \
-e 's/-/ﭢ/' \
-e 's/#/﮻/' \
-e 's/!//' \
-e 's/~/ﮊ/' \
-e 's/M//' \
-e 's/Z//'

#* 	Denotes the current window.
#- 	Marks the last window (previously selected).
## 	Window is monitored and activity has been detected.
#! 	A bell has occurred in the window.
#~ 	The window has been silent for the monitor-silence interval.
#M 	The window contains the marked pane.
#Z 	The window's active pane is zoomed.

