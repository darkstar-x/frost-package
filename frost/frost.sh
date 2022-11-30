#!/usr/bin/env bash

###################################
# Author: Leonardi Melo           #
# Email: leonardimelo43@gmail.com #
# #################################

### COLORS
RED=$'\e[0;31m'
GRN=$'\e[0;32m'
YLW=$'\e[0;33m'
BLU=$'\e[0;34m'
MAG=$'\e[0;35m'
CYN=$'\e[0;36m'
END=$'\e[0m'

## GLOBAL VARIABLES
export pkg_ext="frost"
export version='0.1.0'

### Performance for UTF-8
export LC_ALL=C
export LANG=C

### FUNCTION
CHECK_PKG() {
  pkg_name="$@"

  # Check package extension
  if ! echo "$pkg_name" | grep "\b${pkg_ext}\b$"; then
    printf '%s\n' "${RED}The package format must be .${pkg_ext}${END}"
    return 1
  fi

  # Check white spaces
  if echo "$pkg_name" | grep -qE "[[:space:]]+"; then
    printf '%s\n' "${RED}Do not use spaces in the name.${END}"
    printf '%s\n' "${YLW}Exiting...${END}"
    return 1
  fi

  printf '%s\n' "${YLW}Using pkg_name: ${pkg_name}${END}"
  check_name=$(echo "${pkg_name}" | grep -o "-" | wc -l)

  if [ "$check_name" -lt '2' ] || [ "$check_name" -gt '2' ]; then
    printf '%s\n' "${RED}Error: package name is invalid.${END}"
    printf '%s\n' "${YLW}Example: package_name-build_version.${pkg_ext}${END}"
    return 1
  fi
  return 0
}

CREATE_PKG() {
  pkg_name="$1"

  if [ "$VERBOSE" = 1 ]; then
    if tar -cvf../${pkg_name} .; then
      printf '%b' "${GRN}The package has been created on ../${pkg_name}\n${END}"
    else
      printf "The package was not created\n"
      exit 1
    fi
  else
    if tar -cf ../${pkg_name} .; then
      printf '%b' "${GRN}The package has been created on ../${pkg_name}\n${END}"
      return 0
    else
      printf "The package was not created\n"
      exit 1
    fi
  fi
}

# Usage Mode
USAGE() {
  cat << EOF
    ${RED}FROST PACKAGE MANAGER${END} >> create - options

    ${YLW}--create, -c${END}
      -> Create a package with .frost. It needs to be in the main directory of the package.
      -> The package will be created a directory above.

    ${YLW}--help, -h${END}
      -> Instructions for use.
  
    ${YLW}--verbose, -v${END}

    Author: darkstar-x 
    Email: leonardimelo43@gmail.com
EOF
}

### Goto to help
if [ -z "$1" ]; then
  USAGE
fi

while [ -n "$1" ]; do
  case "$1" in
    --created|-c)
      CMD=$1
      shift
    ;;

    --verbose|-v)
      VERBOSE=1
      shift
    ;;

    *.frost)
      PKG=$1
      shift
    ;;

    --help|-v)
      USAGE
      exit 1
    ;;

    *)
      USAGE
      exit 1
    ;;
  esac
done

# START
case "$CMD" in
    --create|-c)
    if [ -z "$CMD" ]; then
      printf '%b' "${red}The package name is required.${end}\n"
      exit 1
    fi
    CHECK_PKG "$PKG" || exit 1
    CREATE_PKG "$PKG"
esac
