#include <Firmata.h>

int lightPin = 0; //analog0 ,10k resistor (PR that came with kit)
int lightPin1 = 2; //analog2, 330k resistor (PR bought)

int motionPin = 3; //analog3, Prox sensor.

int speakerPin1= 9;
int speakerPin2 = 8;

int ledPin = 5;
int ledPin1 = 6;


int tempo = 300;
int thresh = 450;
int currentDist = 0;

void setup() 
{
  pinMode(speakerPin1, OUTPUT);
  pinMode(speakerPin2, OUTPUT);
  pinMode(ledPin,OUTPUT);
  pinMode(ledPin1,OUTPUT);
  
  //Serial.begin(9600);
    Firmata.setFirmwareVersion(0, 1);
    Firmata.begin(57600);
}
void loop() {
  //Serial.println(analogRead(lightPin1));
  //delay(500);
  
  int lightLevel = analogRead(lightPin);
  Firmata.sendAnalog(0, lightPin);
  lightLevel = map(lightLevel, 111, 590, 0, 255);
  
  int lightLevel1 = analogRead(lightPin1);
  Firmata.sendAnalog(2, lightLevel1);
  lightLevel1 = map(lightLevel1, 400, 900, 0, 255); 
 
 currentDist = analogRead(motionPin);
 Firmata.sendAnalog(3, currentDist); 


if ((currentDist > thresh) && lightLevel > 120)
{
  tone(9,1024,200);
  digitalWrite(ledPin1,HIGH);
  delay(tempo);
}
else{
  noTone(9);
  digitalWrite(ledPin1,LOW);
}
if ((currentDist > thresh) && lightLevel1 > 40)
  {
    tone(8,1024,200);
    digitalWrite(ledPin,HIGH);
    delay(tempo);
  }
  else {
    noTone(8);
    digitalWrite(ledPin,LOW);
  } 

  //delay(tempo/2);
}








