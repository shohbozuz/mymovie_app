import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:root/root.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial());

  void init(BuildContext context) async {
    await Future.delayed(Duration(seconds: 4));
    Navigator.of(context).pushReplacementNamed('/bottomnavigationbar');

    bool? result = await Root.isRooted();
    bool _status = result ?? false;
    if (_status) {
      // Telefon root qilingan bo'lsa
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Diqqat!'),
          content: Text('Telefon root qilingan! Ilovadan chiqarilmoqda.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Ilova chiqariladi
                exit(0);
              },
              child: Text('Chiqish'),
            ),
          ],
        ),
      );
    } else {
      // Telefon root qilingan emas
      // ScaffoldMessenger.of(context).showSnackBar(
      //   // SnackBar(
      //   //   content: Text(''),
      //   // ),
      //
      // );
    }

    // Check Root availability
    bool? availabilityResult = await Root.isRootAvailable();
    bool _statusAvailability = availabilityResult ?? false;
    if (_statusAvailability) {
      // Root mavjud bo'lsa, ilovadan chiqarish
      exit(0);
    }
  }
}
