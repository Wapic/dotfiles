#! /usr/bin/python3
import sys
import re
from pathlib import Path

HISTORY = Path(f"{Path.home()}/.calchist")

def writeToFile(input):
    with open(HISTORY, "w") as fp:
        if type(input) is str:
            fp.write("")
        else:
            fp.writelines(input)

def getZeros(str):
    size = 0 if str.startswith(".") else len(str) - 1
    if str.endswith("k"):
        size += 3
    elif str.endswith("m"):
        size += 6
    elif str.endswith("b"):
        size += 9
    
    str = re.sub("[.mbk]", "", str)
    str = str.ljust(size, "0")
    return str

# replace suffix with right amount of zeros
def formatValues(user_input):

    user_input = user_input.lower() # make input lowercase

    stringList = re.findall("(\.*\d+[mbk])", user_input) # add all matching strings into a list 
    for string in stringList:
        user_input = re.sub("(\.*\d+[mbk])", getZeros(string), user_input, 1) # replace old value with new formatted value

    return user_input

def main(): 
    if not HISTORY.exists():
        print(f"{HISTORY} not found")
        return

    with open(HISTORY) as fp:
        lines = fp.readlines()
     
    user_input = sys.argv[1]+"\n" if len(sys.argv) > 1 else None 

    if user_input:
        if user_input.startswith("clear"):
            writeToFile("clear")

        if user_input.startswith("="):
            user_input = re.sub("[=,]", "", user_input)
            print("And this is where I\nwould copy to clipboard\n \n \n \nIF IT WORKED")
            #pyperclip.copy(user_input)
            return

        if user_input not in lines:
            lines.append(user_input)
        
        formattedInput = formatValues(user_input)

        result = eval(formattedInput)
        print(f"={result:,}")
        writeToFile(lines)

    if lines:
        print("\n".join(reversed(lines)))

if __name__ == "__main__":
    main()
