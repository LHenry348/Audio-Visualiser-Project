import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

PImage Bone;
PImage BoneBG;
PImage Papyrus;
PImage Soul;

int canvasWidth = 1080;
int canvasHeight = 540;

String audioFileName = "Undertale - Bonetrousle.mp3";

float fps = 60;
float smoothingFactor = 0.25;



AudioPlayer track;
FFT fft;
Minim minim;

int bands = 256; // must be multiple of two
float[] spectrum = new float[bands];
float[] sum = new float[bands];

float unit;
int groundLineY;
PVector center;

float random1 = random(height, height / 2);
float random2 = random(height, height / 3);
float random3 = random(height, height / 3);
float random4 = random(height, height / 2);

void settings() 
{
  size(canvasWidth, canvasHeight);
  smooth(10);
}
  
void setup() {
  frameRate(fps);

  // Graphics related variable setting
  unit = height / 100; // Everything else can be based around unit to make it change depending on size 
  strokeWeight(unit / 10.24);
  groundLineY = height * 3/4;
  center = new PVector(width / 2, height * 3/4);  

  minim = new Minim(this);
  track = minim.loadFile(audioFileName, 2048);
 
  track.loop();
 
  fft = new FFT( track.bufferSize(), track.sampleRate() );
 
  fft.linAverages(bands);
  
  Bone = loadImage("BoneAttacks.png");
  BoneBG = loadImage("BoneBG.png");
  Papyrus = loadImage("Papyrus.png");
  Soul = loadImage("Soul.png");
 
  // track.cue(60000); // Cue in milliseconds
} 

float yy = 150;
void draw()
{
  background(BoneBG);
  imageMode(CORNER);
  image(Bone, 20, random(height / 2, height));
  image(Bone, 273, random(height / 3, height));
  image(Bone, 526,  random(height / 3, height));
  image(Bone, 779, random(height / 2, height));
  imageMode(CENTER);
  image(Papyrus, 540, 270); 
  image(Soul, 230, yy);
  image(Soul, 850, yy);
  
  yy += random(-10, 10);
  yyy = lerp(yyy, yy, 0.1f);
  
}
float yyy = 0;
