import processing.sound.*; //<>//

ArrayList<Lilypad> lilyarr = new ArrayList<Lilypad>();
ArrayList<Drops> dropsarr = new ArrayList<Drops>();
ParticleSystem system = new ParticleSystem();
DuckObj duck;

PVector mid = new PVector(500, 500);

float x;
float y;
int eaten = 0;

PImage duckImg;
SoundFile ambient;
SoundFile quack;


void setup() {
  size(1200, 600);
  duckImg = loadImage("duck.png");

  duck = new DuckObj(mid);
  ambient = new SoundFile(this, "ambientriver.mp3");
  quack = new SoundFile(this, "quack.mp3");
  ambient.amp(0.3);
  quack.amp(0.5);
  ambient.loop();
}

void draw() {
  background(#A9DBE8);
  imageMode(CENTER);
  
  fill(#73D16B);
  textSize(30);
  text(eaten, 10, 30);

  //draw waves
  system.drawWave();
     
  //randomly spawn drops every frame
  dropsarr.add(new Drops());
  //draw water droplets
  if (dropsarr.size() > 0) {
    for (int i = 0; i < dropsarr.size(); i++) {
      dropsarr.get(i).drawDrops();
      if (dropsarr.get(i).size >= dropsarr.get(i).maxSize) {
        dropsarr.remove(i);
      }
    }
  }
  
  //draw Lilies
  if (lilyarr.size() > 0) {
    for (int i = 0; i < lilyarr.size(); i++) {
      lilyarr.get(i).drawLilypad();
    }
  }
  
  //check for collision
  eatLily();
  
  //draw duck
  duck.duckDraw(duckImg, system);
} 

void mouseClicked() {
  lilyarr.add(new Lilypad(mouseX, mouseY));
  quack.play();
}

void eatLily() {
  if (lilyarr.size() > 0) {
    for (int i = 0; i < lilyarr.size(); i++) {
      if (abs(duck.duckPos.x - lilyarr.get(i).x) <= lilyarr.get(i).size *0.8 && abs(duck.duckPos.y-10 - lilyarr.get(i).y) <= lilyarr.get(i).size *0.8) {
        lilyarr.remove(i);
        eaten++;
      }
    }
  }
}
