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

# Thanks to Jman420 for these volume input functions
# --------------------------------------------------
keytest() 
{
    ui_print "- Vol Key Test -"
    ui_print "   Press Vol Up:"
    (/system/bin/getevent -lc 1 2>&1 | /system/bin/grep VOLUME | /system/bin/grep " DOWN" > "$TMPDIR"/events) || return 1
    return 0
}

choose() 
{
    #note from chainfire @xda-developers: getevent behaves weird when piped, and busybox grep likes that even less than toolbox/toybox grep
    while (true); do
        /system/bin/getevent -lc 1 2>&1 | /system/bin/grep VOLUME | /system/bin/grep " DOWN" > "$TMPDIR"/events
        if (`cat "$TMPDIR"/events 2>/dev/null | /system/bin/grep VOLUME >/dev/null`); then
            break
        fi
    done
    if (`cat "$TMPDIR"/events 2>/dev/null | /system/bin/grep VOLUMEUP >/dev/null`); then
        return 1
    else
        return 0
    fi
}

# Check whether using a legacy device
# -----------------------------------
if keytest; then
    FUNC=choose
else
    FUNC=false
fi

# Ask user for MDD mode
# ---------------------
ui_print " "
ui_print "--- Select DRM removal mode ---"
ui_print "  Vol+ = FULL  "
ui_print "  Vol- = LIGHT (use if FULL causes issues)  "
ui_print " "

# Remove directories and set REPLACE according to mode
# ----------------------------------------------------
if "$FUNC"; then
    ui_print "Selected: LIGHT mode"
    #   find "$MODPATH/system" -mindepth 1 ! -regex '^'"$MODPATH"'/system/bin\(/.*\)?' ! -regex '^'"$MODPATH"'/system/vendor/lib\(/.*\)?' -delete 2>/dev/null
    #   The above would be a "smart" way of doing what's going to be done below. It is unreliable, though, since the find binary in Android seems to be very old.
    rm -r "$MODPATH/system/etc" "$MODPATH/system/bin" "$MODPATH/system/framework" "$MODPATH/system/lib" "$MODPATH/system/lib64"
    REPLACE="
    /system/app/LGDrm
    /system/etc/drm
    "
else
    ui_print "Selected: FULL mode"
    REPLACE="
    /system/app/LGDrm
    /system/etc/drm
    /system/lib/drm
    /system/lib64/drm
    /system/vendor/lib/mediacas
    /system/vendor/lib64/mediacas
    /system/vendor/lib/mediadrm
    /system/vendor/lib64/mediadrm
    "
fi
