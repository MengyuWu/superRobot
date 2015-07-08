from twisted.internet.protocol import Factory,Protocol
from twisted.internet import reactor
import sys
import socket
import serial

class IphoneChat(Protocol):
	def connectionMade(self):
		self.factory.clients.append(self)
		print "clints are",self.factory.clients
	def connectionLost(self,reason):
		self.factory.clients.remove(self)
	def dataReceived(self,data):
		print data
		if data == 'passive':
			print 'passive'
			ser.write(bytearray([0x80]))
		elif data == 'safe':
			print 'safe'
			ser.write(bytearray([0x83]))
		elif data == 'full':
			print 'full'
			ser.write(bytearray([0x84]))
		elif data == 'clean':
			print 'clean'
			ser.write(bytearray([0x87]))
		elif data == 'dock':
			print 'dock'
			ser.write(bytearray([0x8f]))
		elif data == 'beep':
			print 'beep'
			ser.write(bytearray([0x8c,0x03,0x01,0x40,0x10,0x8d,0x03]))
		elif data == 'stop':
			print 'stop'
			ser.write(bytearray([0x89,0x00,0x00,0x00,0x00]))
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
# Open a serial connection to Roomba.
ser = serial.Serial(port='/dev/ttyUSB0', baudrate=115200)
reactor.run()
