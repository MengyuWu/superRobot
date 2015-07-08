1. serial ports connected successfully!
2. server part written in python
3. client part written in objective c
4. basic function: passive, safe, full, clean, dock....

5. raspberry pi, camera set up

Raspberry Pi Streaming Video Setup

If you do not already have pip installed on your Raspberry Pi, please use this command to install it:
sudo apt-get install python-pip
Install the picamera library by running this command:
pip install picamera
Install the flask Python library by running this command:
sudo pip install flask
Download Miguel’s Flask video streaming project by running this command:
git clone https://github.com/miguelgrinberg/flask-video-streaming.git
 In the project folder edit the app.py file.
Comment out this line by adding a “#” to the beginning
#from camera import CameraUn-comment this line
from camera_pi import Camera
Save the file.
Run this command to find out the local IP address of your Raspberry Pi.
ifconfig
You will see many lines of output. You are looking for this one:
inet addr:192.168.0.107 Bcast:192.168.0.255 Mask:255.255.255.0
The inet addr is your local IP address. In this case, 192.168.0.107.
 Start the Flask server by running this command:
python app.py
You will see this, which means that the server is running on port 5000 and is ready.
* Running on http://0.0.0.0:5000/
* Restarting with reloader
Open up a web browser on your favorite device and go to this address http://192.168.0.107:5000, except replace that IP address with the one that your Raspberry Pi is running on.
You should see a live view the video that your Raspberry Pi is capturing.
I hope that this project got you up and running as quickly as it did for me. Please note that I did not get into how to setup port forwarding so that you could access your camera remotely over the Internet. These instructions will only work from a computer that is connected to the same local area network as your Raspberry Pi. You can refer to these notes and instructions from another project if you want to configure your Raspberry Pi for remote access.

Setup static LAN IP address
Setup port forwarding
Setup DDNS


Next:

live stream to iphone
port forward
