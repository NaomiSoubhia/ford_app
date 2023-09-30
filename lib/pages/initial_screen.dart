import 'package:flutter/material.dart';
import 'package:ford_app/pages/list_item.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

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
                  margin: const EdgeInsets.only(left: 20, top: 10),
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'web/images/ford.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon:
                        const Icon(Icons.exit_to_app, color: Color(0xFF002660)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      border:
                          Border.all(color: const Color(0xFF002660), width: 5),
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
              child: const Text.rich(
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
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ListItem(
                  id: "1",
                  text: 'Veja detalhes sobre o Ford 1933.',
                  imagePath: 'web/images/carro1.png',
                  name: 'Ford 1933',
                ),
                ListItem(
                  id: "2",
                  text: 'Veja detalhes sobre o Ford 2042.',
                  imagePath: 'web/images/carro2.png',
                  name: 'Ford 2042',
                ),
                ListItem(
                  id: "3",
                  text: 'Veja detalhes sobre o Ford F-4000.',
                  imagePath: 'web/images/carro3.png',
                  name: 'Ford F-4000',
                ),
                ListItem(
                  id: "4",
                  text: 'Veja detalhes sobre o Ford F-100.',
                  imagePath: 'web/images/carro4.png',
                  name: 'Ford F-100',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
