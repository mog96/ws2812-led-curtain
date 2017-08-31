OPC opc;
PImage im;

int numStrips = 48;

void setup()
{
  size(800, 400);

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);

  // Map 60-LED strips.
  for (int i = 0; i < numStrips; i++) {
    // Vertical layout.
    opc.ledStrip(i * 60, 60, i * width / numStrips + (width / numStrips / 2), height / 2, height / 70, HALF_PI, false);
    
    // Horizontal layout.
    // opc.ledStrip(i * 60, 60, width / 2, i * height / numStrips + (height / numStrips / 2), width / 70.0, 0, false);
  }
}

void draw()
{
  background(0);
  fill(255, 0, 0);
  rect(mouseX, mouseY, 200, 200);
}