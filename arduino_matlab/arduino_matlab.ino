#include <EEPROM.h>

byte comando; //va a ser el byte a recibir

void setup() {

//configuramos el puert serial

Serial.begin(9600);

}

void loop() {

if (Serial.available()>0){  //si hay datos disponibles en el serial

delay(50);  //esperemos a que se terminen de recibir

comando=Serial.read();  //leemos el primer datos –byte-

 EEPROM.write(0,comando);//lo escribimos en la EPROM para cualquier uso que se nos ocurra.

     Serial.flush();//limpiamos el serial.

}

}
