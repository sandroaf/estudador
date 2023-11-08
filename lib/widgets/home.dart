import 'package:estudador/models/planoestudo.dart';
import 'package:estudador/widgets/planoestudo.dart';
import 'package:flutter/material.dart';
import 'package:estudador/services/planoestudo.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlanoEstudoService _planoEstudoService = PlanoEstudoService();
  List<PlanoEstudoModel> _planos = [];

  List<Widget> _buildPlanosEstudos() {
    return _planos.map((p) {
      return GestureDetector(
        onTap: () {
          //TODO: Cronometro
        },
        child: Card(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(p.titulo,
                          style: TextStyle(
                            fontSize: 18,
                          ))),
                  Expanded(
                      flex: 2,
                      child: Text('${_printDuration(p.tempoestudado)} estudao',
                          style: TextStyle(
                            fontSize: 18,
                          ))),
                  Expanded(
                      child: Text(p.nivelatual.descricao,
                          style: TextStyle(
                            fontSize: 18,
                          ))),
                ],
              )),
        ),
      );
    }).toList();
  }

  String _printDuration([seconds = 0]) {
    var duration = Duration(microseconds: seconds * 1000);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void initState() {
    super.initState();
    _planoEstudoService.list().then((planos) {
      print(planos);
      if (planos != null) {
        setState(() {
          this._planos = planos;
        });
      }
    });
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print

    /*
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    */

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _buildPlanosEstudos(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlanoEstudoPage(),
              ));
        },
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
