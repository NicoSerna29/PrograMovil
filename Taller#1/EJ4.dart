List<String> ordenarPalabras(List<String> palabras) { 
  for (int i = 0; i < palabras.length - 1; i++) {
    for (int j = 0; j < palabras.length - i - 1; j++) {
      if (palabras[j].compareTo(palabras[j + 1]) > 0) {
        String temp = palabras[j];
        palabras[j] = palabras[j + 1];
        palabras[j + 1] = temp;
      }
    }
  }

  return palabras;
}
void main() {
  List<String> palabras = ['manzana', '021laptop', 'zapato', '&2top'];
  print('Palabras originales: $palabras');
  List<String> palabrasOrdenadas = ordenarPalabras(palabras);
  print('Palabras ordenadas: $palabrasOrdenadas');
}