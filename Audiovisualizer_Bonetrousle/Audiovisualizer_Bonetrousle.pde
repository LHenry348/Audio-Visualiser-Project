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
  
  track.play();
  track.loop();
  
  fft = new FFT(track.bufferSize(), track.sampleRate());
  
  Bone = loadImage("BoneAttack.png");
  BoneBG = loadImage("BoneBG.png");
  Papyrus = loadImage("Papyrus.png");
  Heart = loadImage("Heart.png");
  Board = loadImage("BulletBoard.png");
  
  boneHeight = height + 100;

} 

void keyPressed()
{
  if (key == ' ')
  {
    if (track.isPlaying())
    {
      track.pause();
    }
    else
    {
      track.play();
    }
  }
}

void draw()
{
  background(BoneBG);
  
  fill(0);
  imageMode(CORNER);
  
  pushMatrix();
  translate(0, - fft.getBand(70) - 100);
  image(Bone, 65, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(30) - 100);
  image(Bone, 80, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(20) - 100);
  image(Bone, 95, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(13) - 100);
  image(Bone, 110, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(9) - 100);
  image(Bone, 125, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(11) - 100);
  image(Bone, 140, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(10) - 100);
  image(Bone, 155, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(14) - 100);
  image(Bone, 170, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(12) - 100);
  image(Bone, 185, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(16) - 100);
  image(Bone, 200, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(8) - 100);
  image(Bone, 215, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(6) - 100);
  image(Bone, 230, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(17) - 100);
  image(Bone, 245, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(5) - 100);
  image(Bone, 260, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(90) - 100);
  image(Bone, 275, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(10) - 100);
  image(Bone, 290, height - 80);
  popMatrix();
  
  ///////////////////////////////////
  
  pushMatrix();
  translate(0, - fft.getBand(20) - 100);
  image(Bone, 780, height - 80);  
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(7) - 100);
  image(Bone, 795, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(5) - 100);
  image(Bone, 810, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(8) - 100);
  image(Bone, 825, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(9) - 100);
  image(Bone, 840, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(7) - 100);
  image(Bone, 855, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(9) - 100);
  image(Bone, 870, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(8) - 100);
  image(Bone, 885, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(9) - 100);
  image(Bone, 900, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(10) - 100);
  image(Bone, 915, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(12) - 100);
  image(Bone, 930, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(12) - 100);
  image(Bone, 945, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(20) - 100);
  image(Bone, 960, height - 80);
  popMatrix();
  
  pushMatrix();
  translate(0, - fft.getBand(7) - 100);
  image(Bone, 975, height - 80);
  popMatrix();
  
  
  fft.forward(track.mix);
  
  
  fft.forward(track.left);
 
  imageMode(CENTER);
  image(Board, 540, 420);
  image(Heart, 540, 420);
  image(Papyrus, 540, 150); 
}
