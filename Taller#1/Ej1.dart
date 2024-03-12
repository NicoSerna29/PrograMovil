class Persona {
  late String nombre, genero;
  late int edad;
  
  Persona(String nombre, int edad, String genero){
    this.nombre = nombre;
    this.edad = edad;
    this.genero = genero;
  }
  void presentarse(){
    print("Hola, soy $nombre y tengo $edad años de edad");
    print("Me defino por el genero $genero");
  }
}
void main(){
  Persona Nico = new Persona("Nicolas", 19, "Hetero");
  Nico.presentarse();
}