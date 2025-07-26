/*
* R_Patchamama is the mother world
* v 0.0.1
* 2023-2023
*/



// need to be a singleton or static class ?
class R_Pachamama {
  float c = 1; // carbone
  float o = 1; // oxygène
  float h = 1; // hydrogène

  int e = 0; // energie

  R_Pachamama(float c, float h, float o) {
    this.c = c;
    this.o = o;
    this.h = h;
  }

  void sub(float c, float h, float o) {
    this.c -= c;
    this.h -= h;
    this.o -= o;
  }

  void add(float c, float h, float o) {
    this.c += c;
    this.h += h;
    this.o += o;
  }

  void cyclo() {

  }

  @Override public String toString() {
    return "[ c:" + c + " h:" + h + " o:" + o +" ]";
  }
}