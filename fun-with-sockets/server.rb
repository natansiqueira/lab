require 'socket'

# create a socket c-like 
socket = Socket.new Socket::AF_INET, Socket::SOCK_STREAM

# pack a port and a host in sockaddr string format
# but on server we use our local machine so localhost
# the port can be any available port
socket_addr = Socket.pack_sockaddr_in 8080, '127.0.0.1'

# now we bind or address to our socket
socket.bind socket_addr

# 10 here is a stack size of connections that our machine
# can store to be processed
socket.listen(10)

response = "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\nhello world\r\n"

# keep accepting connections
loop do
  # wait for a connections
  client_socket, addr = socket.accept()

  puts client_socket.recv 4096
  client_socket.write response
  client_socket.close
end

# close server the socket
socket.close
