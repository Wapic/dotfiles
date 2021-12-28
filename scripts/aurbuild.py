#!/usr/bin/env python3
import sys
import requests
import subprocess
import os

if __name__ == "__main__":

    if len(sys.argv) < 3:
        print("not enough arguments")
        quit()

    url = f"https://aur.archlinux.org/rpc/?v=5&type=search&arg={str(sys.argv[2])}"
    x = requests.get(url)
    result = x.json()["results"]
    
    if len(result) >= 1:
        name = result[0]["Name"]
    else:
        print("no results found")
        quit()
        
    if str(sys.argv[1]).lower() == "install": 
    
        cloneURL = f"https://aur.archlinux.org/{name}.git"
        print(f"found: {cloneURL}")
        
        if input("continue? [y/n] ") == "y":
            dir = f"{os.environ['HOME']}/builds/{name}/"
        
            subprocess.run(["git", "clone", cloneURL, dir])
            subprocess.run(f"(cd {dir} && makepkg -si)", shell=True)

    elif str(sys.argv[1]).lower() == "search":
        for entries in result:
            print(entries["Name"])
