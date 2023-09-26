import 'package:flutter/material.dart';
import 'package:ford_app/pages/repository/chamado.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  void _enviarChamado() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // Validação passou, você pode enviar o chamado aqui
      String titulo = _tituloController.text;
      String descricao = _descricaoController.text;

      // Adicione o chamado à lista
      chamado.add(BellChamado(titulo: titulo, detalhes: descricao));

      // Faça algo com os dados (por exemplo, envie para o servidor)
      print('Título: $titulo');
      print('Descrição: $descricao');

      // Após enviar, você pode redirecionar ou executar outra ação
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Novo Chamado',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _tituloController,
                        decoration: InputDecoration(labelText: 'Título'),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Por favor, insira um título';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _descricaoController,
                        decoration: InputDecoration(labelText: 'Descrição'),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Por favor, insira uma descrição';
                          }
                          return null;
                        },
                        maxLines: 3, // Permite várias linhas para a descrição
                      ),
                      SizedBox(height: 60.0),
                      Container(
                        width: 10,
                        height: 40,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 100.0, right: 100.0),
                          child: ElevatedButton(
                            onPressed: () {
                              _enviarChamado();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF002660),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              'Cadastrar',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
