class ParticleSystem {
  ArrayList<Particle> WaveSystem;


  ParticleSystem() {
    WaveSystem = new ArrayList<Particle>();
  }

  void createWave(PVector dir, float x, float y) {

    //Richtungsvektoren auf 90° zu Mausrichtung
    PVector dirAngle = new PVector(0, 0);
    dirAngle.set(dir.y, dir.x);

    //Beträge von Richtungsvektoren
    float magn = dirAngle.mag();

    //Normalisieren
    dirAngle.set(dirAngle.mult(1/magn));

    Particle p = new Particle(dirAngle, x, y);
    this.WaveSystem.add(p);

    if (WaveSystem.size() > 50) {
      WaveSystem.remove(WaveSystem.get(0));
    }
  }

  void drawWave() {
    for (int i = 1; i < WaveSystem.size() -1; i++) {
      WaveSystem.get(i).pos1.lerp(WaveSystem.get(i-1).pos1, 0.2);
      WaveSystem.get(i).pos2.lerp(WaveSystem.get(i-1).pos2, 0.2);

      color a = (#FFFFFF);
      color b = (#A9DBE8);

      float mag = WaveSystem.get(i).vel1.mag() ;

      color c = lerpColor(b, a, mag - 0.05);
      float w = abs(lerp(1, 10, mag + 0.05));

      stroke(c);
      strokeWeight(w);

      line(WaveSystem.get(i-1).pos1.x, WaveSystem.get(i-1).pos1.y, WaveSystem.get(i).pos1.x, WaveSystem.get(i).pos1.y);
      line(WaveSystem.get(i-1).pos2.x, WaveSystem.get(i-1).pos2.y, WaveSystem.get(i).pos2.x, WaveSystem.get(i).pos2.y);

      WaveSystem.get(i).updateParticle();
    }
  }
}
