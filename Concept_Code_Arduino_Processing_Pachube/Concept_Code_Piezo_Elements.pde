#include <Firmata.h>

int knockSensor1 = A3; // Piezo element connceted to analog pin 3, used as a sensor that detects vibrations. 
int knockSensor2 = A4;  // Piezo element connceted to analog pin 4, used as a sensor that detects vibrations. 
int knockSensor3 = A2; // Piezo element connected to analog pin 2, used as a sensor that detects vibrations.
int knockSensor4 = A1; // Piezo element connected to analog pin 1, used as a sensor that detects vibrations.

//int motionPin = A5; //Proxmity sensor connected to analog 5 that will detect if someone is in front of the wall. 

int ledPin1 = 5;  // LED connected to digital pin 5.
int ledPin2 = 6; // LED connected to digital pin 6.
int ledPin3 = 7; // LED connected to digital pin 7.
int ledPin4 = 8; // LED connected to digital pin 8.

int proxthresh = 450; // threshold value for proximity sensor to detect if someone is in front of the wall.
int currentDist = 0; //  

int sensorReading1 = 0; //default sensorReading1 is 0.
int sensorReading2 = 0; //default sensorReading2 is 0.
int sensorReading3 = 0; //default sensorReading3 is 0.
int sensorReading4 = 0; //default sensorReading3 is 0.

int knockthresh = 50; //threshold value to decided when to detect the knock or vibrations.
int val,t; // value name is t.

void setup() 
{
  pinMode(ledPin1,OUTPUT); // states that the ledPin is an OUTPUT.
  pinMode(ledPin2,OUTPUT); // states that the ledPin1 is an OUTPUT.
  pinMode(ledPin3,OUTPUT); // states that the ledPin1 is an OUTPUT.
  pinMode(ledPin4,OUTPUT); // states that the ledPin1 is an OUTPUT.
  
    //Serial.begin(9600); // communication to serial monitor
    Firmata.setFirmwareVersion(0, 1); // communication to processing
    Firmata.begin(57600); // speed of which data is sent to processing
}
void loop() {

 //currentDist = analogRead(motionPin); // reading the current value of the proximity sensor.
 //Firmata.sendAnalog(5, currentDist); // sending the values taken from currentDist to "5" in processing.
    
 sensorReading1 = analogRead(knockSensor1); // reading the values for knockSensor1
  Firmata.sendAnalog(3, sensorReading1); // sending the vaules taken fron sensorReading to "3" in processing.

if (sensorReading1 >= knockthresh){
  t=0;
   while (analogRead(knockSensor1) >= knockthresh/2) {
    t++;
  }
  digitalWrite(ledPin1,HIGH);
  Serial.println(sensorReading1); // reading the values of the pins
  delay(5);
}

else{
  digitalWrite(ledPin1,LOW);
}
  sensorReading2 = analogRead(knockSensor2); // reading the values of knockSensor2
  Firmata.sendAnalog(4, sensorReading2); //sending the values from sensorReading2 to "4" in processing.
  
if (sensorReading2 >= knockthresh){
  t=0;
    while (analogRead(knockSensor2) >= knockthresh/2) {
      t++;
    }
    digitalWrite(ledPin2,HIGH);
    delay(5);
  }
  
  else {
    digitalWrite(ledPin2,LOW);
  } 
  
  sensorReading3 = analogRead(knockSensor3); // reading the values for knockSensor1
  Firmata.sendAnalog(2, sensorReading3); // sending the vaules taken fron sensorReading to "3" in processing.

if (sensorReading3 >= knockthresh){
  t=0;
   while (analogRead(knockSensor3) >= knockthresh/2) {
    t++;
  }
  digitalWrite(ledPin3,HIGH);
  //Serial.println(sensorReading3); // reading the values of the pins
  delay(5);
}
  else{
    digitalWrite(ledPin3,LOW);
  }

 sensorReading4 = analogRead(knockSensor4); // reading the values for knockSensor1
  Firmata.sendAnalog(1, sensorReading4); // sending the vaules taken fron sensorReading to "3" in processing.

if (sensorReading4 >= knockthresh){
  t=0;
   while (analogRead(knockSensor4) >= knockthresh/2) {
    t++;
  }
  digitalWrite(ledPin4,HIGH);
  Serial.println(sensorReading4); // reading the values of the pins
  delay(5);
}

else{
  digitalWrite(ledPin4,LOW);
  }
}

