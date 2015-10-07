# Create a subtitles file in SRT format with accurate timing
# displayed for each frame of the video
#
# Parameters:
#   duration - floating point number, total duration of the video in seconds
#   fps - floating point number, number of images per second of the video
#         (the frame rate is assumed to be constant)
#
# Reference:
# [1] SRT Subtitles
# http://www.matroska.org/technical/specs/subtitles/srt.html

function formatTime(milliseconds, # end of arguments
hours, minutes, seconds) {
  seconds = int(milliseconds / 1000)
  milliseconds -= int(seconds * 1000)
  minutes = int(seconds / 60)
  seconds -= minutes * 60
  hours = int(minutes / 60)
  minutes -= hours * 60
  return sprintf("%02d:%02d:%02d,%03d", hours, minutes, seconds, milliseconds)
}

BEGIN {
  currentTimeMs = 0
  frameDurationMs = 1000 / fps
  currentFrame = 0
  totalFrames = duration * fps

  while ( currentFrame < totalFrames ) {
    print currentFrame
    print \
      formatTime(currentTimeMs),
      "-->",
      formatTime(currentTimeMs+frameDurationMs) 
    print "Frame:", (1 + int(currentFrame % fps))
    print "Time:", formatTime(currentTimeMs)
    print

    currentFrame++
    currentTimeMs += frameDurationMs
  }
}
