r = raspi%('13.0.157.135','pi','raspberry');
%myserialdevice =serialdev(r,'/dev/serial0',9600);
myserialdevice =serialdev(r,'/dev/ttyACM0',9600)
 write(myserialdevice,'1'); %envia un 1 al puerto serial
 serialData = read(myserialdevice,9,'char');