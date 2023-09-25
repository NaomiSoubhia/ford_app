import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreen createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

void _enviarChamado() {
  if (_formKey.currentState != null && _formKey.currentState!.validate()) {
    // Validação passou, você pode enviar o chamado aqui
    String titulo = _tituloController.text;
    String descricao = _descricaoController.text;

    // Faça algo com os dados (por exemplo, envie para o servidor)
    print('Título: $titulo');
    print('Descrição: $descricao');

    // Após enviar, você pode redirecionar ou executar outra ação
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Chamado'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value.isEmpty) {
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
                  if (value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
                maxLines: 3, // Permite várias linhas para a descrição
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _enviarChamado,
                child: Text('Enviar Chamado'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Campos válidos!')),
                    );
                  }
                },
                child: Text('Validar Campos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
