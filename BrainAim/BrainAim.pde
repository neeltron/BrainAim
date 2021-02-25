import processing.serial.*;
Serial myPort;
String val;
float att;
float aim_factor;

PImage[] sprite = new PImage[2];
void setup() {
  size(1200, 900);
  sprite[0] = loadImage("aim_sprite.png");
  imageMode(CENTER);
  String portName = Serial.list()[0];
  println(portName);
  myPort = new Serial(this, portName, 57600);
  att = 10;
  aim_factor = 2;
}
void draw() {
  if ( myPort.available() > 0) 
  {
    val = myPort.readStringUntil('\n');


    if (val != "null" || val != "") {
      att = float(val);
    }
  }
  att = random(0, 100);
  if (att >= 80) {
    aim_factor = 2;
  } else if (att <= 80 && att >= 60) {
    aim_factor = 1.5;
  } else {
    aim_factor = 3;
  }
  background(255);
  image(sprite[0], width/aim_factor, height/2);
}
