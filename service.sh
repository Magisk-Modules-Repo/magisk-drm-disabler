#!/system/bin/sh

# Copyright (C) 2020 Atrate <atrate@protonmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; version 3 of the License.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# We remove directiories in /data in this manner since doing overlays on /data is out of scope for Magisk
# -------------------------------------------------------------------------------------------------------
for DIR in "/data/drm" "/data/mediadrm" "/data/vendor/mediadrm" "/data/data/.drm" "/data/.dcmdrm"
do
    rm -r "$DIR" 2>/dev/null
done
exit 0
