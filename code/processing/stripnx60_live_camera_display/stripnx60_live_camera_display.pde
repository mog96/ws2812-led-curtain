import processing.video.*;

OPC opc;
Capture cam;

int numStrips = 48;

void setup() {
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

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  }      
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  
  pushMatrix();
  scale(-1.0, 1.0);
  image(cam,-cam.width,0);
  popMatrix();
  
  // The following does the same, and is faster when just drawing the image
  // without any additional resizing, transformations, or tint.
  // set(0, 0, cam);
}