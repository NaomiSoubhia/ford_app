class BellAlerta {
  final String titulo;
  final String detalhes;
  final String imagem;

  BellAlerta({required this.titulo, required this.detalhes, required this.imagem});
}

List<BellAlerta> alerta= [
  BellAlerta(titulo: 'Alerta1', detalhes: 'Alerta do carro 1', imagem:"web/images/carro1.png"),
  BellAlerta(titulo: 'Alerta 2', detalhes: 'Alerta do carro 2',imagem:"web/images/carro2.png"),
  BellAlerta(titulo: 'Alerta 3', detalhes: 'Alerta do carro 1',imagem:"web/images/carro1.png"),
    BellAlerta(titulo: 'Alerta 4', detalhes: 'Alerta do carro 3',imagem:"web/images/carro3.png"),
];
