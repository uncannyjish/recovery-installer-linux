#!/usr/bin/env bash

clear
printf "\n================================================"
printf "\n Uncanny Recovery Installer 0.7 by @uncannyjish"
printf "\n================================================\n\n"

choices=("Install Recovery"
	 "Fix System Destroyed"
	 "Exit")
	 
devices=("Land"
	 "Santoni"
	 "Kenzo"
	 "Mido"
	 "Vince"
	 "Whyred"
	 "Tulip"
	 "Lavender"
	 "Violet"
	 "Ginkgo"
	 "Willow"
	 "Davinci"
	 "Raphael"
	 "Beryllium"
	 "Return to Main Menu")
	 
fix=("Ginkgo"
	 "Violet"
     "Return to Main Menu")
     
PS3="Enter your choice => "
	 
while [ "$M" != 0 ]; do
	printf "\nWhat do you want to do?\n\n"
	select C in "${choices[@]}"; do
		case "$C" in 
			"Install Recovery") printf "\n\n" 
				select D in "${devices[@]}" ; do
				case "$D" in 
					Land|Santoni|Kenzo|Mido|Vince|Whyred|Tulip|Lavender|Violet|Ginkgo|Willow|Beryllium) $SHELL "`dirname $0`/Bash/installer.sh" "${D,,}"
					clear
					break 2
					;;
					Raphael|Davinci) read -p "Indian Variant (y/n): " i
					case "$i" in
						y|Y) $SHELL "`dirname $0`/Bash/installer.sh" "${D,,}in"
						clear
						break 2;
						;;
						n|N) $SHELL "`dirname $0`/Bash/installer.sh" "${D,,}"
						clear
						break 2;
						;;
						*) printf "\n\nCan't you read?\n\n"
						break
						;;
					esac
					;;
					"Return to Main Menu") break 2
					;;
					*) printf "\n\nCan't you read?\n\n"
					break
					;;
				esac
				done
				;;
			"Fix System Destroyed") printf "\n\n"
				select D in "${fix[@]}" ; do
				case "$D" in 
					Ginkgo|Violet) $SHELL "`dirname $0`/Bash/fix.sh" "${D,,}"
					clear
					break 2
					;;
					"Return to Main Menu") break 2
					;;
					*) printf "\n\nCan't you read?\n\n"
					break
					;;
				esac
				done
				;;
			"Exit") printf "\n\nExiting....\n\n" 
				M=1
				break 2
				;;
			*) printf "\n\nCan't you read?\n\n"
				break
				;;
		esac
	done
done

exit 0
