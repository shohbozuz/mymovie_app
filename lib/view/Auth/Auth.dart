import 'package:flutter/material.dart';
import 'package:mymovie/core/constants/color.dart';
import 'package:mymovie/view/Auth/Login.dart';
import 'package:mymovie/view/Auth/Register.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BottomNavigationBar_backgroundColor,
      body: Center(
        child: ListView(
          children: [
            Image(
              image: AssetImage('assets/logo/movie.png'),
            ),
            SizedBox(
              height: 200.0,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.Icon_Text),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
                child: Text("Login"),
                // Pass the context to the function
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Text(
                "yoki",
                style: TextStyle(color: AppColors.Icon_Text),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.Icon_Text),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register(),));
                },
                child: Text("Ro'yxatdan o'tish"),
                // Pass the context to the function
              ),
            ),
          ],
        ),
      ),
    );
  }
}

