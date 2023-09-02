import 'package:flutter/material.dart';

class BellScreen extends StatefulWidget {
  @override
  _BellScreenState createState() => _BellScreenState();
}

class _BellScreenState extends State<BellScreen> {
  int selectedIndex = 0; // Controla o índice do botão selecionado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Notificações',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 30), // Espaço entre o texto e o ícone
                  IconButton(
                    icon: Icon(Icons.exit_to_app, color: Color(0xFF002660)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              alignment: Alignment.center,
              child: ToggleButtons(
                borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      color: selectedIndex == 0 ? Color(0xFF002660) : null,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'Alertas',
                      style: TextStyle(
                        color: selectedIndex == 0 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      color: selectedIndex == 1 ? Color(0xFF002660) : null,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    
                    child: Text(
                      'Chamados',
                      style: TextStyle(
                        color: selectedIndex == 1 ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    selectedIndex = index; // Define o índice do botão selecionado
                  });
                },
                isSelected: [selectedIndex == 0, selectedIndex == 1], // Verifica qual botão está selecionado
              ),
            ),
            SizedBox(height: 20.0),
            // Exibe o conteúdo com base na opção selecionada
            selectedIndex == 0
                ? Text('Conteúdo de Alertas')
                : Text('Conteúdo de Chamados'),
          ],
        ),
      ),
    );
  }
}
