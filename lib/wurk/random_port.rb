module Wurk
  class RandomPort
    def self.get
      require 'socket'
      # use Addrinfo
      socket = Socket.new(:INET, :STREAM, 0)
      socket.bind(Addrinfo.tcp("127.0.0.1", 0))
      socket.local_address.ip_port
    end
  end
end
