#!/bin/sh
# Generate a subtitles file in SRT format to display accurate timing
#
# Parameters:
#   $1 - string, relative path to the movie file
#   $2 - floating point number, the duration of the video in seconds
#   $3 - floating point number, frame rate of the video
#
# Output:
#   Creates a .srt file next ot the movie file, with the time of each frame

usage='Usage: ./srt4fps.sh movieFileName movieDuration frameRate'

cd "$(dirname "$0")"

# Print given error message on standard error and exit
#
# Parameter:
#   $1 - string, error message.
#
# Returns:
#   the error code from the previous command
die()
{
  die_code="$?"
  die_message="$1"
  echo "$die_message" 1>&2
  exit "$die_code"
}

test -n "$1" -a -n "$2" -a -n "$3" || die "$usage"

if test -f "$1"
then
  output="${1%.*}.srt"
  echo "Create subtitles file $output"
  awk -f srt4fps.awk -v duration="$2" -v fps="$3" > "$output"
else
  die "No video file found at $1"
fi
