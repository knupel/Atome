/**
* This design is based on the Atomic Standard Model
* https://fr.wikipedia.org/wiki/Mod%C3%A8le_standard_de_la_physique_des_particules
* https://fr.wikipedia.org/wiki/Configuration_%C3%A9lectronique
* https://en.wikipedia.org/wiki/Periodic_table
* v 0.0.2
* 2023-2023
*/
import java.util.HashMap;

public class R_Atome implements R_Elements {

  private ArrayList<R_Electron> electrons;
  private ArrayList<R_Neutron> neutrons;
  private ArrayList<R_Proton> protons;
  
  private int id;
  // atomic information
  private int z;
  private String symbol;
  private String name;
  private float mass;
  private HashMap<String, Float> change; // in Kelvin
  private HashMap<String, Float> density;
  private HashMap<String, Float> heat; // in KiloJoule
  private HashMap<String, Integer> radius;
  private HashMap<String, Integer> state; // state oxydation
  private HashMap<String, Integer> shell; // energy level by shell
  private HashMap<String, Float> ionization; // first level of ionization
  private String config; // https://fr.wikipedia.org/wiki/Configuration_%C3%A9lectronique
  private HashMap<String, Float> pauling; // pauling electrogravity
  private int group;
  private String family;
  private int period;
  private char block;
  private String phase;

 // https://en.wikipedia.org/wiki/Periodic_table

 // https://fr.wikipedia.org/wiki/Tableau_p%C3%A9riodique_des_%C3%A9l%C3%A9ments#/media/Fichier:Tableau_p%C3%A9riodique_des_%C3%A9l%C3%A9ments.svg

// liason de covalence :
// https://fr.wikipedia.org/wiki/Rayon_de_covalence

// Electronégativité / pauling ou attirance des électrons entre les atomes
// https://fr.wikipedia.org/wiki/%C3%89lectron%C3%A9gativit%C3%A9
  public R_Atome(int z) {
    this.z = z;
    JSONArray lexical = loadJSONArray("./../media/atom.json");
    this.load_data(lexical);
  }



  // GET DATA ATOM
  /////////////////
  public HashMap get_radius() {
    return this.radius;
  }

  public String get_name() {
    return this.name;
  }

  public String get_symbol() {
    return this.symbol;
  }

  public float get_mass() {
    return this.mass;
  }

  // SHELL
  // https://fr.wikipedia.org/wiki/Couche_%C3%A9lectronique
  ///////////////////////

  public HashMap get_shell() {
    return this.shell;
  }

  public int [] get_shell_free() {
    int num = get_shell().size();
    int [] free = new int[num];
    // 2n2 is formula by shell
    int index = 0;
    for(Object value  : get_shell().values()) {
    // for(int index = 0 ; i < num ; i++) {
      int n = index + 1;
      int max = 2 * n * n;
      // int value = get_shell().get(i);
      free[index] = max - (int)value;
      index++;
    }
    return free;
  }


  public HashMap get_ionization() {
    return this.ionization;
  }

  // SET DATA ATOM
  //////////////////
  public void id(int id) {
    this.id = id;
  }



  public void load_data(JSONArray lexical) {
    JSONObject item = lexical.getJSONArray(this.z).getJSONObject(0);
    this.symbol = item.getString("symbol");
    this.name = item.getString("name");
    this.mass = item.getFloat("mass");

    println("load_date()", 0);
    JSONObject list = item.getJSONObject("change");
    change = new HashMap<>();
    set_data_float(list, change);

    println("load_date()", 1);
    list = item.getJSONObject("density");
    density = new HashMap<>();
    set_data_float(list, density);

    println("load_date()", 2);
    list = item.getJSONObject("heat");
    heat = new HashMap<>();
    set_data_float(list, heat);

    list = item.getJSONObject("radius");
    radius = new HashMap<>();
    set_data_int(list, radius);

    list = item.getJSONObject("state");
    state = new HashMap<>();
    set_data_int(list, state);

    list = item.getJSONObject("shell");
    shell = new HashMap<>();
    set_data_int(list, shell);

    println("load_date()", 3);
    list = item.getJSONObject("ionization");
    ionization = new HashMap<>();
    set_data_float(list, ionization);

    this.config = item.getString("config");
    
    println("load_date()", 4);
    list = item.getJSONObject("pauling");
    pauling = new HashMap<>();
    set_data_float(list, pauling);

    this.group = item.getInt("group");
    this.family = item.getString("family");
    this.period = item.getInt("period");
    this.block = item.getString("block").charAt(0);
    this.phase = item.getString("phase");
  }

  private void set_data_float(JSONObject list, HashMap hm) {
    Object [] objets = list.keys().toArray();
    for(int i = 0 ; i < list.size() ; i++) {
      String key = (String)objets[i];
      double buf = (double)list.get(key);
      hm.put(key, (float)buf);
    }
  }

  private void set_data_int(JSONObject list, HashMap hm) {
    Object [] objets = list.keys().toArray();
    for(int i = 0 ; i < list.size() ; i++) {
      String key = (String)objets[i];
      hm.put(key, (int)list.get(key));
    }
  }
}





