#!/bin/bash
#  <xbar.title>Mail</xbar.title>
#  <xbar.version>v1.0</xbar.version>
#  <xbar.author>Harrison Page</xbar.author>
#  <xbar.author.github>harrisonpage</xbar.author.github>
#  <xbar.desc>Show unread count from Mail.app in menubar</xbar.desc>
#  <xbar.dependencies>bash,osascript</xbar.dependencies>
#  <xbar.image>https://raw.githubusercontent.com/harrisonpage/unread/main/unread.png</xbar.image>
set -e

OUTPUT=$(osascript -e 'on run' -e 'tell application "System Events"' -e 'get name of every process whose name is "Mail"' -e 'if result is not {} then' -e 'tell application "Mail"' -e 'return the unread count of inbox' -e 'end tell' -e 'else' -e 'tell application "Mail"' -e 'set mailCount to the unread count of inbox' -e 'quit' -e 'return mailCount' -e 'end tell' -e 'end if' -e 'end tell' -e 'end run')

if [[ $OUTPUT -gt 0 ]]
then
  echo "${OUTPUT} 📬"
else
  echo "📪"
fi
echo "---"
echo "open Mail | bash=\"open\" param1=\"-a\" param2=\"Mail.app\" terminal=false refresh=true"
