class Pokemon {
  late int id;
  late String nameP;
  late String idP;
  late String spriteP;

  Pokemon({this.id = 0, required this.nameP, required this.idP, required this.spriteP});
  Pokemon.empty();

  Map<String, dynamic> toMap(){
    return {'id':id,'nameP':nameP, 'idP':idP, 'prite':spriteP};
  }
}