You're welcome to create pull requests and issues for bug reports or feature requests.

If creating a PR, please make sure to do it on GitLab.

## Code style
Please use 4 spaces for indentation.

When writing code, please put opening and closing brackets in separate lines, like this:
```
int std::foo()
{
    bar();
}
```

When writing bash code, please put functional words like `then` and `do` in separate lines, like this:
```
if true
then
    echo "false"
fi
```

## Testers welcome!

If you're interested in becoming a tester, please send me an e-mail or PM with your device(s) model, Android version and any other relevant info and I'll get back to you.

If trying to remove DRM libs, please remember that some libraries relate to Digital Restrictions Management while some refer to Direct Rendering Management. Removing the latter will cause graphics breakages through the whole system and possibly bootloops.

## Libraries that have been tested and cause a bootloop (remember the above notice — Rendering vs Restrictions):
```
android.hardware.drm@1.0.so
android.hardware.drm@1.1.so
android.hardware.drm@1.2.so
libdrm.so
libdrmframework.so
libmediardm.so
libmediardmmetrics_lite.so
```

These DRM-related files cannot be natively replaced. Instead, the symlinks pointing to them are replaced in `/system/etc/firmware` and `/system/vendor/firmware`.
```
firmware
└── image/
    ├── dxhdcp2.b00
    ├── dxhdcp2.b01
    ├── dxhdcp2.b02
    ├── dxhdcp2.b03
    ├── dxhdcp2.b04
    ├── dxhdcp2.b05
    ├── dxhdcp2.b06
    ├── dxhdcp2.mdt
    ├── widevine.b01*
    ├── widevine.b02*
    ├── widevine.b03*
    ├── widevine.b04*
    ├── widevine.b05*
    ├── widevine.b06*
    └── widevine.mdt*

persist-lg
└── firmware/
    ├── widevine.b01*
    ├── widevine.b02*
    ├── widevine.b03*
    ├── widevine.b04*
    ├── widevine.b05*
    ├── widevine.b06*
    └── widevine.mdt*
```

Directories used for DRM that cannot yet be replaced:
```
/efs/drm
/persist/drm
/persist-lg/lgdrm
/persist-lg/widevine
/persist-lg/data/widevine
```
