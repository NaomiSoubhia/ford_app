import 'package:flutter/material.dart';
import 'package:ford_app/pages/initial_screen.dart';
import 'package:ford_app/pages/bell_screen.dart';
import 'package:ford_app/pages/location_screen.dart';
import 'chat_screen.dart'; // Importe a ChatScreen

class MyNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavegadorPage(),
    );
  }
}

class NavegadorPage extends StatefulWidget {
  @override
  _NavegadorPageState createState() => _NavegadorPageState();
}

class _NavegadorPageState extends State<NavegadorPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [
    InitialScreen(),
    BellScreen(),
    ChatScreen(),
    LocationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Location',
          ),
        ],
        selectedItemColor: Color(0xFF002660), // Cor do ícone selecionado
        unselectedItemColor: Colors.grey, // Cor dos ícones não selecionados
        showSelectedLabels: false, // Ocultar rótulos dos ícones selecionados
        showUnselectedLabels: false, // Ocultar rótulos dos ícones não selecionados
        selectedIconTheme: IconThemeData(size: 30), // Tamanho dos ícones selecionados
        unselectedIconTheme: IconThemeData(size: 24), // Tamanho dos ícones não selecionados
      ),
    );
  }
}
