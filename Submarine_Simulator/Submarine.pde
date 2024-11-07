class Submarine {
  //Field
  float radius,length,thickness,AxialStress,HoopStress,Sy;
  int MaterialIndex;
  Boolean safe;
  PVector pos;
  
  //Constuctor
  Submarine(float d, float l, float t, String[] mp, int x, int y, int MI) {
    this.radius = d/2;
    this.length = l;
    this.thickness = t;
    this.Sy = float(mp[1]);
    this.safe = true;
    this.AxialStress = 0;
    this.HoopStress = 0;
    this.MaterialIndex = MI;
    pos = new PVector(x,y);
    
  }
  
  //Methods
  void drawSubmarine() {
    //Draw Submaine
    stroke(70);
    fill(120-30*this.MaterialIndex);
    strokeWeight(this.thickness/4);
    circle(pos.x-(this.length),pos.y,this.radius*4);
    circle(pos.x+(this.length),pos.y,this.radius*4);
    rect(pos.x-(this.length),pos.y-(this.radius*2),this.length*2,this.radius*4);
    fill(53,126,199);
    circle(pos.x-(this.radius*2),pos.y,this.radius*2);
    circle(pos.x+(this.radius*2),pos.y,this.radius*2);
    
    //Depth Display
    fill(255);
    stroke(0);
    strokeWeight(5);
    rect(60,70,170,40);
    noStroke();
    fill(50);
    textSize(20);
    text("Depth:"+d+"m",70,100);
    
    //Stats display
    fill(255);
    stroke(0);
    strokeWeight(5);
    rect(650,70,170,120);
    noStroke();
    fill(50);
    textSize(12);
    text("Axial Stress:"+(round(100*this.AxialStress)/100.0)+"MPa",660,100); //negative stress means compression
    text("Hoop Stress"+(round(100*this.HoopStress)/100.0)+"MPa",660,120);
    text("Yeild Strength:"+Sy/n+"MPa",660,140);
    textSize(20);
    if (safe == true) {
      fill(0,200,0);
      text("Safe",715,170);
    }
    else {
      fill(200,0,0);
      text("Not Safe",690,170);
    }
  }
  
  void StressCheck() {
    this.AxialStress = (P*pow(this.radius,2)-HSP()*pow(this.radius+(this.thickness/100),2))/(pow(this.radius+(this.thickness/100),2)-pow(this.radius,2)); //Axial Stress
    this.HoopStress = this.AxialStress+((pow(this.radius+(this.thickness/100),2)*pow(this.radius,2)*(HSP()-P))/(pow(this.radius+(this.thickness/200),2)*(pow(this.radius+(this.thickness/100),2)-pow(this.radius,2)))); //Hoop Stress
    float omax = max(this.AxialStress,this.HoopStress);
    float omin = min(this.AxialStress,this.HoopStress);
    println(omax,omin);
    println((pow(omax,2)-(omax*omin)+pow(omin,2)),Sy/n);
    if (abs(omin) <= Sy/n)
      this.safe = true;
    else
      this.safe = false;
  }
}
