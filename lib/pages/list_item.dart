import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String name;
  final String imagePath;
  final String text;

  ListItem({required this.text, required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 65),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width: 140,
            height: 140,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 8), 
                  child: Text(
                    name, 
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8), 
                  child: Text(
                    text
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 10, top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cadastro');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        primary: Color(0xFF002660),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        child: Icon(Icons.arrow_forward),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
