import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarroDetalhe extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final String text;

  const CarroDetalhe({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<CarroDetalhe> createState() => _CarroDetalheState();
}

Future<Map<String, dynamic>> fetchData(String id) async {
  final url = Uri.parse('https://pass-plus.azurewebsites.net/veiculos');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData.firstWhere(
        (element) => element['id'].toString() == id,
        orElse: () => {},
      );
    } else {
      throw Exception('Falha na solicitação');
    }
  } catch (e) {
    print('Erro: $e');
    return {};
  }
}

class _CarroDetalheState extends State<CarroDetalhe> {
  Map<String, dynamic> data = {};

  void updateItemList() {
    if (data.isNotEmpty) {
      itemList[0]['title'] = data['velocidadeKMH']?.toString() ?? '';
      itemList[1]['title'] = data['nivelGasolina']?.toString() ?? '';
      itemList[2]['title'] = data['distanciaKM']?.toString() ?? '';
      itemList[3]['title'] = data['pressaoPneusPSI']?.toString() ?? '';
      itemList[4]['title'] = data['nomeMotorista'] ?? '';

      itemList[1]['title'] = itemList[1]['title'] + ' L';
      itemList[2]['title'] = itemList[2]['title'] + ' km';
      itemList[3]['title'] = itemList[3]['title'] + ' psi';
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData(widget.id).then((fetchedData) {
      setState(() {
        data = fetchedData;
        updateItemList();
      });
    });
  }

  List<Map<String, dynamic>> itemList = [
    {
      'icon': Icons.speed,
      'title': '...',
      'description': 'KM/H  ',
    },
    {
      'icon': Icons.local_gas_station_rounded,
      'title': '...',
      'description': 'Gasolina',
    },
    {
      'icon': Icons.map_sharp,
      'title': '...',
      'description': 'Distância para o destino',
    },
    {
      'icon': Icons.tire_repair_outlined,
      'title': '...',
      'description': 'Pressão dos Pneus',
    },
    {
      'icon': Icons.person,
      'title': '...',
      'description': 'Motorista',
    },
  ];

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
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.65),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 240,
                        height: 240,
                        child: Image.asset(
                          widget.imagePath,
                          filterQuality: FilterQuality.high,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        backgroundColor: const Color(0xFF002660),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                  ],
                )),
            Text(
              widget.name,
              style: const TextStyle(
                color: Color(0xFF002660),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 45),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 40),
                  child: const Text(
                    "Informações",
                    style: TextStyle(
                      color: Color(0xFF002660),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  height: 2,
                  color: const Color(0xFF002660),
                  width: 135,
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 18, left: 40),
                    scrollDirection: Axis.horizontal,
                    itemCount: itemList.length, // Usar o tamanho do itemList
                    itemBuilder: (context, index) {
                      final item =
                          itemList[index]; // Obter o item correspondente

                      return Container(
                        width: 180,
                        height: 175,
                        margin: const EdgeInsets.only(
                            left: 5, right: 15, top: 5, bottom: 5),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          color: Color(0xFF002660),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 0),
                              child: Icon(
                                item['icon'],
                                color: Colors.white,
                                size: 80,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              child: Text(
                                item['title'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                ),
                              ),
                            ),
                            Text(
                              item['description'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  margin: const EdgeInsetsDirectional.only(start: 40),
                  child: const Text(
                    "Rotas",
                    style: TextStyle(
                      color: Color(0xFF002660),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 40),
                  height: 2,
                  color: const Color(0xFF002660),
                  width: 135,
                ),
                InteractiveViewer(
                  child: Container(
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/navegador');
                      },
                      child: Image.asset(
                        'web/images/rotas.png',
                        width: 700,
                        height: 300,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
