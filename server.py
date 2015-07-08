from twisted.internet.protocol import Factory,Protocol
from twisted.internet import reactor
import sys

class IphoneChat(Protocol):
	def connectionMade(self):
		self.factory.clients.append(self)
		print "clints are",self.factory.clients
	def connectionLost(self,reason):
		self.factory.clients.remove(self)
	def dataReceived(self,data):
		print data
	def message(self,message):
		self.transport.write(message+'\n')

factory=Factory()
factory.clients=[]
factory.protocol=IphoneChat
port=5000
if len(sys.argv)>1:
    port=int(sys.argv[1])
print port
reactor.listenTCP(port,factory)
print "Iphone Chat Server started"
reactor.run()
