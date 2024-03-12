class Producto {
  late String nombre;
  late double precio;
  int cantInv = 0;

  Producto(String nombre, double precio){
    this.nombre=nombre;
    this.precio=precio;
  }
  set comprar(int cantidad) {
    this.cantInv += cantidad;
  }
  set vender(int cantidad) {
    if(cantInv>=cantidad){
      this.cantInv -= cantidad;
    }
  }
  String get nombreProducto {
    return nombre;
  }
  double get precioProducto {
    return precio;
  }
  int get cantidadProducto {
    return cantInv;
  }
}
void main(){
  Producto Pan = Producto("Pan", 2000.0);
  Pan.comprar = 5;
  Pan.comprar = 8;
  print("Nombre: ${Pan.nombreProducto}");
  print("Precio: ${Pan.precioProducto}");
  print("Cantidad en inventario: ${Pan.cantidadProducto}");
  Pan.vender = 10;
  print("Nombre: ${Pan.nombreProducto}");
  print("Precio: ${Pan.precioProducto}");
  print("Cantidad en inventario: ${Pan.cantidadProducto}");
  Pan.vender = 5;
  print("Nombre: ${Pan.nombreProducto}");
  print("Precio: ${Pan.precioProducto}");
  print("Cantidad en inventario: ${Pan.cantidadProducto}");
}