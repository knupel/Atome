public class R_Molecule {
  private ArrayList<R_Atome> atomes = new ArrayList<R_Atome>();

  public R_Molecule(R_Atome ...atomes) {
    for(int i = 0; i < atomes.length ; i++) {
      this.atomes.add(atomes[i]);
    }
  }
}