#!/usr/bin/env python3
import subprocess

def getUrl():
    return input("enter url: ")

def getFileFormat():
    return input("file format: ")

def downloadVideo(url, ff):
    cmd = f"yt-dlp -o /home/wapic/yt-dl/%\(title\)s.%\(ext\)s {url}"
    args = " -f mp4"
    if ff != "mp4":
        args += f" -x --audio-format {ff}"
    subprocess.run(cmd + args, shell=True)

def init():
    url = getUrl()
    if url == "":
        print("please enter a url.")
        init()
    ff = getFileFormat()
    if ff == "":
        print("no file format specified. using mp4")
        ff = "mp4"
    downloadVideo(url, ff)
    input("press enter to exit")

if __name__ == "__main__":
    init()
