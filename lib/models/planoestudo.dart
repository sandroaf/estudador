import 'model.dart';
import 'package:estudador/models/nivel.dart';

class PlanoEstudoModel extends Model<PlanoEstudoModel> {
  String titulo = "";
  int tempoestudado = 0; //em segundos
  List<NivelModel> niveis = [];
  NivelModel nivelatual = null as NivelModel;

  @override
  PlanoEstudoModel fromJson(Map<String, dynamic> json) {
    this.titulo = json['titulo'];
    this.tempoestudado = json['tempoestudado'];
    if (json['niveis'] != null) {
      List niveis = (json['niveis'] as List).map((m) {
        NivelModel nivel = NivelModel();
        nivel.fromJson(m);
        return nivel;
      }).toList();
      this.niveis = niveis as List<NivelModel>;
    }
    if (json['nivelatual'] != null) {
      NivelModel nivel = NivelModel();
      nivel.fromJson(json['nivelatual']);
      nivelatual = nivel;
    }
    throw '';
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['titulo'] = this.titulo;
    json['tempoestudado'] = this.tempoestudado;
    json['niveis'] = this.niveis.map((n) => n.toJson()).toList();
    if (this.nivelatual != null) {
      json['nivelatual'] = this.nivelatual.toJson();
    }
    return json;
  }
}
