class Usuario{
  final int idU;
  final String nameU;
  final String contraU;

  Usuario(this.idU, {required this.nameU, required this.contraU});

  Map<String, dynamic> toMap(){
    return {'idU': idU, 'nameU': nameU, 'contraU': contraU};
  }
}