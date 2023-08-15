# underlying operating system socket implementation
require 'socket'
include Socket::Constants

# creates our socket
socket = Socket.new AF_INET6, SOCK_STREAM

# example.com
# translate port and host to as an sockaddr string
socket_addr = Socket.pack_sockaddr_in 80, 'example.com'

# connect to example.com
socket.connect socket_addr

# write a valid HTTP request
# GET / HTTP/1.1
# Host: example.com
socket.send "GET / HTTP/1.1\r\nHost: example.com\r\n\r\n", 0
results = socket.recv 4096
puts results
