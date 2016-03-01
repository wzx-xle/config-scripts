#!/usr/bin/python

import socket
import sys

host = "0.0.0.0"
ip = int(sys.argv[1])

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((host, ip))
s.listen(5)
print "listen " + host + ":" + str(ip)

while True:
	sock,addr = s.accept()
	sock.send(("hello: %s:%s ." % addr).encode())
	sock.close()
	print "connection from %s:%s closed." % addr;

s.close()