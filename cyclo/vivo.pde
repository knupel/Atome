/*
* R_Vivo is the mother world
* v 0.0.1
* 2023-2023
*/
class R_Vivo {
  R_Pachamama p;
  float c = 1;
  float h = 1;
  float o = 1;

  int e = 0; // energie

  int cyclo = 0;
  int max_cyclo = 80;


  R_Vivo(R_Pachamama p, float c, float h, float o) {
    this.p = p;
    this.c = c;
    this.h = h;
    this.o = o;
    this.p.sub(c,h,o);
  }

  void in(float c, float h, float o) {
    this.p.sub(c,h,o);
    this.add(c,h,o);
  }

  void out(float c, float h, float o) {
    this.p.add(c,h,o);
    this.sub(c,h,o);
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
    cyclo++;
  }

  @Override public String toString() {
    return "[ c:" + c + " h:" + h + " o:" + o + " ]";
  }
}