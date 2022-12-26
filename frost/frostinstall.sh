#!/usr/bin/env sh 

######################################################################
# Author: Leonardi Melo                                              #
# Version: 1.0.0                                                     #
# Email: leonardimelo43@gmail.com                                    #
# Install the package generated with frost and generate a track file #
# ####################################################################

### Config Package Tracker
TRACK='/var/log/frost'

### Creating the tracker directory
[ ! -d "$TRACK" ] && mkdir -v "$TRACK"

### Function Scope Declaration

INSTALL() # Install Package
{
  local package="$1" #package name

  printf '%b' "initialize package instalation: $package\n"

  tar xvf "$package" -C /ssf/virtual

  return 0
}

### User check params
case $1 in
  -i|--install)
      shift
      if [ -e "$1" ]; then
        INSTALL $1 # Call install function
      else
        echo "Package $1 is not exitent"
        exit 1
      fi
    ;;
esac
