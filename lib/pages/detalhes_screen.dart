import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 10),
              alignment: Alignment.topLeft,
              child: Image.network(
                'web/images/ford.png',
                width: 80,
                height: 80,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(right: 10), // Margem de 10 à direita
              child: IconButton(
                icon: const Icon(Icons.exit_to_app, color: Color(0xFF002660)),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ),
          ],
        ),
      ])),
    );
  }
}
