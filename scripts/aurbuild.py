#!/usr/bin/env python3
import sys
import requests
import subprocess
import os
import pathlib

def req(arg):
    r = requests.get("https://aur.archlinux.org/rpc/?v=5", params={'type':'search', 'arg': arg})
    
    try:
        result = r.json()
    except:
        print("Error converting result to json")
        quit()
    
    if result["type"] == "error":
        print(result["error"])
        quit()

    elif result["resultcount"] == 0:
        print("No results found")
        quit()
    else:
        return result["results"]

def installFirst(package):
    name = package[0]["Name"]
        
    if input(f"Install {name}? <y/n> ") == "y": 
        build(name)
            
def installChoose(package):
    for i in range(len(package)):
        print(f"{i}) {package[i]['Name']}")
        
    userInput = input(f"Which package to install? <0-{len(package) - 1}>")
    name = package[int(userInput)]["Name"]

    build(name) 
    
def build(name):
    url = f"https://aur.archlinux.org/{name}.git"
    dir = f"{os.environ['HOME']}/build/{name}/"

    try:
        if pathlib.Path(dir).exists(): 
            raise RuntimeError(f"Directory already exists: {dir}")
        subprocess.run(["git", "clone", url, dir])
        subprocess.run(f"(cd {dir} && makepkg -si)", shell=True)
    except RuntimeError as err:
        print(err)

def printUsage():
    print("Usage: aur <install/search> <package-name>")

def main():
    if len(sys.argv) < 3:
        print("Not enough arguments")
        printUsage()
        quit()  
    
    action, package = sys.argv[1].lower(), req(sys.argv[2]) 

    if action == "search":
        for entries in package:
            print(entries["Name"])
    
    elif action == "install":
        if len(package) == 1:
            installFirst(package)
        else:
            installChoose(package)
    else:
        print(f"Unknown argument: {action}")
        printUsage()

if __name__ == "__main__":
    main()
