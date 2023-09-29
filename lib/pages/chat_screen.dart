import 'package:flutter/material.dart';
import 'package:ford_app/pages/repository/chamado.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

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
              padding: const EdgeInsets.only(top: 50),
              child: const Row(
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
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _tituloController,
                        decoration: const InputDecoration(labelText: 'Título'),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Por favor, insira um título';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _descricaoController,
                        decoration:
                            const InputDecoration(labelText: 'Descrição'),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return 'Por favor, insira uma descrição';
                          }
                          return null;
                        },
                        maxLines: 3, // Permite várias linhas para a descrição
                      ),
                      const SizedBox(height: 60.0),
                      SizedBox(
                        width: 10,
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: ElevatedButton(
                            onPressed: () {
                              _enviarChamado();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF002660),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
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
