#!/usr/bin/env bash
apt-get source linux
apt-get install pbuilder
source_dir="$(find . -maxdepth 1 -type d -name 'linux*')"
if [ ! -d "${source_dir}" ]; then
	echo "Err: Found 0 or multiple directories: ${source_dir}"
	exit 1
fi
patches_dir="${source_dir}/debian/patches/"
cp terratec-cinergy-tc2.patch "${patches_dir}"
echo "terratec-cinergy-tc2.patch" >> "${patches_dir}/series"
dpkg-source -b "${source_dir}"
dsc_file="$(find . -maxdepth 1 -type f -name 'linux*.dsc')"
if [ ! -f "${dsc_file}" ]; then
	echo "Err: Found 0 or multiple dsc files: ${dsc_file}"
	exit 1
fi
pbuilder build "${dsc_file}"
