Knob leftWheel, rightWheel;
int []  data;
float [] data1;
float [] data2;
PShape arrowL,arrowR;
int timer;
boolean wylaczony = true;
void draw_wheels(){
leftWheel = cp5.addKnob("Lewe Kolo")
               .setRange(0,100)
               .setValue(0)
               .setPosition(100,500)
               .setRadius(120)
               .setNumberOfTickMarks(50)
               .setTickMarkLength(20)
               .snapToTickMarks(true)
               .setColorBackground(color(10,10,10))
               .setColorForeground(color(255))
               .setColorCaptionLabel(color(255))
               .setColorValueLabel(color(255,0,0))
               .setColorActive(color(255,0,0))
               .setDragDirection(Knob.HORIZONTAL)
               .setFont(createFont("Arial",20))
               ;

rightWheel = cp5.addKnob("Prawe Kolo")
               .setRange(0,100)
               .setValue(0)
               .setPosition(500,500)
               .setRadius(120)
               .setNumberOfTickMarks(50)
               .setTickMarkLength(20)
               .snapToTickMarks(true)
               .setColorBackground(color(10,10,10))
               .setColorForeground(color(255))
               .setColorCaptionLabel(color(255))
               .setColorValueLabel(color(255,0,0))
               .setColorActive(color(255,0,0))
               .setDragDirection(Knob.HORIZONTAL)
               .setFont(createFont("Arial",20))
               ;
               
arrowL = createShape();
  arrowL.beginShape();
  arrowL.fill(200,200,200);
  arrowL.vertex(380, 472);
  arrowL.vertex(380, 493);
  arrowL.vertex(355, 493);
  arrowL.vertex(355, 500);
  arrowL.vertex(330, 485);
  arrowL.vertex(355, 465);
  arrowL.vertex(355, 472);
  arrowL.vertex(380, 472);
  arrowL.endShape();
  
arrowR = createShape();
  arrowR.beginShape();
  arrowR.fill(200,200,200);
  arrowR.vertex(430, 472);
  arrowR.vertex(430, 493);
  arrowR.vertex(455, 493);
  arrowR.vertex(455, 500);
  arrowR.vertex(480, 485);
  arrowR.vertex(455, 465);
  arrowR.vertex(455, 472);
  arrowR.vertex(430, 472);
  arrowR.endShape();
  
shape(arrowL, 0, 0);
shape(arrowR, 0, 0);
wylaczony = true;
data = new int [100];;
data1 = new float[100];
data2 = new float [100];



init_random_values_float(100, data1, data2);
init_random_values_int(100,data);
}

void left_blinker_on(){
  arrowL.setFill(color(0,255,0));
  shape(arrowL, 0, 0);
 
  
}

void left_blinker_off(){
 
  arrowL.setFill(color(200,200,200));
  shape(arrowL, 0, 0);
  
}

void right_blinker_on(){
  arrowR.setFill(color(0,255,0));
  shape(arrowR, 0, 0);
}

void right_blinker_off(){
  arrowR.setFill(color(200,200,200));
  shape(arrowR, 0, 0);
}

void init_random_values_int (int ile, int[] data) {
  Random generator = new Random();
  for( int i=0; i<ile; i++)
    data[i] =generator.nextInt(100);    
}
void init_random_values_float (int ile, float[] data, float [] data2) {
  Random generator = new Random();
  for( int i=0; i<ile; i++){
    data[i] =generator.nextFloat()/2;
    data2[i] =generator.nextFloat();
  }
}

void update_wheels_value(int valueL, int valueR){
  leftWheel.setValue(valueL);
  leftWheel.setColorForeground(setGradient((int)(leftWheel.getValue())));
  rightWheel.setValue(valueR);
  rightWheel.setColorForeground(setGradient((int)(rightWheel.getValue())));
  blinker_on();
  
}

void blinker_on(){
  if( rightWheel.getValue()>leftWheel.getValue() && wylaczony==true){
    right_blinker_on();
    timer=frameCount;
    wylaczony = false;
  }
  else if( rightWheel.getValue()<leftWheel.getValue() && wylaczony==true) {
    left_blinker_on();
    timer=frameCount;
    wylaczony = false;
  }
  if(frameCount-timer>20){
    right_blinker_off();
    left_blinker_off();
    wylaczony = true;
  }
}

color setGradient(int knob_value) { 
  int r =int(knob_value*2.55);
  int b = 255 - int(knob_value*2.55);
      color c = color(r, 0, b);
     return c;
}
  
