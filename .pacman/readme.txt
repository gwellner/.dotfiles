However, it is likely foreign packages such as from the AUR or installed locally are present in the list. To filter out from the list the foreign packages, the previous command line can be enriched as follows:

Save:

pacman -Qq > ~/.pacman/package-list.txt

Reinstall:

pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort package-list.txt))

=== AUR ===

Save Aur Packages:

pacman -Qqm > ~/.pacman/aur-package-list.txt

Reinstall aur packages:

trizen -S --needed - < .pacman/aur-package-list.txt
