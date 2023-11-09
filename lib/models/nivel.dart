import 'model.dart';

class NivelModel extends Model<NivelModel> {
  String descricao = "";
  int qtdhoras = 0;

  @override
  NivelModel fromJson(Map<String, dynamic> json) {
    descricao = json['descricao'];
    qtdhoras = json['qtdhoras'];
    throw '';
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['descricao'] = descricao;
    json['qtdhoras'] = qtdhoras;
    return json;
  }

  NivelModel({this.descricao = "", this.qtdhoras = 0});
}
