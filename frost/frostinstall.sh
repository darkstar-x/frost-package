#/usr/bin/env sh 

#Dev: HXVRMXNV
#Version: 1.0.0
#Email: leonardimelo43@gmail.com

#Desc: Install the package generated with frostpkg and generate a track file

### Config
TRACK='/var/log/frost'

#creating the tracker directory
[ ! -d "$TRACK" ] && mkdir -v "$TRACK"

### Functions
INSTALL()
{
  local package="$1" #package name

  printf '%b' "||||| 0% initialize package instalation: $package\n"

  tar xvf "$package" -C /ssf/virtual
}


case $1 in
  -i|--install)
      shift
      if [ -e "$1" ]; then
        INSTALL $1
      else
        echo "Package $1 is not exitent"
        exit 1
      fi
    ;;
esac
