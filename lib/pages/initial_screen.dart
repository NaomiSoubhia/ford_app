import 'package:flutter/material.dart';
import 'package:ford_app/pages/list_item.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Envolve o Column com um SingleChildScrollView
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'web/images/ford.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10), // Margem de 10 à direita
                  child: IconButton(
                    icon: Icon(Icons.exit_to_app, color: Color(0xFF002660)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(color: Color(0xFF002660), width: 5),
                    ),
                  ),
                  ClipOval(
                    child: Image.asset(
                      'web/images/perfil.jpg',
                      width: 130,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  text: 'Seja bem vindo, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: 'Mário',
                      style: TextStyle(
                        color: Color(0xFF002660),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView(
              shrinkWrap: true, // Permitir que a ListView tenha altura dinâmica
              physics: NeverScrollableScrollPhysics(), // Impede que a ListView role
              children: [
                ListItem(
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                  imagePath: 'web/images/carro1.png',
                  name: 'teste1',
                ),
                ListItem(
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                  imagePath: 'web/images/carro2.png',
                  name: 'teste2',
                ),
                ListItem(
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                  imagePath: 'web/images/carro3.png',
                  name: 'teste3',
                ),
                ListItem(
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                  imagePath: 'web/images/carro4.png',
                  name: 'teste3',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
