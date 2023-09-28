#( lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1
#[ "${PATH#*$HOME/bin:}" == "$PATH" ] && export PATH="$HOME/bin:$PATH"
