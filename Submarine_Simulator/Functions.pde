float HSP() { //Hydro Static pressure calculator
  float Pabs = (p*g*d)/1000000; //absolute presure of the ocean (units: MPa)
  return Pabs;
}

String[] getMP() { //Get Material Properites
  String[] alllines = loadStrings("Materials.txt");
  String MaterialProperties = alllines[MaterialIndex];
  String[] MaterialPropertiesArray = MaterialProperties.split(" ");
  return MaterialPropertiesArray;
}
