#!/usr/bin/env python
import sys
output = {}

for input_line in sys.stdin:
    input_line = input_line.strip()
    l = input_line.split("\t")
    keystring = l[0]
    if keystring not in output.keys():
        if l[1] == "actor" or l[1] == "actress":
            output[keystring] = l[2] + "\t" + '0'
        else: output[keystring] = '0' + "\t" + l[2]
    else:
        if l[1] == "actor" or l[1] == "actress":
            output[keystring] = l[2] + "\t" + output[keystring][2]
        else: output[keystring] = output[keystring][0] + "\t" + l[2]


for key in output:
    print("%s\t%s" % (key, output[key]))
