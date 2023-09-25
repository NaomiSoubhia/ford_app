import 'package:flutter/material.dart';
import 'package:ford_app/pages/chat_privado.dart';
import 'package:ford_app/pages/repository/chamado.dart';

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
                    icon: Padding(
                      padding: EdgeInsets.only(top: 10), // Margem superior para o ícone
                      child: Icon(Icons.exit_to_app, color: Color(0xFF002660)),
                    ),
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
                    width: 120.0,
                    margin: EdgeInsets.only(right: 10.0),
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
                    width: 120.0,
                    margin: EdgeInsets.only(left: 10.0),
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
                : Container(
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: chamado.length,
                          
                          shrinkWrap: true, // Para evitar erros de layout
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Colors.grey[200],
                              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20, top: 25),
                                  child: ListTile(
                                    title:  Text(chamado[index].titulo, style: TextStyle(fontWeight: FontWeight.bold,),),
                                    
                                    subtitle:  Padding(
                                        padding: const EdgeInsets.only(bottom:30.0,top: 10),
                                        child: Text(chamado[index].detalhes),
                                                        
                                      ),
                                    
                                    trailing: Padding(
                                      padding: EdgeInsets.only(right: 20), // Margem superior para o ícone
                                      child: ElevatedButton(
                                        
                                        onPressed: () {
                                             Navigator.push( 
                                              context,
                                              MaterialPageRoute(builder: (context) => ChatPrivado(chamado[index].titulo)),
  );
  
                                        },
                                        style: ElevatedButton.styleFrom(
                                         
                                          primary: Color(0xFF002660),
                                          
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ),
                                        ),
                                        child: Icon(Icons.arrow_forward, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
