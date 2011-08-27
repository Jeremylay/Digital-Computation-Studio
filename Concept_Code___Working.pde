int lightPin = 0; 
int lightPin1 = 2;
int speakerPin1= 9;
int speakerPin2 = 8;
int ledPin = 5;
int ledPin1 = 6;


int tempo = 300;

void setup() {
  pinMode(speakerPin1, OUTPUT);
  pinMode(speakerPin2, OUTPUT);
  pinMode(ledPin,OUTPUT);
  pinMode(ledPin1,OUTPUT);
  Serial.begin(9600);
}
void loop() {
  Serial.println(analogRead(lightPin));

   int lightLevel = analogRead(lightPin);
   int lightLevel1 = analogRead(lightPin1);
   
  lightLevel = map(lightLevel, 400, 900, 0, 255);
  lightLevel1 = map(lightLevel1, 126, 550, 0, 255); 


if (lightLevel > 60)
{
  
  tone(9,1024,200);
  digitalWrite(ledPin1,HIGH);
  delay(tempo);
}
else{
  noTone(9);
  digitalWrite(ledPin1,LOW);
}

if ( lightLevel1 > 126)
  {
   
    tone(8,1024,200);
    digitalWrite(ledPin,HIGH);
    delay(tempo);
  }
  else {
    noTone(8);
    digitalWrite(ledPin,LOW);

  } 

  delay(tempo/2);
}








