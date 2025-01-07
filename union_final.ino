#include <Wire.h>
#include <Servo.h>
#include <PID_v1.h>
#include "I2Cdev.h"
#include "MPU6050_6Axis_MotionApps20.h"
#if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
#include "Wire.h"
#endif

//*******************  MPU 6050 *************************************************************************************************************
MPU6050 mpu;
// MPU control/status vars
bool dmpReady = false; // establecer verdadero si DMP init fue exitoso
uint8_t mpuIntStatus;   // mantiene el byte de estado de interrupción real de MPU
uint8_t devStatus;      // devuelve el estado después de cada operación del dispositivo (0 = éxito,! 0 = error)
uint16_t packetSize;   // tamaño esperado del paquete DMP (el valor predeterminado es 42 bytes)
uint16_t fifoCount;     // recuento de todos los bytes actualmente en FIFO
uint8_t fifoBuffer[64]; // Búfer de almacenamiento FIFO
 
Quaternion q;           // [w, x, y, z]
VectorFloat gravity;    // [x, y, z]
float ypr[3];           // [yaw, pitch, roll]

volatile bool mpuInterrupt = false; // indicates whether MPU interrupt pin has gone high
void dmpDataReady()
{
 mpuInterrupt = true;
}

//*************************   VEX MOTORES   *********************************************************************************************************************
int leftMotorPin = 7;           //motor izquierdo
int rightMotorPin = 5;         //motor derecho
Servo leftMotor;
int cont = 0;
Servo rightMotor;
int velocidad_constante=0; //0% vex

//*************************************** Ajustes PID***************************************
double PuntoEquilibrio =1;
//------------------Los Valors de PID cambian con cada diseño
double Kp =1.6;  //double Kp = 63; 21 ; 19
double Kd = 0.1;  //double Kd = 1.5;  0.8 ;0.68
double Ki = 0.001;  //double Ki = 160;  140;93.1
double originalSetpoint = PuntoEquilibrio;   //double originalSetpoint = 172.50;
double setpoint = originalSetpoint;
double movingAngleOffset = 0.1;
double input, output;
PID pid(&input, &output, &setpoint, Kp, Ki, Kd, DIRECT);
//*******************   NEMA    *************************************************************************************************************
// Ddefine los pines de coneccion del nema y los pasos que se ejecutaran
#define dirPin 13
#define stepPin 12
#define stepsPerRevolution 96     ///variable de cada motor 200 pasos reduccion 38.4:1 o sea 1 vuelta seria 7680 pasos 21.3 pasos =1° 64 pasos=3° 480 pasos =22.5° / 7.5 ; 22.5°/5 resolucion=4.5°
int contx = 0;
//***********************   VARIABLES ULTRASONICOS ************************************************************************************************************************
int  x, y, z, w, r, s, h, k, o;
int dist[] = {0, 0, 0, 0, 0, 0, 0, 0, 0};
int srfAddress = 0x70;                           // DIRECCION INICIAL DE LOS SRF08
#define cmdByte 0x00                            // Command byte
#define lightByte 0x01                         // Byte para leer sensor de luz
#define rangeByte 0x02                        // Byte para el inicio de los datos de rango

byte highByte = 0x00;                       // Almacena bytes altos de rango
byte lowByte = 0x00;                       // Byte bajo almacenado de rango
int marca=0;

/*######################################################### SETUP #########################################################
 * ###############################################################################################################################*/
 
