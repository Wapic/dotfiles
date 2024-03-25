#!/usr/bin/env python3
import subprocess
import sys

def main():
    if len(sys.argv) > 1:
        url, ff = sys.argv[1], sys.argv[2]
    else:
        url, ff = input("enter url: "), input("file format: ")

    audioFormats = ("mp3", "m4a", "flac", "ogg", "wav", "aac")

    cmd = ["yt-dlp", "-o", "/mnt/nvssd/yt-dl/%(title)s.%(ext)s", "-f", "mp4", url]
    if ff in audioFormats:
        cmd.extend(["-x", "--audio-format", ff])

    subprocess.run(cmd)

if __name__ == "__main__":
    main()
