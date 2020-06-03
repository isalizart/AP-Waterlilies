class Lilypad {
  float x;
  float y;
  float finalsize;
  float size;
  float growthspeed;
  float rotate;
  float start;
  float stop;

  Lilypad(float genx, float geny) {
    this.x = genx; 
    this.y = geny;
    this.finalsize = random(40, 100);
    this.size = 0;
    this.growthspeed = random(0.1, 0.2);
    this.rotate = random(0, 0.35);
    this.start = random(0, 360);
    this.stop = start + random(330, 350);
  }

  void drawLilypad() {
    fill(#73D16B);
    noStroke();
    arc(x, y, size, size, radians(start), radians(stop), PIE);
    this.start += rotate;
    this.stop += rotate;
    if (size < finalsize) {
      growLilypad();
    }
  }


  void growLilypad() {
    this.size += 2* growthspeed;
    this.growthspeed *= 0.9999;
  }
}