void setup() {

  pinMode(50,INPUT_PULLUP);
  pinMode(stepPin, OUTPUT);
  pinMode(dirPin, OUTPUT);
  Wire.begin();
  Serial.begin(9600);
  pinMode(leftMotorPin, OUTPUT);
  pinMode(rightMotorPin, OUTPUT);
  pinMode(13, OUTPUT);
  leftMotor.attach(leftMotorPin);               // Estas líneas le dicen al Arduino que envíe señales a los pines identificados anteriormente para controlar las variables del motor
  rightMotor.attach(rightMotorPin);
  // unirse al bus I2C (la biblioteca I2Cdev no hace esto automáticamente)
  #if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
  Wire.begin();
  TWBR = 24; // Reloj I2C de 400 kHz. Comente esta línea si tiene dificultades de compilación
  #elif I2CDEV_IMPLEMENTATION == I2CDEV_BUILTIN_FASTWIRE
  Fastwire::setup(400, true);
  #endif

  mpu.initialize();

  devStatus = mpu.dmpInitialize();

  // Valores de calibracion
  mpu.setXGyroOffset(164);
  mpu.setYGyroOffset(23);
  mpu.setZGyroOffset(23);
  mpu.setXAccelOffset(-2654);
  mpu.setYAccelOffset(-445);
  mpu.setZAccelOffset(1472);

 // Activar DMP
 if (devStatus == 0)
 {
 mpu.setDMPEnabled(true);
// Activar interrupcion
 attachInterrupt(0, dmpDataReady, RISING);
 mpuIntStatus = mpu.getIntStatus();

 // establece nuestra bandera DMP Ready para que la función main loop () sepa que está bien usarla
 dmpReady = true;

// obtener el tamaño de paquete DMP esperado para una comparación posterior
 packetSize = mpu.dmpGetFIFOPacketSize();
 
 //setup PID
 pid.SetMode(AUTOMATIC);
 pid.SetSampleTime(10);
 pid.SetOutputLimits(-100, 100); 
 }
 else
 {
 // ERROR!
 // 1 = la carga de memoria inicial falló
 // 2 = Las actualizaciones de la configuración de DMP fallaron
 // (si se va a romper, normalmente el código será 1)
 Serial.print(F("Error al inicializar DMP (código"));
 Serial.print(devStatus);
 Serial.println(F(")"));
 }

 
}

/*#########################################################  FUNCIONES GIROS  #########################################################
 * ###############################################################################################################################*/
 
int girar(int dir, int pasos) {               // funcion para girar los sensores condicionando los pasos y la direccion de giro
  digitalWrite(dirPin, dir);
  for (int i = 0; i <= pasos; i++) {
    digitalWrite(stepPin, HIGH);
    delayMicroseconds(800);
    digitalWrite(stepPin, LOW);
    delayMicroseconds(800);
  }
  delay(500);
}

int start_1(){
  while (marca==1){ 
  digitalWrite(dirPin, LOW);
  int sensorVal = digitalRead(50);
  if (sensorVal == HIGH) {
    digitalWrite(stepPin, HIGH);
    delayMicroseconds(800);
    digitalWrite(stepPin, LOW);
    delayMicroseconds(800);
    digitalWrite(13,LOW);
  } 
  else {
    digitalWrite(13, HIGH);
    marca=0;
  }
  }
}

/*#########################################################  MOTORES VEX #########################################################
 * ###############################################################################################################################*/

// Las siguientes funciones le permiten enviar un valor de potencia entre -100 y 100 a los motores.
// La biblioteca de servos usa números entre 1000 y 2000 para controlar los servos.

int izq(int value1) {
    if (value1<=23 && value1>0){
    value1=23;
  }
  else if(value1>=-23 && value1<0){
    value1= -23;    
  }
 int valor1=velocidad_constante+ value1;
  
  if (valor1 <=-100){
    valor1= -100;
  }
  else if (valor1 >=100){
    valor1= 100;
  }
  int velv=map(valor1, -100, 100, 1000, 2000);
  leftMotor.write(velv);
}

int dere(int value) {
  if (value<=23&& value>0){
    value=23;
  }
  else if(value>=-23 && value<0){
    value= -23;    
  }
  int valor=velocidad_constante-value;
  
  if (valor <=-100){
    valor= -100;
  }
  else if (valor >=100){
    valor= 100;
  }
  int vel=map(valor, -100, 100, 1000, 2000);
  rightMotor.write(vel);   
}
/*#########################################################  LOOP PRINCIPAL#########################################################
 * ###############################################################################################################################*/
 
