# ~/.zprofile
#
# Fix for Java applications in dwm

export _JAVA_AWT_WM_NONREPARENTING=1

export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
		startx
fi
