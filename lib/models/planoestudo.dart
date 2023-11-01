import 'model.dart';
import 'package:estudador/models/nivel.dart';

class PlanoEstudoModel extends Model<PlanoEstudoModel> {
  String titulo = "";
  int tempoestudado = 0; //em segundos
  List<NivelModel> niveis = [];
  late NivelModel nivelatual;

  @override
  PlanoEstudoModel fromJson(Map<String, dynamic> json) {
    this.titulo = json['titulo'];
    this.tempoestudado = json['tempoestudado'];
    this.niveis = json['niveis'];
    this.nivelatual = json['nivelatual'];
    throw '';
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['titulo'] = this.titulo;
    json['tempoestudado'] = this.tempoestudado;
    json['niveis'] = this.niveis;
    json['nivelatual'] = this.nivelatual;
    return json;
  }
}
