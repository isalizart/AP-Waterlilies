class Particle {
  PVector pos1;
  PVector pos2;

  PVector vel1;

  Particle(PVector vel, float x, float y) {
    pos1 = new PVector(x, y);
    pos2 = pos1.copy();

    vel1 = vel.copy();
  }

  void updateParticle() {
    pos1.add(vel1);
    pos2.sub(vel1);

    vel1.mult(0.97);
  }
}
