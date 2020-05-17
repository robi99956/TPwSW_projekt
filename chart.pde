Chart myChart;
boolean error_data_read = false;
boolean wheels_speed_read = false;
void draw_chart(){

//cp5.printPublicMethodsFor(Chart.class);
  myChart = cp5.addChart(" ")
               .setPosition(60, 50)
               .setSize(700, 360)
               .setRange(0, 1.2)
               .setView(Chart.LINE);

  myChart.getColor().setBackground(color(0));



  stroke(255);
  line(50, 20, 50, 410);
  line(50, 410, 750, 410);
  triangle(40,30, 60, 30, 50, 10);
  triangle(760,400, 760, 420, 780, 410);
  
  line(45, 44 , 55, 44);  //podzialka na y
  text("1.2", 25, 47);
  line(45, 105 , 55, 105);  
  text("1.0", 25, 108);
  line(45, 166 , 55, 166);
  text("0.8", 25, 169);
  line(45, 227 , 55, 227);
  text("0.6", 25, 230);
  line(45, 288 , 55, 288);
  text("0.4", 25, 291);
  line(45, 349 , 55, 349);  
  text("0.2", 25, 352);    // koniec podzialki 
  line(150, 409 , 150, 420);  //podzialka na x
  text("1", 148, 440);
  line(250, 409 , 250, 420);  
  text("2", 248, 440);
  line(350, 409 , 350, 420);
  text("3", 348, 440);
  line(450, 409 , 450, 420);
  text("4", 448, 440);
  line(550, 409 , 550, 420);
  text("5", 548, 440);
  line(650, 409 , 650, 420);  
  text("6", 648, 440);    //koniec podzialki
  text("czas [s]", 750, 440);
  text("uchyb ", 30, 10);
  myChart.setStrokeWeight(1.5);
  myChart.addDataSet("uchyb");
  myChart.setColors("uchyb", color(255,0,0),color(255,0,0));
  myChart.setData("uchyb", data1);
  
  //myChart.setArrayValue(data1);
}

void upload_chart_data(){
  myChart.push(chartData);
}
