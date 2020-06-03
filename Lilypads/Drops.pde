class Drops {
  PVector pos;
  float size;
  float maxSize;
  float speed;

  Drops() {
    this.pos = new PVector(random(0, width), random(0, height));
    size = 1;
    maxSize = random(7, 15);
    speed = random(1.05, 1.00);
  }

  void drawDrops() {
    strokeWeight(1);
    stroke(#FFFFFF);
    noFill();
    ellipse(pos.x, pos.y, size, size);
    if (size < maxSize) {
      size *= speed;
    }
  }
}
