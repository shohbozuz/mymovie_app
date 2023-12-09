import 'package:flutter/material.dart';
import 'package:mymovie/core/constants/color.dart';

class Saqlanganlar extends StatelessWidget {
  const Saqlanganlar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppBar,
        title: Text("Saqlanganlar",style: TextStyle(color: AppColors.Icon_Text)),
      ),
      body: Center(
        child: Text("Siz yoqtirgan hikmatlar sahifasi"),
      ),
    );
  }
}
