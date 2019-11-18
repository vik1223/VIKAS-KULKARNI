PImage img = loadImage("image1a.jpeg");
size(640, 480);
loadPixels(); 
img.loadPixels();
int y=0;
int x=0;
//pi=a1[i][j];
//qi=a2[i][j];
//float c = 1.0 / 16.0;
float[][] filterx={{-1, 2, -1},                  //horizontal x axis  reference pdf 
                    { 0, 0, 0 }, 
                    {  1, 2, 1  }};
                    
                    
                    
 float[][] filtery={{1,0,1},                 // vertical y axis   reference pdf
                    { -2,0,2 }, 
                    {  -1,0,1  }};

float gradient=0;
float angle =0;
float gx=0;
float gy=0;
float e0=0, e1=0, e2=0, e3=0;
float x1;
float y1;
//float p;
//float q;
int index_point=0;
float[][] a1 = new float[81][4];
for (y = 1; y < img.height-1; y++)               //top left corner bottom right corner that is to fit the image
  for (x = 1; x < img.width-1; x++) {
    //int index = x + y * img.width;
    //float r = red (img.pixels[imgIndex]);
    //float g = green(img.pixels[imgIndex]);
    //float b = blue(img.pixels[imgIndex]);      
  //  pixels[imgIndex] =  color(0.21*r + 0.72*g + 0.07*b);

// {
  gx = 0; gy = 0;
  for (int ky = -1; ky <= 1; ky++)                   // applying filter at different position in the image
      for (int kx = -1; kx <= 1; kx++) {
       int index = (y + ky) * img.width + (x + kx);     // to read the pixels
        float r = brightness(img.pixels[index]);      // to read 
        //response += filtery[ky+1][kx+1] * r;
        gx+=filterx[ky+1][kx+1] * r;
        gy+=filtery[ky+1][kx+1] * r;
         
 //angle= atan(gy/gx);

      }
     gradient= abs( gx)+abs(gy);
   //pixels[y*width + x] = color(abs(response));
//print (gradient);
//print(gx);
//  }
//angle = atan(gx/gy);
if (gx>0)
{
  angle =atan(gy/gx);
}
if (gx<0)
{ 
angle =(angle)+PI;     //  assigning value 
}
if (gy>0)
{
  angle =PI/2;
}
if (gy<0)
{ 
angle = -PI/2;
}
else
angle=0;

 //if (angle<=0) //+ 2pi//
   // {
     // angle+2 PI;
if (angle >=0 && angle< HALF_PI)        //assigning value to each quadrant
{
e0=gradient;
e1=0;
e2=0;
e3=0;
}
else
if (angle >=HALF_PI && angle<PI)
{
e0=0;
e1=gradient;
e2=0;
e3=0;
}
else

if (angle >=PI && angle< (3*PI) /2)
{
e0=0;
e1=0;
e2=gradient;
e3=0;
}
else

if (angle >=(3 *PI) /2 && angle<PI)
{
e0=0;
e1=0;
e2=0;
e3=gradient;
}
//   }
   
//  for (y=1; y<height-(height/9)-1;y=y+height/9) 
//    for (x=1; x<width-(width/9)-1;x=x+width/9) { 
    
//    y= y+height/9;
  //  x=x+width/9;
    
    
 //   for (y1=y; y1<= y+height/9; y1++)
  //    for(x1=x; x1<=x+width/9;x1++) {
  
int p=(9*x)/img.width;   //pixel to block 
int q=(9*y)/img.height;
index_point=9*p+q;

a1[index_point][0] +=e0;  // assigning to matrix
a1[index_point][1] +=e1;
a1[index_point][2] +=e2;
a1[index_point][3] +=e3;
      }
      
    //for (int v1=0; v1<81; v1++)
      //for(int u1=0; u1<4;u1++) {
 // for (int x1 =0; x1<81; x1++)
   // for (int y1=0; y1<81; y1++)

    // print (a1[x1][y1] + " ");
      //}
 
      
    // }
   
    PImage img1 = loadImage("image1a.jpeg");
size(640, 480);
loadPixels(); 
img.loadPixels();
int u=0;
int v=0;
//pi=a1[i][j];
//qi=a2[i][j];
//float c = 1.0 / 16.0;
float[][] filteru={{-1, 2, -1},
                    { 0, 0, 0 }, 
                    {  1, 2, 1  }};
                    
                    
                    
 float[][] filterv={{1,0,1}, 
                    { -2,0,2 }, 
                    {  -1,0,1  }};

