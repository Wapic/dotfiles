#!/usr/bin/env python3
import sys
import requests
import subprocess
import os
import pathlib

if __name__ == "__main__":

    if len(sys.argv) < 3:
        print("Not enough arguments.\nusage: aur <install/search> <package-name>")
        quit()

    url = f"https://aur.archlinux.org/rpc/?v=5&type=search&arg={str(sys.argv[2])}"
    x = requests.get(url)
    result = x.json()["results"]
    
    if len(result) < 1 :
        print("No matching results")
        quit()
  
    if str(sys.argv[1]).lower() == "install": 
        name = result[0]["Name"]
        cloneURL = f"https://aur.archlinux.org/{name}.git"
        print(f"found: {cloneURL}")
        
        if input("continue? [y/n] ") == "y":
            dir = f"{os.environ['HOME']}/builds/{name}/"
            
            try:
                if pathlib.Path(dir).exists: raise Exception()
                subprocess.run(["git", "clone", cloneURL, dir])
            except:
                print("Folder already exists, attempting to build")
            finally:
                subprocess.run(f"(cd {dir} && makepkg -si)", shell=True)

    elif str(sys.argv[1]).lower() == "search":
        for entries in result:
            print(entries["Name"])
