// CODE MIDTERM
// Rotoscoping
//
// This sketch loads the assigned frames and plays them back
// Add your own draw code
// Then it saves out the rendered frames
//
// DON'T FORGET TO CHANGE THE VALUE OF THE STUDENTNAME VARIABLE TO YOUR NAME!!



import java.io.File;

File[] tempfiles;
ArrayList<File> files;
PImage image;
String currentFilename;

// EDIT THIS LINE WITH YOUR NAME!
String studentName = "Xiaojie Yang";

int numPos =50;
PVector [] pos= new PVector[numPos];
int num = 10; // number
Tree[] trees; // array
float theta= 0;


void setup() {
  files = new ArrayList<File>();

  // get list of files from directory
  File dir = new File(sketchPath() + "/rawFrames");
  tempfiles = dir.listFiles();

  // filter out files that don't end in .png
  for (int i = 0; i < tempfiles.length; i++) {
    String path = tempfiles[i].getAbsolutePath();
    if (path.toLowerCase().endsWith(".png")) {
      files.add(tempfiles[i]);
    }
  }

  // Resize the canvas to full-HD 1080p glory
  size(960, 540);
  pixelDensity(2);
  
  // if that doesn't work, comment it out and uncomment this instead:
  //size(1920, 1080);
  //pixelDensity(1);
  
  

  smooth();
  
  //initialize array
  trees = new Tree[num]; 
  
  //array contains Tree objects
  for (int i =0; i<num; i++) {
    trees[i] = new Tree();
  }
  for (int a= 0; a<numPos; a++) {
     pos[a]=new PVector(0,0);
  }
  
  
}

void draw() {

  // DO NOT ALTER THE LINE BELOW
  prepare();

  // BEGIN ADDING YOUR CODE HERE -----
  fill(129,191,525,50);
  rect(0, 0, width, height);
  
  //orbit
  for(int i=0;i<100;i+=20){
  float x = i*cos(theta); 
  float y = i*sin(theta); 
  
  //circle
  noStroke();
  fill(55,155,219);
  ellipse(x+width/2-100, y+height/2-80, 5, 5);
  ellipse(x+width/2+160, y+height/2-80, 5, 5);
  ellipse(x+width/2+160, y+height/2+110, 5, 5);
  ellipse(x+width/2-100, y+height/2+110, 5, 5);



  
  //for(int i = 0; i<180; i+=20){
  //  fill(i, 0, 255);
  //  ellipse((x+i)+width/4, (y+i)+height/4, 20, 20);
  //}
  
  theta +=.3; 
  }
   
   
   
   for (int i = 0; i< numPos-1; i++) {
    //xPos[i]= xPos[i+1]; 
    //yPos[i]= yPos[i+1]; 
    pos[i].x=pos[i+1].x;
    pos[i].y=pos[i+1].y;
  }
   //nav for cirlces to follow mouse
   //xPos[numPos-1] = mouseX; 
   //yPos[numPos-1] = mouseY; 
   pos[numPos-1].set (mouseX,mouseY) ;
   
   for( int i= 0; i< numPos; i++) {
     fill(random(100,255), random(150,255), 255, random(50,200));  
     ellipse(pos[i].x, pos[i].y, 50, 50); 
    
  }
  
  for (int i =0; i<num; i++) {
    trees[i].drawTree();
    trees[i].moveTree();
    
  }

  // STOP ADDING YOUR CODE HERE -----

  // DO NOT ALTER THE LINES BELOW
  if (frameCount <= files.size()) { 
    export();
  } if(frameCount == files.size()) {
    exit();
  }
}

// DO NOT ALTER THIS FUNCTION!!
void prepare() {
  String path = files.get(frameCount-1).getAbsolutePath();
  currentFilename = files.get(frameCount-1).getName();

  // Load current file into our PImage variable
  tint(255, 255);
  image = loadImage(path);
  image(image, 0, 0, width, height);
}

// DO NOT ALTER THIS FUNCTION!!
void export() {
  // saves frame without watermark
  saveFrame(sketchPath() + "/outFrames/edited_" + currentFilename);

  int sidePadding = 125;
  int bottomPadding = 50;
  
  textAlign(LEFT);
  textSize(32);
  fill(255);
  text(studentName, sidePadding + 1, height - bottomPadding + 1);
  fill(0);
  text(studentName, sidePadding, height - bottomPadding);

  // saves frame with watermark
  saveFrame(sketchPath() + "/outFrames/watermarked_" + currentFilename);
}