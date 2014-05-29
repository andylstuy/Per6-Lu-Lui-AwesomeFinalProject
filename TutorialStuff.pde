/* ===================== IMPORTING IMAGES =====================
PImage img;

void setup() {
  size(685,540);
  img = loadImage("Wright_Objection_Hobo_Style.png"); 
  /*image file must be in a folder named "data" in the same 
    directory as the Driver file in order to be imported*/
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

/* ============= SETTING PIXELS USING 2D LOCATION =============
size(685,540);
loadPixels();  
// Loop through every pixel column
for (int x = 0; x < width; x++) {
  // Loop through every pixel row
  for (int y = 0; y < height; y++) {
    // Use the formula to find the 1D location
    int loc = x + y * width;
    if (x % 2 == 0) { // If we are an even column
      pixels[loc] = color(0,100,190);
    } else {          // If we are an odd column
      pixels[loc] = color(255);
    }
  }
}
updatePixels(); 
============================================================ */
