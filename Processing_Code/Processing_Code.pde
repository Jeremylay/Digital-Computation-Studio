import processing.serial.*;
import cc.arduino.*;

import eeml.*;

Arduino arduino;

import ddf.minim.*;
Minim minim;

AudioSample kick;         // initializes sound stored in data.
AudioSample kick1;        // initializes sound stored in data.
AudioSample kick2;        // initializes sound stored in data.
AudioSample kick3;        // initializes sound stored in data.

float myValue;             
float myValue1;
float myValue2;
float myValue3;
float lastUpdate;
float lastUpdate1;
float lastUpdate2;
float lastUpdate3;

DataOut dOut;

void setup()
{
  println(Arduino.list());                                //prints the serial ports.
  arduino = new Arduino(this, Arduino.list()[1], 57600);  // reading from arduino at 57600.

  dOut = new DataOut(this, "http://www.pachube.com/api/35383.xml", "api key");

  dOut.addData(0, "knockSensor1");    // sends data from sensor 1 to pachube feed 0.
  dOut.addData(1, "knockSensor2");    // sends data from sensor 2 to pachube feed 1.
  dOut.addData(2, "knockSensor3");    // sends data from sensor 3 to pachube feed 2.
  dOut.addData(3, "knockSensor4");    // sends data from sensor 4 to pachube feed 3.
 
  size (800,800);
  background(0);
  noStroke();
  
  minim = new Minim(this);                           //Loads minim.
  kick = minim.loadSample("kickdrum1.wav", 2048);    //Loads sounds from data file.
  kick1 = minim.loadSample("hihat1.wav", 2048);      //Loads sounds from data file.
  kick2 = minim.loadSample("snaredrum1.wav", 2048);  //Loads sounds from data file.
  kick3 = minim.loadSample("bassdrum3.wav", 2048);  //Loads sounds from data file.
}

void draw()
{  
  myValue = arduino.analogRead(2);               // reads the values from analog 2.
  delay(25);                                    // delays the reading of values by 25 to reduce the sensitivity.
//println(myValue);
if (myValue > 50)
{ 
  kick.trigger();
  
  fill(93,132,245,120);
  rect(random(200), random(800), 5, 55);      //creates a random rectangle at a random location, x = 0-200 & y = 0-800.
}

  myValue1 = arduino.analogRead(3);          // reads the values from analog 3.
  delay(25);                                  // delays the reading of values by 25 to reduce the sensitivity.
  //println(myValue1);  
if (myValue1 > 50)
{ 
  kick1.trigger();
   rect(random(200,400), random(800), 5, 55);  //creates a random rectangle at a random location, x = 200-400 & y = 0-800.
  fill(255,0,0,120);
}

  myValue2 = arduino.analogRead(4);          // reads the values from analog 4.
  delay(25);                                // delays the reading of values by 25 to reduce the sensitivity.
  //println(myValue2);
if (myValue2 > 50)
{ 
  kick2.trigger();
  rect(random(400,600), random(800), 5, 55);  //creates a random rectangle at a random location, x = 400-600 & y = 0-800.
  fill(247,195,37,120);
  
}

  myValue3 = arduino.analogRead(1);        // reads the values from analog 1.
  delay(25);                              // delays the reading of values by 25 to reduce the sensitivity.
  //println(myValue3);
if (myValue3 > 50)
{ 
  kick3.trigger();
   rect(random(600,800), random(0,800), 5, 55);  //creates a random rectangle at a random location, x = 600-800 & y = 0-800.
  fill(3,250,38,120);
}

   if ((millis() - lastUpdate) > 45000){ 
      println(myValue); 
    println("Knock1: ");
    dOut.update(0, myValue);
    int response = dOut.updatePachube();
    println(response);
    lastUpdate = millis();

   }  
    if ((millis() - lastUpdate1) > 45000){ 
      println(myValue1); 
    println("Knock2: ");
    dOut.update(1, myValue1);
    int response1 = dOut.updatePachube();
    println(response1);
    lastUpdate1 = millis();
}

    if ((millis() - lastUpdate2) > 45000){ 
      println(myValue2); 
    println("Knock3: ");
    dOut.update(2, myValue2);
    int response2 = dOut.updatePachube();
    println(response2);
    lastUpdate2 = millis();
  }
  
  
    if ((millis() - lastUpdate3) > 45000){ 
      println(myValue3); 
    println("Knock4: ");
    dOut.update(2, myValue3);
    int response2 = dOut.updatePachube();
    println(response2);
    lastUpdate2 = millis();
  
    }




}
 void stop()
{
  // always close Minim audio classes when you are done with them
  kick.close();                           //Stops playing the sounds.
  minim.stop();
  
  super.stop();
}

