import 'package:flutter/material.dart';
import 'package:mymovie/core/constants/color.dart';


class LoginScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

bool parolnikorish_ormaslik = false;

class _State extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String phoneErrorMessage = '';
  String passwordErrorMessage = '';

  double phoneBorderRadius = 10.0;
  double passwordBorderRadius = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.AppBar,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.Icon_Text),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
            children: <Widget>[
            SizedBox(height: 100),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(
            "Hisobga kirish",
            style: TextStyle(fontSize: 20, color: AppColors.Icon_Text),
          ),
        ),
        SizedBox(height: 7),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextFormField(
            controller: phoneController,
            cursorColor: AppColors.Icon_Text,
            keyboardType: TextInputType.phone,
            style: TextStyle(color: AppColors.Icon_Text),
            decoration: InputDecoration(
              counterStyle: TextStyle(color: AppColors.Icon_Text),
              labelText: "Telefon raqam",
              labelStyle: TextStyle(color: AppColors.Icon_Text),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(phoneBorderRadius),
                borderSide:
                BorderSide(color: AppColors.Icon_Text, width: 2.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                BorderSide(color: AppColors.Icon_Text, width: 2.0),
              ),
              errorText:
              phoneErrorMessage.isNotEmpty ? phoneErrorMessage : null,
            ),
            maxLength: 13,
          ),
        ),
        SizedBox(height: 7),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: TextFormField(
            obscureText: !parolnikorish_ormaslik,
            controller: passwordController,
            cursorColor: AppColors.Icon_Text,
            keyboardType: TextInputType.text,
            style: TextStyle(color: AppColors.Icon_Text),
            decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                parolnikorish_ormaslik
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: AppColors.Icon_Text,
              ),
              onPressed: () {
                setState(() {
                  parolnikorish_ormaslik = !parolnikorish_ormaslik;
                });
              },
            ),
            labelText: "Parol",
            labelStyle: TextStyle(color: AppColors.Icon_Text),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(passwordBorderRadius),
              borderSide:
              BorderSide(color: AppColors.Icon_Text, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
              BorderSide(color: AppColors.Icon_Text, width: 2.0),
            ),
            errorText: passwordErrorMessage.isNotEmpty
                ? passwordErrorMessage
                : null,
          ),
        ),
      ),
      TextButton(
        onPressed: () {},
        child: Text('Parolni unutdingizmi ?',
            style: TextStyle(color: AppColors.Icon_Text)),
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
            _validateAndSubmitForm(context);
          },
          child: Text("Kirish"),
          // Pass the context to the function
        ),
      ),
      ],
    ),
    ),
    backgroundColor: AppColors.BottomNavigationBar_backgroundColor,
    );
  }

  void _validateAndSubmitForm(BuildContext context) {
    final phone = phoneController.text.trim();
    final password = passwordController.text;

    setState(() {
      if (phone.isEmpty) {
        phoneErrorMessage = 'Iltimos telefon raqamni kiriting';
      } else if (phone.length != 13 || !phone.startsWith('+998')) {
        phoneErrorMessage = 'Telefon raqamni to\'liq kiriting (+998xxxxxxxxx)';
      } else {
        phoneErrorMessage = '';
      }
      passwordErrorMessage =
      password.isEmpty ? 'Iltimos parolingizni kiriting' : '';

      phoneBorderRadius = 10.0;
      passwordBorderRadius = 10.0;
    });
  }
}
