import 'package:flutter/material.dart';
import 'package:ford_app/pages/chat_privado.dart';
import 'package:ford_app/pages/repository/alerta.dart';
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
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Notificações',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 30), // Espaço entre o texto e o ícone
                  IconButton(
                    icon: const Padding(
                      padding: EdgeInsets.only(
                          top: 10), // Margem superior para o ícone
                      child: Icon(Icons.exit_to_app, color: Color(0xFF002660)),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              alignment: Alignment.center,
              child: ToggleButtons(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                onPressed: (int index) {
                  setState(() {
                    selectedIndex =
                        index; // Define o índice do botão selecionado
                  });
                },
                isSelected: [selectedIndex == 0, selectedIndex == 1],
                children: <Widget>[
                  Container(
                    width: 120.0,
                    margin: const EdgeInsets.only(right: 10.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == 0 ? const Color(0xFF002660) : null,
                      borderRadius: const BorderRadius.only(
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
                    margin: const EdgeInsets.only(left: 10.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      color:
                          selectedIndex == 1 ? const Color(0xFF002660) : null,
                      borderRadius: const BorderRadius.only(
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
                ], // Verifica qual botão está selecionado
              ),
            ),
            const SizedBox(height: 20.0),
            // Exibe o conteúdo com base na opção selecionada
            selectedIndex == 0
                ? SingleChildScrollView(
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
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 60.0),
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 25),
                                  child: ListTile(
                                    leading: Image.asset(alerta[index].imagem),
                                    title: Text(
                                      alerta[index].titulo,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 30.0, top: 10),
                                      child: Text(alerta[index].detalhes),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                : Column(
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
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 60.0),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 25),
                                child: ListTile(
                                  title: Text(
                                    chamado[index].titulo,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 30.0, top: 10),
                                    child: Text(chamado[index].detalhes),
                                  ),
                                  trailing: Padding(
                                    padding: const EdgeInsets.only(
                                        right:
                                            20), // Margem superior para o ícone
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ChatPrivado(
                                                  chamado[index].titulo)),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFF002660),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                      child: const Icon(Icons.arrow_forward,
                                          color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}
