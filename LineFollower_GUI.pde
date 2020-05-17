import controlP5.*;
import processing.serial.*;
import java.util.*;
String which_batton_pressed;
ControlP5 cp5;
int s=0;
Serial Port;
void setup() {
  Port = new Serial(this, Serial.list()[0], 9600);
  println(Serial.list()[0]);
  cp5 = new ControlP5(this);
  size(1800, 800);
  background(color(0));
  draw_wheels();      //inicjalizuje kola
  draw_PD();          // inicjalizuje pola tekstowe na pd
  draw_chart();       // inicjalizuje wykres
  draw_buttons();     //inicjalizuje przyciski
  image(loadImage("car.png"), 1100, 450);      // obrazek dla zapełnienia dziury, mozna wstawic fotke naszego linefollowera 
  
  

}

void draw() {
  if(cp5.get(Textfield.class,"kp").getText() != _kp || cp5.get(Textfield.class,"Td").getText() != _Td)        //jesli zmienilismy wpis w PD
    upload_text();
  if(error_data_read)// jesli nowe dane o uchybie
  {
    error_data_read = false;
    upload_chart_data();
  }
  if(wheels_speed_read)             // jesli nowe dane o predkosci kol
  {
    wheels_speed_read = false;
    update_wheels_value(speedLeft, speedRight);
  }
  
    
    if (frameCount == 1){

    }
    
}

void keyPressed() {
}
void mouseMoved() {
}
