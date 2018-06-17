class Main {
  PImage simpsons;
  PImage ba;
  PImage ho;
  PImage ma;
  PImage li;
  Main() {
  }
  void drawMain() {
    simpsons=loadImage("family.png");
    ba=loadImage("bart.png");
    ho=loadImage("homer.png");
    ma=loadImage("maggie.png");
    li=loadImage("lisa.png");
    noStroke();
    fill(250, 150, 0);
    rect(0, height/4, width/4, height*3/4);
    fill(150, 250, 0);
    rect(width/4, height/4, width/4, height*3/4);
    fill(0, 150, 250);
    rect(width/2, height/4, width/4, height*3/4);
    fill(0, 250, 150);
    rect(width*3/4, height/4, width/4, height*3/4);
    fill(255);
    rect(0, 0, width, height/4);
    if (mousePressed) {
      if (0<=mouseX&&mouseX<width/4) {
        choice="homer";
      } else if (width/4<=mouseX&&mouseX<width/2) {
        choice="lisa";
      } else if (width/2<=mouseX&&mouseX<width*3/4) {
        choice="maggie";
      } else if (width*3/4<=mouseX&&mouseX<=width) {
        choice="bart";
      }
      mainDone=true;
    }
    simpsons.resize(250, 120);
    image(simpsons, -30, 0);
    fill(70, 90, 255);
    textFont(font);
    textSize(60);
    text("니 얼굴 심슨", 250, 80);
    fill(0);
    textSize(40);
    text("Homer", 40, 200);
    text("Lisa", 215, 200);
    text("Maggie", 360, 200);
    text("Bart", 530, 200);
    ho.resize(170, 190);
    image(ho, -5, 295);
    li.resize(160, 160);
    image(li, 160, 320);
    ma.resize(160, 160);
    image(ma, 320, 320);
    ba.resize(160, 160);
    image(ba, 480, 320);
  }
}