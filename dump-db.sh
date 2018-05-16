#!/bin/bash


######### Utility #############

end="\033[0m"
black="\033[0;30m"
red="\033[0;31m"
yellow="\033[0;33m"
green="\033[0;32m"

function info {
  echo -e "${black}${1}${end}"
}

function warn {
  echo -e "${yellow}${1}${end}"
}

function error {
  echo -e "${red}${1}${end}"
}

function success {
  echo -e "${green}${1}${end}"
}

function fatal {
    error "$1"
    echo ""
    exit
}

function show_help {
	echo "Usage: `basename $0` <command>"
	echo "    info                           available packages found on device"
    echo "    list <package-name>            list all files inside the data directory of <package-name>"
    echo "    dump <package-name> <file>     dump <file> from inside data directory of <package-name>"
    echo ""
}

########## function ############


########## main ############

if [ $# -eq 0 ]; then
	show_help
	exit 1
fi

while [ $# -gt 0 ]; do
    case "$1" in
        help)
            show_help
            exit 0
            ;;
        info)
			;;
        list)
            ;;
        dump)
            ;;
        *)
			show_help
            exit 1
            ;;
    esac
    shift
done
