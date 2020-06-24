#!/usr/bin/expect -f

set timeout -1
spawn sudo apt -y install xfce4 xfce4-goodies
expect "Country of origin for the keyboard:"
send -- "31\r"
expect "Keyboard layout:"
send -- "1\r"
expect "Default display manager:"
send -- "1\r"

expect eof
