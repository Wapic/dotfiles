#!/usr/bin/env python3
import subprocess

if __name__ == '__main__':
    songFile = open("song.txt", "r")
    song = songFile.readline()
    volumeFile = open("volume.txt", "r")
    volume = volumeFile.readline()
    
    if song == "":
        songFile = open("song.txt", "w")
        songFile.write(subprocess.run("spt pb -f '%t - %a' -s", shell=True, capture_output=True).stdout.decode("utf-8"))
    else:
        print(song)
    
    if volume == "":
        volumeFile = open("volume.txt", "w")
        volumeFile.write(subprocess.run("spt pb -f '%v' -s", shell=True, capture_output=True).stdout.decode("utf-8"))
    else:
        print(volume)

