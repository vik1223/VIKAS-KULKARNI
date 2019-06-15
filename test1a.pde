PImage img = loadImage("image1a.jpeg");
size(640, 480);
loadPixels(); 
img.loadPixels();
int y=0;
int x=0;

//float c = 1.0 / 16.0;
float[][] filter = {{ -1, -2, -1 }, 
                    { 0, 0, 0 }, 
                    {  1, 2, 1  }};


for (y = 1; y < img.height-1; y++)
  for (x = 1; x < img.width-1; x++) {
    //int index = x + y * img.width;
    //float r = red (img.pixels[imgIndex]);
    //float g = green(img.pixels[imgIndex]);
    //float b = blue(img.pixels[imgIndex]);      
  //  pixels[imgIndex] =  color(0.21*r + 0.72*g + 0.07*b);

// {
    int response = 0;

    for (int ky = -1; ky <= 1; ky++) 
      for (int kx = -1; kx <= 1; kx++) {
       int index = (y + ky) * img.width + (x + kx);
        float r = brightness(img.pixels[index]);
        response += filter[ky+1][kx+1] * r;
      }
     
    pixels[y*width + x] = color(abs(response));

//  }
   }
updatePixels();
