#!/bin/bash
TMPL=$1
PWD=$(pwd)
DIR=/tmp/nix-templates
SOURCE_DIR="${DIR}/source"
TARGET_DIR=${DIR}/target

# clean up any previous data
set +ex
rm -Rf $DIR
set -ex

develop () {
	nix develop -c "echo" --show-trace --print-build-logs --verbose
}

check () {
	nix flake check --show-trace --print-build-logs --verbose
}

git_init() {
	git init
}

if [ "$TMPL" = "" ]; then
	# test the project
	check
else
	mkdir -p $DIR
	# prepare the source
	cp -r $PWD $SOURCE_DIR
	# any changes before the test must happen now
	(
		cd ${SOURCE_DIR}/${TMPL}
		sed -i 's|\(.*\)github:LovelaceAcademy/nix-templates?dir=\(.*\)|\1path:../\2|g' flake.nix
		nix flake lock
	)
	# prepare the target
	(
		mkdir -p $TARGET_DIR
		cd $TARGET_DIR
		git_init
		nix flake init -t "${SOURCE_DIR}#${TMPL}"
		# test the target
		check

		if [ "$TMPL" != "pix-ctl-full" ]; then
			# FIXME slow CI on pix-ctl-full develop
			echo "WARN: skipping slow develop on pix-ctl-full"
		else
			develop
		fi
	)
fi
