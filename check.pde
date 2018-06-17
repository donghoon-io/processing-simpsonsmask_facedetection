class Redcheck {
  Redcheck() {
  }
  void textRed() {
    if (xSum.size()<50) {
      noStroke();
      fill(255);
      rect(145,180,350,100);
      fill(50, 80, 50);
      textFont(font);
      textSize(30);
      text("Cannot recognize your face", 190, height/2-25);
      text("Put the red mask on your face.", 175, height/2+25);
    }
  }
  boolean ifRed() {
    if (xSum.size()<50) {
      return false;
    } else {
      return true;
    }
  }
}