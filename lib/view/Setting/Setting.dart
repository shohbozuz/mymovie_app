import 'package:flutter/material.dart';
import 'package:mymovie/core/constants/color.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppBar,
        title: Text("Sozlanmalar",style: TextStyle(color: AppColors.Icon_Text)),
      ),
      body: Center(
        child: Text("Sozlanmalar sahifasi"),
      ),
    );
  }
}
