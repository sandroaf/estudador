import 'model.dart';

class NivelModel extends Model<NivelModel> {
  String descricao = "";
  int qtdhoras = 0;

  @override
  NivelModel fromJson(Map<String, dynamic> json) {
    this.descricao = json['descricao'];
    this.qtdhoras = json['qrdhoras'];
    throw '';
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['descricao'] = this.descricao;
    json['qtdhoras'] = this.qtdhoras;
    return json;
  }

  NivelModel({required this.descricao, required this.qtdhoras});
}
