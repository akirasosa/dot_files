#!/bin/sh

function androidScreenshot
{
  adb shell exit 2>/dev/null
  if [[ $? == 0 ]]; then
    dateString=`date +"%Y-%m-%d_%H.%M.%S"`
    fileName="ss_$dateString.png"
    adb shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > ~/Desktop/$fileName
  else
    echo "No android device connected."
  fi
}
