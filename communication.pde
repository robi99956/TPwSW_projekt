static final byte SOH = 1;
static final byte EOT = 3;
static final byte DLE = 16;
static final byte modifier = 64;

int speedLeft = 0;
int speedRight = 0;
int chartData = 0;

public Object encode (int [] input_data, int length_of_data)
{
  int [] output_data_i = new int [length_of_data*2+2];
  int j=0;
  output_data_i[j++] = SOH;
  for (int i =0; i<length_of_data; i++)
  {
    if(input_data[i] == SOH || input_data[i] == EOT || input_data[i] == DLE )
    {
       output_data_i[j++] = DLE;
       output_data_i[j++] = input_data[i] + modifier ;
    }
    else 
    {
      output_data_i[j++] = input_data[i]; 
    }
  }
  output_data_i[j++] = EOT;
  byte [] output_data_b = new byte[j];
  for (int i=0; i<j; i++)
  {
    output_data_b[i] =byte( output_data_i[i] );
  }
  return output_data_b;
}

public Object decode (int [] input_data, int length_of_data)
{
  int length_of_output=0;
  int [] output_data = new int[length_of_data];
  int i=0;
  while(input_data[i] != SOH)
  {
    i++;
  }
  i++;
  for (int j=0; j<length_of_data; j++)
  {
    if (input_data[i+j]== DLE)
    {
      i++;
      output_data[j] = input_data[i+j] - modifier;
    }
    else if(input_data[i+j]== EOT )
    {
        length_of_output = j;
        break;
    }
    else
    {
        output_data[j] = input_data[j+i];
    }
      
  }
   int[] data = new int [length_of_output];
        for (int k=0;k<length_of_output;k++)
        {
          data[k] = output_data[k];
        }
  return data;
}


public int read_data()
{
  int value=0;
  while (Port.available() > 0) {
      value= Port.read();   
      return value;
  }
  return 0;
}

void write_PD_data()
{
  int kp = int(cp5.get(Textfield.class,"kp").getText());
  int Td = int(cp5.get(Textfield.class,"Td").getText());
  int [] PD = {kp, Td};
  Port.write((byte[])encode(PD, PD.length));
}

void write_RESET()
{
  int [] RESET = {16, 16};
  Port.write((byte[])encode(RESET, RESET.length));
}
