import processing.serial.*;
import cc.arduino.*;

import eeml.*;

Arduino arduino;
float myValue;
float myValue1;
float myValue2;

float lastUpdate;
float lastUpdate1;
float lastUpdate2;


DataOut dOut;

void setup()
{
  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[1], 57600);

  dOut = new DataOut(this, "http://www.pachube.com/api/35383.xml", "API Key");

  dOut.addData(0, "lightSensor 1");
  dOut.addData(1, "lightSensor 2");
  dOut.addData(2, "Prox");
}

void draw()
{  
  //myValue = arduino.analogRead(0);
  //myValue1 = arduino.analogRead(2);
  myValue2 = arduino.analogRead(3);
  //println(myValue);  

  if ((millis() - lastUpdate) > 10000) {
    println(myValue); 
    println("Light1: ");
    dOut.update(0, myValue);
    int response = dOut.updatePachube();
    println(response);
    lastUpdate = millis();

  
    if ((millis() - lastUpdate1) > 10100){ 
      println(myValue1); 
    println("Light2: ");
    dOut.update(1, myValue1);
    int response1 = dOut.updatePachube();
    println(response1);
    lastUpdate1 = millis();

  
    if ((millis() - lastUpdate2) > 30000){ 
      println(myValue2); 
    println("Prox: ");
    dOut.update(2, myValue2);
    int response2 = dOut.updatePachube();
    println(response2);
    lastUpdate2 = millis();
  }
}
}
}

