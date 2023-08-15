# underlying operating system socket implementation
require 'socket'

# creates our socket
s = Socket.new Socket::AF_INET6, Socket::SOCK_STREAM

# example.com ip
addr = Socket.pack_sockaddr_in 80, '93.184.216.34'

# connect to example.com
s.connect addr

socket.write( 'GET / HTTP/1.1\r\n\r\n' )

puts socket.read
