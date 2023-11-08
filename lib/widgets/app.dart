import 'package:estudador/widgets/home.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

//http://mcg.mbitson.com/#!?mcgpalette0=%23337c9b
  static const MaterialColor mcgpalette0 =
      MaterialColor(_mcgpalette0PrimaryValue, <int, Color>{
    50: Color(0xFFE7EFF3),
    100: Color(0xFFC2D8E1),
    200: Color(0xFF99BECD),
    300: Color(0xFF70A3B9),
    400: Color(0xFF5290AA),
    500: Color(_mcgpalette0PrimaryValue),
    600: Color(0xFF2E7493),
    700: Color(0xFF276989),
    800: Color(0xFF205F7F),
    900: Color(0xFF144C6D),
  });
  static const int _mcgpalette0PrimaryValue = 0xFF337C9B;

  static const MaterialColor mcgpalette0Accent =
      MaterialColor(_mcgpalette0AccentValue, <int, Color>{
    100: Color(0xFFA5DBFF),
    200: Color(_mcgpalette0AccentValue),
    400: Color(0xFF3FB1FF),
    700: Color(0xFF25A7FF),
  });
  static const int _mcgpalette0AccentValue = 0xFF72C6FF;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Estudador',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: mcgpalette0,
        //useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(title: 'Estudador'),
    );
  }
}
