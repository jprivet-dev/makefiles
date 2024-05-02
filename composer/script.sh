#!/usr/bin/env bash

# Usage:
# $ . script.sh

[ -e composer.lock ] && rm composer.lock
[ -e composer.json ] && rm composer.json
[ -d vendor ] && rm -Rf vendor
cp composer.json.dist composer.json

echo
echo "--- 1 --- First installation"
echo
ls -ls composer.json
echo
echo "> composer.json"
cat composer.json
echo
echo ">>> make install (1)"
make install
sleep 1
echo
echo ">>> make install (2)"
make install
sleep 1

echo
echo "--- 2 --- Change the description"
echo
sed -i 's/My description A/My description B/g' composer.json
ls -ls composer.json
ls -ls composer.lock
ls -ls vendor
echo
echo "> composer.json"
cat composer.json
echo
echo ">>> make install (1)"
make install
sleep 1
echo
echo ">>> make install (2)"
make install
sleep 1

echo
echo "--- 3 --- Remove composer.lock"
echo
[ -e composer.lock ] && rm composer.lock
ls -ls composer.json
ls -ls vendor
echo
echo "> composer.json"
cat composer.json
echo
echo ">>> make install (1)"
make install
sleep 1
echo
echo ">>> make install (2)"
make install
sleep 1

echo
echo "--- 4 --- Remove vendor folder"
echo
[ -d vendor ] && rm -Rf vendor
ls -ls composer.json
ls -ls composer.lock
echo
echo "> composer.json"
cat composer.json
echo
echo ">>> make install (1)"
make install
sleep 1
echo
echo ">>> make install (2)"
make install
sleep 1

echo
echo "--- 5 --- Remove picocss from require"
echo
sed -i 's/"picocss\/pico": "\^2\.0"//g' composer.json
ls -ls composer.json
ls -ls composer.lock
ls -ls vendor
echo
echo "> composer.json"
cat composer.json
echo
echo ">>> make install (1)"
make install
sleep 1
echo
echo ">>> make install (2)"
make install
sleep 1