void loop() {
  
    

  
 //********************************************** fin control principal ************************ 
 // Si fallo al iniciar, parar programa
 if (!dmpReady) return;

  // Ejecutar mientras no hay interrupcion
 while (!mpuInterrupt && fifoCount < packetSize)
 {
      dist[0] = getRange(0x70);     //llama a la funcion del sfr08 para obtener la distancia de los 9 sensores y guardarlos en un array de 9 posiciones
        dist[1] = getRange(0x71);
        dist[2] = getRange(0x72);
        dist[3] = getRange(0x73);
        dist[4] = getRange(0x74);
        dist[5] = getRange(0x75);
        dist[6] = getRange(0x76);
        dist[7] = getRange(0x77);
        dist[8] = getRange(0x78);
 if(dist[0]<=20 || dist[1]<=20 || dist[2]<=20 || dist[3]<=20 || dist[4]<=20 || dist[5]<=20 || dist[6]<=20 || dist[7]<=20 || dist[8]<=20)
  {
    velocidad_constante=0; 
    
     for (int i = 0; i < 5; i++) {

        dist[0] = getRange(0x70);     //llama a la funcion del sfr08 para obtener la distancia de los 9 sensores y guardarlos en un array de 9 posiciones
        dist[1] = getRange(0x71);
        dist[2] = getRange(0x72);
        dist[3] = getRange(0x73);
        dist[4] = getRange(0x74);
        dist[5] = getRange(0x75);
        dist[6] = getRange(0x76);
        dist[7] = getRange(0x77);
        dist[8] = getRange(0x78);

        for (int n = 0; n <= 8; n++) {    //imprime en el puerto serial la distancia de los 9 sensores guardados en el array
          if (dist[n] >= 40)
          { // con este condicional se tiene una distancia limite
            dist[n] = 40;
            Serial.println(dist[n]);           
            delay(30);
          }
          else if (dist[n] <10)
          { // con este condicional se tiene una distancia limite           
            Serial.print(dist[n]);
            Serial.println(" ");
            delay(30);
          }
          else
          {
            Serial.println(dist[n]);
            delay(30);
          }
        }
        delay(1000);
        cont++;
        if (cont <= 4) {
          girar(HIGH, stepsPerRevolution); // variable contador de giros  para reiniciar la posicion del robot en el mapeo         // gira los pasos establecidos con aterioridad hacia un sentido
          marca=1;
        }
        else if (cont > 4)
        { 
          start_1();    // reinicia la posicion del robot girando  en sentido contrario hasta el fin de carrera
          cont = 0;
          delay(500);
        }
      }
  }
  else{
    velocidad_constante=35;
    digitalWrite(ena,HIGH);
    pid.Compute();//calculamos el pid
    izq(output);
    dere(output);
  }
 
 }

// restablecer la bandera de interrupción y obtener el byte INT_STATUS
 mpuInterrupt = false;
 mpuIntStatus = mpu.getIntStatus();

  // Obtener datos del FIFO
 fifoCount = mpu.getFIFOCount();

  // Controlar overflow
 if ((mpuIntStatus & 0x10) || fifoCount == 1024)
 {
// reiniciar para que podamos continuar limpiamente
 mpu.resetFIFO();
 Serial.println(F("FIFO overflow!"));

 // de lo contrario, verificar la interrupción de datos DMP listos (esto debería suceder con frecuencia)
 }
 else if (mpuIntStatus & 0x02)
 {
  // esperar la longitud correcta de los datos disponibles, debe ser una espera MUY corta
 while (fifoCount < packetSize) fifoCount = mpu.getFIFOCount();

 // lee un paquete de FIFO
 mpu.getFIFOBytes(fifoBuffer, packetSize);
 
 // rastrear el conteo de FIFO aquí en caso de que haya> 1 paquete disponible
 // (esto nos permite leer más inmediatamente sin esperar una interrupción)
 fifoCount -= packetSize;

 mpu.dmpGetQuaternion(&q, fifoBuffer);
 mpu.dmpGetGravity(&gravity, &q);
 mpu.dmpGetYawPitchRoll(ypr, &q, &gravity);
 input = ypr[0] * 180/M_PI + 180;
 }
}

/*#########################################################  ULTASONICOS #########################################################
 * ###############################################################################################################################*/
 
int getRange(int srfAddress) {                                  // Esta función obtiene un rango del SRF08

  int range = 0;

  Wire.beginTransmission(srfAddress);             // Comience a comunicarse con SRF08
  Wire.write(cmdByte);                             // Envia byte de comando
  Wire.write(0x51);                                // Envíe 0x51 para iniciar un rango
  Wire.endTransmission();

  delay(100);                                     // Espere a que se complete el rango

  Wire.beginTransmission(srfAddress);             // comenzar a comunicarse con SRFmodule
  Wire.write(rangeByte);                           // Llame al registro para iniciar los datos de rango
  Wire.endTransmission();

  Wire.requestFrom(srfAddress, 2);                // Solicitar 2 bytes del módulo SRF
  while (Wire.available() < 2);                   // Espere a que lleguen los datos
  highByte = Wire.read();                      // Obtener un byte alto
  lowByte = Wire.read();                       // Obtener un byte BAJO
  range = (highByte << 8) + lowByte;              // Ponerlos juntos

  return (range);                                 // Rango de devoluciones
}
