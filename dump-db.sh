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
    exit 1
}

function show_help {
	echo "Usage: `basename $0` <command>"
	echo "    info                           available packages found on device"
    echo "    list <package-name>            list all files inside the data directory of <package-name>"
    echo "    dump <package-name> <file>     dump <file> from inside data directory of <package-name>"
    echo ""
}

########## function ############
function list_package {
    echo "Packages found on device:"
    adb shell 'ls -d /data/data/*  | cut -d / -f 4'
    response=$?
    if [ $response -eq 127 ]; then
		fatal "adb is not installed"
	elif [ $response -ne 0 ]; then
		fatal "No device or multiple devices attached to adb"
	fi
    exit 0
}

function list_package_files {
	name=$1
	echo "files found on $name:"
    adb shell 'ls -d /data/data/$name/*  | cut -d / -f 5'
    response=$?
    if [ $response -eq 127 ]; then
		fatal "adb is not installed"
	elif [ $response -ne 0 ]; then
		fatal "No device or multiple devices attached to adb"
	fi
    exit 0
}

########## main ############

while [ $# -gt 0 ]; do
    case "$1" in
        help)
            show_help
            exit 0
            ;;
        info)
			list_package
			;;
        list)
			shift
			list_package_files
			exit 0
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

show_help
exit 1
