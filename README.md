# phone-photo-cleanup

## 1. Pull photos from phone

Plug in the phone, then run:

```sh
adb pull -a /sdcard/DCIM/Camera/. .
```

This will dump the contents of that folder into this one.

## 2. Check to see if we have the files stores in `~/Pictures`

You must install findutils first because we're using the `-printf` option in `find`:

```sh
brew install findutils
```

You'll also have to make sure your PATH includes the following so we can use `find` and not `gfind`:

```sh
PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
```

Run `./check.sh`

If a photo or video cannot be found in `~/Pictures`, it will print it out.

Run `DELETE=true ./check.sh` to cleanup files that we know can be found.

For the ones that can't be found, drag them over into the WebDAV folder: http://admin@raspberrypi:2342/originals/ (put them into the proper folder) - this will import them into photoprism and eventually Syncthing them into ~/Pictures.

In a few minutes you should be able to run `DELETE=true ./check.sh` again and it'll clear up the ones that have now been imported.

# 3. Cleanup photos from the phone

Open [OpenMTP](https://github.com/ganeshrvel/openmtp) and navigate to DCIM/Camera

Click to select all files and delete them.
There is no delete progress, so you just have to wait a while.
