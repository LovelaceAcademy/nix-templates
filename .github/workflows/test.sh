#!/bin/sh
TMPL=$1
PWD=$(pwd)
TEST_DIR=.test-project
TMP_DIR=/tmp/nix-templates

function check () {
	nix flake check --show-trace
}

# clean up any previous data
set +ex
rm -Rf $TMP_DIR
rm -Rf $TEST_DIR
set -ex

if [ "$TMPL" = "" ]; then
	# test the project
	check
else
	# test the template
	cp -Rf . $TMP_DIR
	FILE=$TMP_DIR/${TMPL}/flake.nix
	sed -i "s|github:LovelaceAcademy/nix-templates|path:$PWD|g" $FILE
	mkdir $TEST_DIR
	(
		cd $TEST_DIR
		git init
		nix flake init -t "${TMP_DIR}#${TMPL}"
		check	
	)
fi
