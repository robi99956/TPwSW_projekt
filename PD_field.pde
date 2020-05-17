Textarea myTextarea;
String _kp, _Td;

void draw_PD(){
  cp5.addTextfield("kp")
     .setPosition(1000,100)
     .setSize(100,40)
     .setFont(createFont("Arial",14))
     .setFocus(true)
     .setColor(color(255))
     .setColorForeground(color(100,0,0))
     .setColorCaptionLabel(color(0))
     .setColorActive(color(255,0,0))
     .setText("10")
     .setColorBackground(color(0))
     ;

  cp5.addTextfield("Td")
     .setPosition(1000,180)
     .setSize(100,40)
     .setFont(createFont("Arial",14))
     .setFocus(true)
     .setColor(color(255))
     .setColorForeground(color(100,0,0))
     .setColorCaptionLabel(color(0))
     .setColorActive(color(255,0,0))
     .setColorBackground(color(0))
     .setText("10")
     ; 
     
myTextarea = cp5.addTextarea("txt")
                  .setPosition(1150,140)
                  .setSize(500,200)
                  .setFont(createFont("arial",30))
                  .setLineHeight(14)
                  .setColor(color(255))
                  .setColorBackground(color(0))    //czarny -> 0  bialy -> 255
                  .setColorForeground(color(255));
                  ;
   _kp = cp5.get(Textfield.class,"kp").getText();
   _Td = cp5.get(Textfield.class,"Td").getText();   


}

void upload_text(){
  _kp = cp5.get(Textfield.class,"kp").getText();
  _Td = cp5.get(Textfield.class,"Td").getText();
  myTextarea.setText("Pd = " + _kp + " ( " + _Td + " s + 1 )");
}