float gradient1=0;
float angle1 =0;
float gu=0;
float gv=0;
float f0=0, f1=0, f2=0, f3=0;
float u1;
float v1;
//float p;
//float q;
int index_point1=0;
float[][] a2 = new float[81][4];
for (v = 1; v < img1.height-1; v++)
  for (u = 1; u < img1.width-1; u++) {
    //int index = x + y * img.width;
    //float r = red (img.pixels[imgIndex]);
    //float g = green(img.pixels[imgIndex]);
    //float b = blue(img.pixels[imgIndex]);      
  //  pixels[imgIndex] =  color(0.21*r + 0.72*g + 0.07*b);

// {
  gu = 0;    gv = 0;
  for (int kv = -1; kv <= 1; kv++) 
      for (int ku = -1; ku <= 1; ku++) {
       index_point1 = (v + kv) * img1.width + (u + ku);
        float r = brightness(img1.pixels[index_point1]);
        //response += filtery[ky+1][kx+1] * r;
        gu+=filteru[kv+1][ku+1] * r;
        gv+=filterv[kv+1][ku+1] * r;
         
// angle1= atan(gv/gu);

      }
     gradient1= abs( gu)+abs(gv);
    // print(gradient1);
   //pixels[y*width + x] = color(abs(response));

//  }
angle1 = atan(gu/gv); print(angle1);
if (gu>0)
{
  angle1 =(gv/gu);
}
if (gu<0)
{ 
angle1 =(angle1)+PI;
}
if (gv>0)
{
  angle1 =PI/2;
}
if (gv<0)
{ 
angle1 = -PI/2;
}
else
angle1=0;


if (angle1 >0 && angle1< HALF_PI)
{
f0=gradient1;
f1=0;
f2=0;
f3=0;
}
else
if (angle >=HALF_PI && angle<PI)
{
f0=0;
f1=gradient1;
f2=0;//println (f1);
f3=0;

}
//println (f1);
else

if (angle >=PI && angle< (3*PI) /2)
{
f0=0;
f1=0;
f2=gradient1;
f3=0;
}
else

if (angle >=(3 *PI) /2 && angle<PI)
{
f0=0;
f1=0;
f2=0;
f3=gradient1;
}
  // }
   
  //for (v=1; v<height-(height/9)-1;v=v+height/9) 
    //for (u=1; u<width-(width/9)-1;u=u+width/9) { 
    
    //v= v+height/9;
    //u=u+width/9;
    
    
   // for (v1=v; v1<= v+height/9; v1++)
    //  for(u1=u; u1<=u+width/9;u1++) {
  
int p=(9*u)/width;
int q=(9*v)/height;
index_point1=9*p+q;

a2[index_point1][0] +=f0;
a2[index_point1][1] +=f1;
a2[index_point1][2] +=f2;
a2[index_point1][3] +=f3; println (f1); 

    }
  //  println (index_point1);  
    
    //for (int v2=0; v2<81; v2++)
     //for (int u2=0; u2<4; u2++){
       
   //  print (a1[v2][u2] + " ");
//print(angle,angle1);
      //}
   // } 
      
 int i =0;
 int j=0;
float maga1 =0;
float maga2 =0;
 float sim =0;
 float sim1=0;
float mult=0;
 
 for (i=0; i<81 ; i++)
 for (j=0; j<4;j++) 
 {
   float num1= a1[i][j];
    float num2= a2[i][j];
    mult+=(num1*num2);
    ///println ("a1[i][j]*a2[i][j]",mult);
    maga1+= (num1*num1);
    ///println ("Magnitude of a1",mag a1);
    maga2+=  (num2*num2);
///println ("Magnitude of a2",mag a2);
    
 }
 
 for (i=0; i<81 ; i++)
 for (j=0; j<4;j++) 
 {
   
    //println ( a2[i][j]);
 
///println ("Magnitude of a2",mag a2);
    
 }
    sim=(mult)/(sqrt(maga1)*sqrt(maga2));
    
    println("Cosine similarity of a1 and a2",sim);
    
//updatePixels();

  
  
    


    
