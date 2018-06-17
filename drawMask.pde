class SimpMask {
  SimpMask() {
  }
  void simpDraw() {
    switch(choice) {
    case "lisa":
      img=loadImage("lisa.png");
      break;
    case "homer":
      img=loadImage("homer.png");
      break;
    case "bart":
      img=loadImage("bart.png");
      break;
    case "maggie":
      img=loadImage("maggie.png");
      break;
    }
    int xLen=2*(aX.get(aX.size()*10/11)-aX.get(aX.size()/11));
    int yLen=2*(aY.get(aY.size()*10/11)-aY.get(aY.size()/11));
    if (xLen>=yLen) {
      img.resize(xLen, xLen);
    } else {
      img.resize(yLen, yLen);
    }
    image(img, aX.get(aX.size()/2)-xLen/2, aY.get(aY.size()/2)-yLen/2);
  }
}