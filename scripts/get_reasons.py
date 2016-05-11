#!/bin/env python2
import sys
import codecs

reasons = sys.argv[1]
f = codecs.open(reasons, encoding='utf-8')
for line in f:
    print line.decode('unicode-escape').encode('utf-8')
