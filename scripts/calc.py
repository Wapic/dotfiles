#! /usr/bin/python3
import sys
import re
 
def getZeros(str):
    size = 0 
    if str.endswith("k"):
        size = 3
    elif str.endswith("m"):
        size = 6
    elif str.endswith("b"):
        size = 9

    if not str.startswith("."):
        size = size + len(str) - 1

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
    user_input = sys.argv[1] if len(sys.argv) > 1 else None
    if user_input:
        user_input = formatValues(user_input)
        result = eval(user_input)
        print(f"{result:,}")

if __name__ == "__main__":
    main()
