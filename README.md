# phone-photo-cleanup

Open [OpenMTP](https://github.com/ganeshrvel/openmtp) and navigate to DCIM/Camera

Multiselect a few hundred photos (this is slow and buggy right now)

Drag them over to `./`

Run `./check.sh`

If a photo or video cannot be found in `~/Pictures`, it will print it out.

Run `DELETE=true ./check.sh` to cleanup files that we know can be found.

For the ones that can't be found, drag them over into the WebDAV folder: http://admin@raspberrypi:2342/originals/ (put them into the proper folder) - this will import them into photoprism and eventually Syncthing them into ~/Pictures.

In a few minutes you should be able to run `DELETE=true ./check.sh` again and it'll clear up the ones that have now been imported.

Now go back to OpenMTP, reselect the same number of pictures and click delete.
There is no delete progress, so you just have to wait a while. 
I found the best way is to look at the name of the picture after the delete selection and wait until that is at the top of the list, then you know the delete has finished.
If you attempt to do any other selection/moves whilst the delete is in progress, they'll fail silently.
