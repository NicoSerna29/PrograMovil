class Pokemon{
  final int id;
  final String name;
  final String sprite;

  Pokemon({required this.id, required this.name, required this.sprite});

  Map<String, dynamic> toMap(){
    return {'id': id, 'name': name, 'sprite': sprite};
  }

}