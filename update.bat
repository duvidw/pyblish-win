:: Update to the latest version of Pyblish for Windows
::
:: This update applies to all of Pyblish and it's dependencies.

@echo off
pushd %~dp0
git reset --hard
git pull
git submodule update --init --recursive
popd
pause
