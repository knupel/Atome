

void setup() {
  size(500,500);
  // vivo_init()
  atome_init();
  println("setup(): c'est fait");

}

// void draw() {
//   // vivo_in_out();

// }

// ATOM
///////////
R_Atome atome;

class Elem implements R_Elements {}
Elem e = new Elem();

void atome_init() {
  // atome = new R_Atome(e.O);
  int z = 79;
  println(z, e.Au);
  atome = new R_Atome(79);
  println("name:",atome.get_name());
  println("symbol:", atome.get_symbol());
  println("radius values:", atome.get_radius().values());
  println("radius keys:", atome.get_radius().keySet());
  println("radius entries:", atome.get_radius().entrySet());
  println("mass:", atome.get_mass());
  println("shell values:", atome.get_shell().values());
  println("shell free:");
  println(atome.get_shell_free());
  println("ionizations values:", atome.get_ionization().values());

}



// VIVO 
///////////
R_Vivo v;
R_Pachamama p = new R_Pachamama(1000, 1000, 1000);
int max_vivo = 10;

void vivo_init() {
  frameRate(3);
  v = new R_Vivo(p, random(max_vivo), random(max_vivo), random(max_vivo));
}

void vivo_in_out() {
  v.in(random(max_vivo), random(max_vivo), random(max_vivo));
  v.out(random(max_vivo), random(max_vivo), random(max_vivo));

  println("Patchamama",p);
  println("Vivo",v);

  if(p.c <= 0 || p.h <= 0 || p.o <= 0) {
    println("La Pachamama a perdu toute chaleur votre monde est froid. Allez aurevoir");
    exit();
  }
}


