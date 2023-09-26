import 'package:flutter/material.dart';

class CarroDetalhe extends StatefulWidget {
  final String name;
  final String imagePath;
  final String text;

  CarroDetalhe({
    required this.name,
    required this.imagePath,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  State<CarroDetalhe> createState() => _CarroDetalheState();
}

class _CarroDetalheState extends State<CarroDetalhe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 65),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Center(
            child: Image.asset(
              widget.imagePath,
              height: 280,
              width: 280,
            ),
          ),
        ],
      ),
    );
  }
}
