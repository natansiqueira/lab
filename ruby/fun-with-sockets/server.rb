require 'socket'

# create a socket c-like
socket = Socket.new Socket::AF_INET, Socket::SOCK_STREAM

# pack a port and a host in sockaddr string format
# but on server we use our local machine so localhost
# the port can be any available port
socket_addrinfo = Socket.pack_sockaddr_in 8080, '127.0.0.1'

# now we bind or address to our socket
socket.bind socket_addrinfo

# 10 here is a stack size of connections that our machine
# can store to be processed
socket.listen(10)

def response(request)
  name = request.split("\r\n\r\n").last
  "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\nhello #{name}\r\n"
end

# keep accepting connections
loop do
  # wait for a connections
  Thread.start(socket.accept) do |client_socket, client_addrinfo|
    request = client_socket.recv 4096
    client_socket.write response(request)
    client_socket.close
  end
end

# close server the socket
socket.close
