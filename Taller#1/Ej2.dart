List<List<int>> ListaParesImpares(List<int> numeros) {
  List<int> pares = [];
  List<int> impares = [];

  for (int n in numeros) {
    if (n % 2 == 0) {
      pares.add(n);
    } else {
      impares.add(n);
    }
  }
  return [pares, impares];
}

void main() {
  List<int> listaNumeros = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<List<int>> resultado = ListaParesImpares(listaNumeros);

  List<int> pares = resultado[0];
  List<int> impares = resultado[1];

  print("Numeros pares: $pares");
  print("Numeros impares: $impares");
}