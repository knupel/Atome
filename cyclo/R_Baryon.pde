public class R_Baryon {
  protected ArrayList<R_Quark> quarks = new ArrayList<R_Quark>();
  float spin = 0;
  int charge = 0;
  int strange = 0;
  int charm = 0;
  float life = 0;
  float mass = 0;
  public R_Baryon() {
  }
}

public class R_Nucleon extends R_Baryon {
  public R_Nucleon() {
  }
}

public class R_Neutron extends R_Nucleon {
  
  public R_Neutron() {
    R_Quark_U u_0 = new R_Quark_U();
    R_Quark_D d_0 = new R_Quark_D();
    R_Quark_D d_1 = new R_Quark_D();
    quarks.add(u_0);
    quarks.add(d_0);
    quarks.add(d_1);
  }
}

public class R_Proton extends R_Nucleon {
  private ArrayList<R_Quark> quarks = new ArrayList<R_Quark>();
  public R_Proton() {
    R_Quark_U u_0 = new R_Quark_U();
    R_Quark_U u_1 = new R_Quark_U();
    R_Quark_D d_0 = new R_Quark_D();
    quarks.add(u_0);
    quarks.add(u_1);
    quarks.add(d_0);
  }
}