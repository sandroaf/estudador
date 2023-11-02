import 'package:estudador/models/planoestudo.dart';
import 'package:estudador/models/nivel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlanoEstudoPage extends StatefulWidget {
  @override
  State<PlanoEstudoPage> createState() => _PlanoEstudoPageState();
}

class _PlanoEstudoPageState extends State<PlanoEstudoPage> {
  //const PlanoEstudoPage({super.key});
  PlanoEstudoModel _planoEstudo = PlanoEstudoModel();

  var descricaoCtrl = TextEditingController();
  var qtdHorasCtrl = TextEditingController();
  var currentIndex;

  _save() {}

  _addAoPlano() {
    if (_validarNivel()) {
      return;
    }
    setState(() {
      _planoEstudo.niveis.add(
        NivelModel(
            descricao: descricaoCtrl.text,
            qtdhoras: int.parse(qtdHorasCtrl.text)),
      );
      descricaoCtrl.clear();
      qtdHorasCtrl.clear();
    });
    print(_planoEstudo);
  }

  _AlterarDoPlano() {
    if (_validarNivel()) {
      return;
    }
    setState(() {
      var nivel = _planoEstudo.niveis[currentIndex];
      nivel.descricao = descricaoCtrl.text;
      nivel.qtdhoras = int.parse(qtdHorasCtrl.text);
      descricaoCtrl.clear();
      qtdHorasCtrl.clear();
      currentIndex = null;
    });
    print(_planoEstudo);
  }

  bool _validarNivel() {
    return descricaoCtrl.text == null ||
        descricaoCtrl.text.trim().isEmpty ||
        qtdHorasCtrl.text == null ||
        qtdHorasCtrl.text.trim().isEmpty;
  }

  _editarDoPlano(NivelModel n) {
    currentIndex = _planoEstudo.niveis.indexOf(n);
    setState(() {
      descricaoCtrl.text = n.descricao;
      qtdHorasCtrl.text = '${n.qtdhoras}';
    });
  }

  _removeDoPlano(index) {
    setState(() {
      _planoEstudo.niveis.removeAt(index);
    });
    print(_planoEstudo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plano de Estudo'),
      ),
      body: ListView(
          padding: EdgeInsets.only(top: 48, left: 32, right: 32),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 8),
              child: TextFormField(
                keyboardType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: "Titulo",
                ),
                style: TextStyle(fontSize: 20),
                onChanged: (value) {
                  setState(() {
                    _planoEstudo.titulo = value;
                  });
                },
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 8, top: 8),
                child: Text(
                  "Níveis",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )),
            Container(
                padding: EdgeInsets.only(bottom: 8),
                child: TextFormField(
                  controller: descricaoCtrl,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    labelText: "Descrição do nível",
                  ),
                  style: TextStyle(fontSize: 20),
                )),
            Container(
                padding: EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: qtdHorasCtrl,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            labelText: "Quantidade de horas",
                          ),
                          style: TextStyle(fontSize: 20),
                        )),
                    Visibility(
                        visible: currentIndex == null,
                        child: Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: _addAoPlano,
                            ))),
                    Visibility(
                        visible: currentIndex != null,
                        child: Expanded(
                            flex: 1,
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: _AlterarDoPlano,
                            ))),
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Column(
                  children: _planoEstudo.niveis.map((n) {
                    return GestureDetector(
                        onTap: () => _editarDoPlano(n),
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    n.descricao,
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '${n.qtdhoras} horas',
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () => _removeDoPlano(
                                        _planoEstudo.niveis.indexOf(n)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  }).toList(),
                )),
          ])
        Visibility(
          visible: _planoEstudo.titulo != null &&
            _planoEstudo.titulo.trim().isNotEmpty &&
            _planoEstudo.niveis.isNotEmpty, 
          child: FloatingActionButton(
            onPressed: () => _save(),
            child: Icon(Icons.check),
          ),
      );
  }
}
