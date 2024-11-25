import 'package:flutter/material.dart';
import 'package:latihan_4/screen/home_screen.dart';
import 'package:latihan_4/screen/splash_screen.dart';
import 'package:latihan_4/screen/login_screen.dart';
void main() {
  runApp(HMTINewsApp());
}

class HMTINewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HMTI News',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
