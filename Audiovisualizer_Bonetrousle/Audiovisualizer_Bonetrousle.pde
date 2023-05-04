import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

FFT fft;

Minim minim;

AudioPlayer track;

float boneHeight;

PImage Bone;
PImage BoneBG;
PImage Papyrus;
PImage Heart;
PImage Board;

int canvasWidth = 1080;
int canvasHeight = 540;

String audioFileName = "Undertale - Bonetrousle.mp3";

float fps = 60;
float smoothingFactor = 0.25;

void settings() 
{
  size(canvasWidth, canvasHeight);
  smooth(8);
}
  
void setup() {
  frameRate(fps);
  
  minim = new Minim(this);
  track = minim.loadFile(audioFileName, 2048);

  track.loop();
  
  fft = new FFT(track.bufferSize(), track.sampleRate());
  
  Bone = loadImage("BoneAttacks.png");
  BoneBG = loadImage("BoneBG.png");
  Papyrus = loadImage("Papyrus.png");
  Heart = loadImage("Heart.png");
  Board = loadImage("BulletBoard.png");
  
  boneHeight = height + 100;

} 

void draw()
{
  background(BoneBG);
  
  fft.forward(track.mix);
  track.play();
  
  fft.forward(track.left);
  for (int i = 0; i < fft.specSize(); i++)
  {
   // draw the line for frequency band i, scaling it by 4 so we can see it a bit better
   fill(0);
   imageMode(CORNER);
   image(Bone, 20, boneHeight - fft.getBand(i) * 2);
   image(Bone, 779, boneHeight - fft.getBand(i) * 2);
  }
 
  imageMode(CENTER);
  image(Board, 540, 420);
  image(Heart, 540, 420);
  image(Papyrus, 540, 150); 
  
}
