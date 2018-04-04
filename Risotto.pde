int midWidth;
int midHeight;
int gridLinesWidth = 50;
int gridLinesHeight = 50;
int gridCircleWidth = 2 * gridLinesWidth;
int gridCircleHeight = 2 * gridLinesHeight;

int thicknessArc = 12;
int diaArc = 100;
int lineHeight = diaArc/2;

color circleDown = color(0, 121, 56); //groen
color circleDownBeard = color(250, 120, 214); //roos
color circleDownArms = color(41, 152, 236); //blauw
color circleDownNose = color(254, 58, 15); //donkeroranje
color circleUp = color(255,133,0); //lichtoranje
color circleUpHear = color(255,57,38); //donkeroranje
color circleUpArms = color(255,217,0); //geel
color circleUpNose = color(255, 120, 214); //roos

void setup() {
 size (600, 800);
 background(0);
 
 midWidth = width/2;
 midHeight = height/2;
 
 //drawGrid();
 drawFigures();
}

void drawFigures() {
  for(int i = 0; i < (width / gridCircleWidth); i ++) {
    for(int j = 0; j < (height / gridCircleHeight); j ++) {
      if((i+j) % 3 == 0) {
          drawRects(gridCircleWidth*i, gridCircleHeight*j, circleDownArms, circleDownNose); 
          drawArc(50 + gridCircleWidth*i, 50 + gridCircleHeight*j, circleDownBeard, "BEARD"); 
          drawCircle(50 + gridCircleWidth*i, 50 + gridCircleHeight*j, circleDown);
      } else if((i+j) % 3 == 1) {
          drawRects(gridCircleWidth*i, 50 + gridCircleHeight*j, circleUpArms, circleUpNose); 
          drawArc(50 + gridCircleWidth*i, 50 + gridCircleHeight*j, circleUpHear, "HEAR"); 
          drawCircle(50 + gridCircleWidth*i, 50 + gridCircleHeight*j, circleUp);
      } else {
          drawRects(gridCircleWidth*i, gridCircleHeight*j, circleUpArms, circleUpNose);
          drawRects(gridCircleWidth*i, 50 + gridCircleHeight*j, circleDownArms, circleDownNose);
      }
    }
  }
}

void drawRects(int x, int y, color cOutside, color cInside) {
  noStroke();
  fill(cOutside);
  rect(x, y, thicknessArc, lineHeight + 1); //+ 1 = mooie overgang
  rect(x + (2*gridLinesWidth) - thicknessArc, y, thicknessArc, lineHeight + 1);
  fill(cInside);
  rect(x + gridLinesWidth - (thicknessArc/2), y, thicknessArc, lineHeight + 1);
}

void drawArc(int centerArcX, int centerArcY, color c, String outline) {
  stroke(c);
  strokeCap(SQUARE);
  strokeWeight(thicknessArc);
  noFill();
  
  if(outline == "BEARD") {
    arc(centerArcX, centerArcY, (diaArc-thicknessArc), (diaArc-thicknessArc), 0, PI);
  } else if(outline == "HEAR") {
    arc(centerArcX, centerArcY, (diaArc-thicknessArc), (diaArc-thicknessArc), PI, TWO_PI);
  }
}

void drawCircle(int centerCircleX, int centerCircleY, color c) {
  noStroke();
  fill(c);
  
  ellipse(centerCircleX, centerCircleY, diaArc-2*thicknessArc, diaArc-2*thicknessArc);
}

void drawGrid() {
  for(int i = 50; i < height; i+=50) {
    line(i, 0, i, height);
    line(0, i, width, i);
  }  
}
