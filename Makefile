
default:
	@echo doing setup, z3 needs to be in cur dir of wherever you run vargo
	nix develop -c fish  ./shell-setup.sh
