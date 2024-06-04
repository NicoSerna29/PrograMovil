class Pokemon{
  final int idP;
  final String name;
  final String sprite;

  Pokemon(
    {
    required this.idP,
    required this.name,
    required this.sprite}
  );

  Map<String, dynamic> toMap(){
    return {'idP': idP, 'name': name, 'sprite': sprite};
  }

}