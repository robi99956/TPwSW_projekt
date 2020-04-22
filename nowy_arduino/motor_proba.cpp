#include <Arduino.h>

#define enA 3
#define in1 2
#define in2 4

#define enB 5
#define in3 6
#define in4 7

void setup() {

	//A to lewy, a B to prawy
	//Sygna³ PWM w zakresie (0,255)

	  pinMode(enA, OUTPUT);
	  pinMode(enB, OUTPUT);
	  pinMode(in1, OUTPUT);
	  pinMode(in2, OUTPUT);
	  pinMode(in3, OUTPUT);
	  pinMode(in4, OUTPUT);
}

void loop() {

	uint8_t powerA = 30;
	uint8_t powerB = 50;

    void jedz(uint8_t powerA,uint8_t powerB);

}

void jedz(uint8_t procentprawy,uint8_t procentlewy){


	if(procentprawy<0 )
	{
		//JAZDA DO TY£U

		    //Motor B do ty³u
		    digitalWrite(in3, HIGH);
		    digitalWrite(in4, LOW);
	}
	else
	{
			//Motor B do przodu
			digitalWrite(in3, LOW);
			digitalWrite(in4, HIGH);
	}
	if(procentlewy<0 )
	{
	    //Motor A do ty³
	    digitalWrite(in1, HIGH);
	    digitalWrite(in2, LOW);

	}
	else
	{
	    //Motor A do przodu
	    digitalWrite(in1, LOW);
	    digitalWrite(in2, HIGH);
	}
	analogWrite(enA,abs(procentprawy)*255);
	analogWrite(enB,abs(procentlewy)*255);

}

