#!/system/bin/sh

# We remove directiories in /data in this manner since doing overlays on /data is out of scope for Magisk
# -------------------------------------------------------------------------------------------------------
for DIR in "/data/drm" "/data/mediadrm" "/data/vendor/mediadrm" "/data/data/.drm" "/data/.dcmdrm"
do
    rm -r "$DIR" 2>/dev/null
done
exit 0
