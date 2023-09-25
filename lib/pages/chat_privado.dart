import 'package:flutter/material.dart';

class Conversa {
  final String nome;
  final List<String> mensagens;

  Conversa(this.nome, this.mensagens);
}

class ChatPrivado extends StatefulWidget {
  final String nome; // Nome do destinatário da conversa

  ChatPrivado(this.nome);

  @override
  _ChatPrivadoState createState() => _ChatPrivadoState();
}

class _ChatPrivadoState extends State<ChatPrivado> {
  // Mapa para armazenar as conversas, onde a chave é o nome do destinatário
  Map<String, Conversa> conversas = {};

  TextEditingController mensagemController = TextEditingController();

  // Função para enviar uma mensagem
  void enviarMensagem() {
    String mensagem = mensagemController.text;
    if (mensagem.isNotEmpty) {
      setState(() {
        if (!conversas.containsKey(widget.nome)) {
          // Se a conversa com o destinatário não existir, crie uma nova
          conversas[widget.nome] = Conversa(widget.nome, []);
        }
        conversas[widget.nome]!.mensagens.add(mensagem);
        mensagemController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Privado com ${widget.nome}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: conversas.containsKey(widget.nome)
                  ? conversas[widget.nome]!.mensagens.length
                  : 0,
              itemBuilder: (context, index) {
                // Verifica se a mensagem é do usuário atual ou do destinatário
                bool isMinhaMensagem = index % 2 == 0;

                return Align(
                 alignment:   Alignment.centerRight,
                      
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8.0,
                    ),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color:  Colors.blue ,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      conversas[widget.nome]!.mensagens[index],
                      style: TextStyle(
                        color:  Colors.white ,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: mensagemController,
                    decoration: InputDecoration(
                      hintText: 'Digite sua mensagem...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: enviarMensagem,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
