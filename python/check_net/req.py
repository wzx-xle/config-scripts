#!/usr/bin/python

import socket
import sys

host = sys.argv[1]
ip = int(sys.argv[2])

# 10s
timeout = 10
socket.setdefaulttimeout(timeout)
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
try:
	s.connect((host, ip))
	print ""
	print "-- successful --"
	print ""
except IOError:
	print ""
	print "-- failed --"
	print ""
s.close()