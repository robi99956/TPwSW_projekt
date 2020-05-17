byte kp, Td;
void draw_buttons(){
cp5.addButton("RESET")
   .setPosition(1500,200)
   .setSize(200,70)
   .setFont(createFont("Arial",40))
   .setColorActive(color(255, 0, 0)) 
   .setColorBackground(color(100,0,0))
   .setColorForeground(color(190,0,0)) 
   ;
    
cp5.addButton("PRZESLIJ DANE")
   .setPosition(1500,100)
   .setSize(200,60)
   .setColorActive(color(255, 0, 0)) 
   .setColorBackground(color(100,0,0))
   .setFont(createFont("Arial",20))
   .setColorForeground(color(190,0,0)) 
   ;  
}

public void controlEvent(ControlEvent theEvent) {
  which_batton_pressed = theEvent.getController().getName();
  if(which_batton_pressed == "PRZESLIJ DANE"){
    sent_data();
  }
  if(which_batton_pressed == "RESET"){
    reset();
  }
}

void sent_data(){
  int temp = int(_kp);
  kp = parseByte(temp);
  temp = int(_Td);
  Td = parseByte(temp);
}

void reset(){
  cp5.get(Textfield.class,"kp").setText("10");
  cp5.get(Textfield.class,"Td").setText("10");
  myChart.removeDataSet("uchyb");
  leftWheel.setValue(0);
  rightWheel.setValue(0);
  left_blinker_off();
  right_blinker_off();
}
