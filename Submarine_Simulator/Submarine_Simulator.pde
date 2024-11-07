//This program is ment to simulate the crush depth of a submarine
//There is no exact formula for calculating this due to many external factors that can cause the submarine to crush earlier
//I'm using simplied formulas to show how the ratio of radius to wall thickness and material yeild strength will generaly affect the preformace of a submaine 

import g4p_controls.*;

//Constants
float p = 1023.6; //density of salt water (units: kg/m^3)
float g = 9.81; //gravitational constant (units: m/s^2)
float P = 0.101325; //presure inside the submarine - atmospheric pressure (units: MPa)
float n = 2.5; //saftey factor

//Variables
int MaterialIndex = 1;
String[] MP; //Material properties array;
float Len = 40; // (units: m)
float Diam = 18; // (units: m)
float Thic = 15; // (units: cm)
int d = 0; // (units: m)
Submarine S;
Bubbles[] B = new Bubbles[10];

void setup() {
  size(900,600);
  background(135, 206, 235);//sky
  createGUI();
  //create Submaine
  MP = getMP();
  S = new Submarine(Diam,Len,Thic,MP,450,60+int(Diam),MaterialIndex);
  
  noLoop();
}

void draw() { //submaine dive graphics
  if (S.safe == true) {
    d += 1; //increase depth
    S.pos.y += 0.25; //increase submarine y position; 
    
    //background
    for (int y=50; y < 600; y++) {
      stroke(0,0,150-(y/4));
      fill(0,0,150-(y/4));
      rect(0,y,900,1);
    }
    
    S.StressCheck();
    S.drawSubmarine();
    if (S.safe == false) {
      for(int i = 0; i < 10; i++) {
        B[i] = new Bubbles(S);
      }
    }
  }
  else { //colapse graphics
    S.radius -= 0.15;
    S.length -= 0.1;
    
    //background
    for (int y=50; y < 600; y++) {
      stroke(0,0,150-(y/4));
      fill(0,0,150-(y/4));
      rect(0,y,900,1);
    }
    
    //draw Bubbles
    for(int i = 0; i < 10; i++) {
      B[i].pos.y -= B[i].speed;
      B[i].drawBubbles();
      println(B[i].pos.x,B[i].pos.y);
    }
      
    //drawSubmaine
    S.drawSubmarine();
    
    //End animation
    if (S.radius <= 3) {
      //background
      for (int y=50; y < 600; y++) {
        stroke(0,0,150-(y/4));
        fill(0,0,150-(y/4));
        rect(0,y,900,1);
      }
      //drawSubmaine
      S.drawSubmarine();
      
      noLoop();
    }
  }
}
