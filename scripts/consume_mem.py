#!/bin/env python2
import time


def consume_mem(x, mem=[]):
    for i in range(x):
        mem.append(i)
    print("%s growing" % mem)

if __name__ == '__main__':
    for i in xrange(0, 100000):
        consume_mem(i)
        if i > 500:
            time.sleep(5)
    time.sleep(1000)
