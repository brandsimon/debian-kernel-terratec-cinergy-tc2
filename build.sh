#!/usr/bin/env bash
apt-get source linux
apt-get build-dep linux
patches_dir="$(ls -d linux-*/debian/patches)"
source_dir="$(dirname $(dirname "${patches_dir}"))"
if [ ! -d "${patches_dir}" ]; then
	echo "Err: Found 0 or multiple directories: ${patches_dir}"
	exit 1
fi
cp terratec-cinergy-tc2.patch "${patches_dir}"
echo "terratec-cinergy-tc2.patch" >> "${patches_dir}/series"
dpkg-source -b "${source_dir}"
dsc_file="$(ls "${source_dir/-/_}*.dsc")"
if [ ! -d "${dsc_file}" ]; then
	echo "Err: Found 0 or multiple dsc files: ${dsc_file}"
	exit 1
fi
pbuilder build "${dsc_file}"
