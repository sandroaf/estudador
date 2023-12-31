import 'dart:convert';
import 'package:estudador/models/planoestudo.dart';
import 'package:estudador/services/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlanoEstudoService extends Service<PlanoEstudoModel> {
  @override
  Future save(PlanoEstudoModel model) async {
    var prefs = await SharedPreferences.getInstance();

    List<PlanoEstudoModel> planos = await list();
    print(planos);
    if (planos == null) {
      await prefs.setString('planos', json.encode([model.toJson()]));
      return;
    }
    planos.add(model);

    await prefs.setString(
        'planos', json.encode(planos.map((p) => p.toJson()).toList()));
  }

  @override
  Future update(int index, PlanoEstudoModel model) async {
    List<PlanoEstudoModel> planos = await list();
    planos[index] = model;
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'planos', json.encode(planos.map((p) => p.toJson()).toList()));
  }

  @override
  Future<List<PlanoEstudoModel>> list() async {
    var prefs = await SharedPreferences.getInstance();
    //await prefs.clear();
    var data = prefs.getString('planos');
    if (data != null) {
      List<Map> lista = json.decode(data);
      List<PlanoEstudoModel> planos = lista.map((m) {
        PlanoEstudoModel model = PlanoEstudoModel();
        model.fromJson(m.cast<String, dynamic>());
        return model;
      }).toList();
      return planos;
    }
    return [];
  }

  @override
  Future<PlanoEstudoModel> load(int index) async {
    List<PlanoEstudoModel> planos = await list();
    if (index < planos.length) {
      return planos[index];
    }
    return null as PlanoEstudoModel;
  }
}
