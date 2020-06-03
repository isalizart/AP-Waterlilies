class DuckObj {
  PVector duckPos;
  PVector duckDir;


  DuckObj(PVector pos) {
    this.duckPos = pos.copy();
  }

  void duckDraw(PImage duckImg, ParticleSystem system) {
    pushMatrix();

    duckDir = new PVector((mouseX - duckPos.x), (mouseY - duckPos.y));
    duckPos.add(duckDir.mult(0.01));

    translate(duckPos.x, duckPos.y);
    rotate(duckDir.heading());
    image(duckImg, 0, 0, 100, 100);

    popMatrix();

    system.createWave(duckDir, duckPos.x, duckPos.y);
  }
} //<>//
