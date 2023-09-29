import 'package:flutter/material.dart';
import 'package:ford_app/pages/list_item.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( 
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
            ]
        )   
    ),
    );
  }
}
