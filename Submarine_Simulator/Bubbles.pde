class Bubbles {
  //Feild
  PVector pos;
  float speed;
  
  //Constuctor
  Bubbles(Submarine S) {
    this.pos = new PVector(450+random(-S.length/2,S.length/2),S.pos.y);
    this.speed = random(1.5,4);
    
  }
  //Methods
  void drawBubbles() {
    if (this.pos.y >= 55) {
      stroke(51, 87, 255);
      strokeWeight(2);
      fill(103,183,218);
      circle(this.pos.x,this.pos.y,7);
    }
  }
}
