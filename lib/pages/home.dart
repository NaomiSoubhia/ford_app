import 'package:flutter/src/widgets/framework.dart';
import 'package:ford_app/pages/signup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MenuPage();
  }
}
