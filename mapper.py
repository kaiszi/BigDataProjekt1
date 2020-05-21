#!/usr/bin/env python
import sys
import datetime
first = 1
output = {}

for input_line in sys.stdin:
    if first == 0:
            input_line = input_line.strip()
            l = input_line.split()
            if l[3] == "actor" or l[3] == "actress":
                keystring = l[2] + "\t" + l[3]
                if keystring not in output.keys():
                    output[keystring] = 1
                else:
                    output[keystring] += 1
            if l[3] == "director":
                keystring = l[2] + "\t" + l[3]
                if keystring not in output.keys():
                    output[keystring] = 1
                else:
                    output[keystring] += 1

    else:
        first = 0

# Combined output for one node
for key in output:
    print("%s\t%s" % (key, output[key]))
