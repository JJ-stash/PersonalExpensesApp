import 'package:flutter/material.dart';
import 'package:personalexpenses/presentation/screens/login_screen.dart';
import 'package:personalexpenses/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Screen",
      home: const LoginScreen(),
      routes: {HomeScreen.routeName: (ctx) => const HomeScreen()},
    );
  }
}
