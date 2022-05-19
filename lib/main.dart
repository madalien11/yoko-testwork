import 'package:flutter/material.dart';
import 'const/colors.dart';
import 'screens/auth/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yoko Test',
      theme: ThemeData(
        primaryColor: kPrimaryBlueColor,
        fontFamily: 'Lato',
        errorColor: kPrimaryRedColor,
      ),
      home: const LoginScreen(),
    );
  }
}
