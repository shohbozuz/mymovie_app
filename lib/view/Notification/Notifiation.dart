import 'package:flutter/material.dart';

class Bilirishnomalar extends StatefulWidget {
  const Bilirishnomalar({super.key});

  @override
  State<Bilirishnomalar> createState() => _BilirishnomalarState();
}

class _BilirishnomalarState extends State<Bilirishnomalar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bildirishnomalar"),
      ),
      body: Center(
        child: Text("Hozircha bildirishnomalar yo'q"),
      ),
    );
  }
}
