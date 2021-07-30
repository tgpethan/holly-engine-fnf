#!/bin/bash

# Define da functions
print_help () {
	echo " ======- Stupid build script v69.420 -======"
	echo ""
	echo "   -c --clean : Perform a clean build"
	echo ""
	echo " ==========================================="
}

build_dat_shit () {
	case $1 in
		clean)
			echo "Performing clean build"
			rm export/release/linux/bin/assets -r
			;;
		*)
			echo "Performing dirty build, if you want assets to update you will need to perform a clean build"
			;;
	esac
	lime build linux
	lime run linux
}

# Check da args
case $1 in
	--help) print_help ;; -h) print_help ;;
	
	-c) build_dat_shit clean ;; --clean) build_dat_shit clean ;;

	*)
		build_dat_shit
		;;
esac