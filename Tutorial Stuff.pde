/* ===================== IMPORTING IMAGES =====================
PImage img;

void setup() {
  size(685,540);
  img = loadImage("Wright_Objection_Hobo_Style.png"); 
  //image file must be in a folder named "data" in the same 
  //directory as the Driver file in order to be imported
}

void draw() {
  background(255);
  image(img,0,0);
}
============================================================ */

/* ====================== SETTING PIXELS ======================
size(685,540);
// Before we deal with pixels
loadPixels(); //"Load the pixels, I would like to speak with them!"
// Loop through every pixel
for (int i = 0; i < pixels.length; i++) {
  // Pick three random numbers, 0 to 255
  float r = random(255);
  float g = random(255);
  float b = random(255);
  // Create a color based on the random rgb values
  color c = color(r,g,b);
  // Set pixel at that location to random color
  pixels[i] = c;
}
// When we are finished dealing with pixels
updatePixels(); //"Go ahead and update the pixels, I'm all done!"
============================================================ */
