import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 55,
            child: Image.network('web/images/ford.png'),
          ),
          SizedBox(height: 70),
          Expanded(
            child: Image.network(
              'web/images/car.jpg',
            ),
          ),
          SizedBox(height: 10),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cadastro');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  primary: Color(0xFF002660),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10.0),
                  child: Text('Cadastrar'),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                        color: Color(0xFF002660)), // Borda na cor #002660
                  ),
                  primary: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 10.0),
                  child: Text('Acessar',
                      style: TextStyle(color: Color(0xFF002660))),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }
}
