# Milliseconds In Subtitles

A shell script to generate subtitles to display accurate timing
(including milliseconds) in videos.

## Reference

Kudos to [How to Display Milliseconds in Most Video Players (2010)]
(http://graphics.cs.columbia.edu/wiki/doku.php?id=wiki:millisecondsinvideoplayer)
by [Steve Henderson](mailto:henderso@cs.columbia.edu).

## Usage

The script accepts three parameters, in this order:

1. the name of the video file - the subtitles file will be saved in the
   same location, with the extension replaced with '.srt'
2. the duration of the video in seconds - one subtitle will be generated for
   each frame of the video over this duration (hint: this file will be large)
3. the frame rate of the video (number of images per second) - each subtitle
   will display the frame number as well as the time in hh:mm:ss.mmm format.

## Example

```sh
$ ./srt4fps.sh video.avi 1245 30
```
