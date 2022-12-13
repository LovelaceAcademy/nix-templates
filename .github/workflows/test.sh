#!/bin/sh
PWD=$(pwd)
TEST_DIR=.test-project
TMP_DIR=/tmp/nix-templates
set +ex
rm -Rf $TMP_DIR
rm -Rf $TEST_DIR
set -ex
nix flake check --show-trace
cp -Rf . $TMP_DIR
FILE=$TMP_DIR/nix/template/flake.nix
sed -i "s|github:LovelaceAcademy/nix-templates|path:$PWD|g" $FILE
mkdir $TEST_DIR
(
	cd $TEST_DIR
	git init
	nix flake init -t $TMP_DIR
	nix flake check --show-trace
)
