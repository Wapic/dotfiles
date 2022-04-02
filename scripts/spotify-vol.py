#!/usr/bin/env python3
import subprocess
import sys

if __name__ == '__main__':
    curVol = subprocess.run("spt pb -f '%v' -s", shell=True, capture_output=True).stdout.decode("utf-8")
    if sys.argv[1] == "up":
        subprocess.run(f"spt pb -v {int(curVol)+10}", shell=True)
    else :
        subprocess.run(f"spt pb -v {int(curVol)-10}", shell=True)
