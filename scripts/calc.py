#! /usr/bin/python3
import sys
import re
 
def getZeros(str):
    size = 0
    if str.endswith("k"):
        size = 3
    if str.endswith("m"):
        size = 6
    if str.endswith("b"):
        size = 9

    str = re.sub("[.mbk]", "", str)
    str = str.ljust(size, "0")
    return str

# replace suffix with right amount of zeros
def formatValues(user_input):

    user_input = user_input.lower() # make input lowercase

    stringList = re.findall("(\.\d+[mbk])", user_input) # add all matching strings into a list (matching examples: 1.2m, 5.23b, 92.1k, etc) 
    for string in stringList:
        user_input = re.sub("(\.\d+[mbk])", getZeros(string), user_input, 1) # replace old value with new formatted value

    stringList = re.findall("[mbk]", user_input)
    for string in stringList:
        user_input = re.sub("[mbk]", getZeros(string), user_input, 1)

    return user_input

def main():
    user_input = sys.argv[1] if len(sys.argv) > 1 else None
    if user_input:
        try:
            user_input = formatValues(user_input)
            result = eval(user_input)
            print(f"{result:,}")
        except Exception:
            return

if __name__ == "__main__":
    main()
