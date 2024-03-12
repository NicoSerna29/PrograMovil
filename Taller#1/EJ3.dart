bool voltear(String palabra){
    String palabraInv = palabra.split('').reversed.join('');
    if (palabra == palabraInv){
      return true;
    } else {
      return false;
    }
}
void main(){
  String PalabraEV = "Alomomola".toLowerCase();
  if (voltear(PalabraEV)){
    print("La palabra $PalabraEV es un palindromo");
  } else {
    print("La palabra $PalabraEV no es un palindromo");
  }
} 