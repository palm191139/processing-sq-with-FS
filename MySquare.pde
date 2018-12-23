int count = 0;
PVector[] p;
void setup()
{
  fullScreen();
  //size(1000, 1000);
  noFill();
  p = new PVector[height];
  
  for(int i = 0 ; i < p.length ; i++)
  {
    p[i] = new PVector();
    p[i].x = 5000;
    p[i].y = 0;
  }
}



void draw()
{

  background(0);
  translate(200, height/2);
  PVector t = fft(0, 0, 0);
  line(t.x, t.y, 300, t.y);
  p[0].x = 300;
  p[0].y = t.y;
  stroke(0,0,255);
  //for(PVector i : p)
  //{ 
  //  ellipse(i.x,i.y,2,2);
  //}
  for(int i = 1 ; i < p.length ; i++)
  {
    line(p[i-1].x,p[i-1].y,p[i].x,p[i].y);
  }
  stroke(255);
  
  for(int i = p.length - 1  ; i > 0 ; i--)
  {
    p[i].x = p[i-1].x+1;
    p[i].y = p[i-1].y;
  }
}

PVector fft(float x, float y, int k)
{
  if ( k > count)
  {
    PVector temp = new PVector();
    temp.x = x;
    temp.y = y;
    return temp;
  }
  float s = 150.0/((k + 1)*2-1);
  ellipse(x, y, s*2, s*2);
  return fft(s*cos(((k + 1)*2-1)*2*frameCount/100.0)+x, s*sin(-((k + 1)*2-1)*2*frameCount/100.0)+y, ++k); // sq
}

PVector fft2(float x, float y, int k)
{
  if ( k > count)
  {
    PVector temp = new PVector();
    temp.x = x;
    temp.y = y;
    return temp;
  }
  float s = -1 * 150.0/((k*2+1)*(k*2+1));
  ellipse(x, y, s*2, s*2);
  return fft2(s*sin((k*2+1)*2*frameCount/100.0)+x, s*cos(-(k*2+1)*2*frameCount/100.0)+y, ++k); // sq
}

void keyPressed()
{
  if(key == 'q')
  {
    count ++;
  }
  if(key == 'a')
  {
    count --;
  }
}
