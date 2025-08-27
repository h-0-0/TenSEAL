#!/bin/sh

set -e

# Use Debian archive mirrors for EOL buster and disable validity checks
sed -i 's|deb.debian.org/debian-security|archive.debian.org/debian-security|g' /etc/apt/sources.list
sed -i 's|deb.debian.org/debian|archive.debian.org/debian|g' /etc/apt/sources.list
printf 'Acquire::Check-Valid-Until "false";\n' > /etc/apt/apt.conf.d/99no-check-valid-until

apt update -y
apt install wget curl git build-essential automake libtool libtool-bin clang -y

export CC=clang
export CXX=clang++

python -m pip install --upgrade pip
# Install CMake via pip to support both x86_64 and aarch64, pin to <4 to avoid policy breaks
pip install --no-cache-dir 'cmake<4'
pip install -r requirements_dev.txt
pip install setuptools wheel twine auditwheel

cmake --version
