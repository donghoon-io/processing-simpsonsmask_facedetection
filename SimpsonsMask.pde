import processing.video.*;

Redcheck scr = new Redcheck();
SimpMask l = new SimpMask();
Main m = new Main();
Capture cam;
int threshold = 100;
PImage penlayer;
PImage img;
PFont font;
IntList xSum;
IntList ySum;
IntList aX;
IntList aY;
Boolean mainDone = false;
String choice;

void setup() {
  size(640, 480);
  cam= new Capture(this, width, height, 30);
  penlayer = createImage(width, height, ARGB);
  cam.start();
  font = createFont("koverwatch.ttf", 100);
}

void draw() {
  if (!mainDone) {
    m.drawMain();
  } else {
    xSum=new IntList();
    ySum=new IntList();
    if (cam.available()) { 
      cam.read();
      flip();
    }
    image(cam, 0, 0);
    image(penlayer, 0, 0);
    if (mousePressed == true) {
      threshold = mouseY;
      for (int i=0; i<penlayer.pixels.length; i++) {
        penlayer.pixels[i] = color(0, 0, 0, 0);
      }
      penlayer.updatePixels();
    }
    for (int x = 0; x < cam.width; x++) {
      for (int y = 0; y < cam.height; y++) {
        color pixelColor = cam.pixels[y*cam.width + x];
        float redity = red(pixelColor) - (green(pixelColor) + blue(pixelColor))/2; //degree of red
        if (redity > threshold) {
          xSum.append(x);
          ySum.append(y);
        }
      }
    }
    aX=new IntList();
    aY=new IntList();
    if (scr.ifRed()) {
      for (int i=0; i<xSum.size(); i++) {
        if (!aX.hasValue(xSum.get(i))) {
          aX.append(xSum.get(i));
        }
        if (!aY.hasValue(ySum.get(i))) {
          aY.append(ySum.get(i));
        }
      }
    }
    aX.sort();
    aY.sort();
    if (scr.ifRed()) {
      l.simpDraw();
    }
    scr.textRed();
  }
  if (keyPressed) {
    if (key=='m'||key=='M') {
      mainDone=false;
    }
  }
  fill(255);
  rect(490, 10, 140, 80);
  textSize(30);
  fill(0);
  text("Press M to go", 495, 45);
  text("back to main", 500, 75);
}

void flip() {
  PImage buffer = new PImage(cam.width, cam.height);
  for (int i=0; i<cam.pixels.length; i++) {
    buffer.pixels[i] = cam.pixels[i];
  }
  for (int x=0; x<cam.width; x++) {
    for (int y=0; y<cam.height; y++) {
      cam.pixels[y*cam.width+x] = buffer.pixels[y*cam.width+(cam.width-x-1)];
    }
  }
}