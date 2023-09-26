import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ford_app/pages/cadastro.dart';
import 'package:ford_app/pages/login.dart';
import 'package:ford_app/pages/menu.dart';
import 'pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/home': (context) => const HomeScreen(),
        '/cadastro': (context) => const CadastroPage(),
        '/login': (context) => const LoginPage(),
        '/navegador': (context) => NavegadorPage(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(context, '/home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF002660),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  'web/images/logo.png',
                  width: 200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
