#/usr/bin/env sh 

#Dev: HXVRMXNV
#Version: 1.0.0
#Email: leonardimelo43@gmail.com

#Desc: Install the package generated with frostpkg and generate a track file

### Config
TRACK='/var/log/frost'

#creating the tracker directory
[ ! -d "$TRACK" ] && mkdir -v "$TRACK"

case $1 in
  -i|--install)
      shift
    ;;
esac
