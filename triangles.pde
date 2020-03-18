// Array of particles and triangles 

ArrayList poop;
boolean flag=true;
int d=80;

void setup() {
  size(600,600, P2D);
  smooth();
  
  poop = new ArrayList();
  
  for (int i=0;i<50;i++){
    Particle P = new Particle();
    poop.add(P);
  }

}

void draw() {

  // background(-1);
  fill(0, 15);
  rect(-10, 0, width+20, height);
  for (int a=0;a<poop.size();a++) {

    Particle Pn1 = (Particle) poop.get(a);
    Pn1.display();
    Pn1.update();

    for (int j = a + 1; j < poop.size(); j++) {
      Particle Pn2 = (Particle) poop.get(j);
      Pn2.update();

      if (dist(Pn1.x, Pn1.y, Pn2.x, Pn2.y)< d) {

        for (int k = j + 1; k < poop.size(); k++) {
          Particle Pn3 = (Particle) poop.get(k);

          if (dist(Pn3.x, Pn3.y, Pn2.x, Pn2.y)< d) {

            if (flag) {
              stroke(255, 10);
              fill(Pn3.c, 95); // method to access the class property
            }
            else {
              noFill();
              strokeWeight(1);
              stroke(0, 20);
            }
            beginShape(TRIANGLES);
            vertex(Pn1.x, Pn1.y);
            vertex(Pn2.x, Pn2.y);
            vertex(Pn3.x, Pn3.y);
            endShape();
          }
 
          Pn3.update();
        }
      }
    }
  }
}
 
class Particle {

  float x, y, r;
  color c;
  int i=1, j=1;

  Particle( ) {

    x = random(0, width);
    y = random(0, height);
    r = random(1,5);

    int j = (int)random(0, 4);

    if (j==0) {  c = color(#0353F4);  }
    if (j==1) {  c = color(#076DF3);  }
    if (j==2) {  c = color(#0580F3);  }
    if (j==3) {  c = color(#9CBD12);  }
  }
 
  void display() {
    pushStyle();

    noStroke(); fill(c);

    ellipse(x, y, r, r);

    popStyle();
  }
 
  void update() {
    x = x + j*0.01;
    y = y + i*0.01;

    if (y > height-r) i=-1;
    if (y < 0+r) i=1;
    if (x > width-r) j=-1;
    if (x < 0+r) j=1;
  }
}
