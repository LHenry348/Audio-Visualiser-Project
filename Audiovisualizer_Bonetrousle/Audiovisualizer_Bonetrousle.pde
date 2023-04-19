import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int canvasWidth = 1080;
int canvasHeight = 1080;

String audioFileName = "Undertale - Bonetrousle.mp3";

float fps = 30;
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

void settings() 
{
  size(canvasWidth, canvasHeight);
  smooth(8);
}

void setup()
{
  
}
