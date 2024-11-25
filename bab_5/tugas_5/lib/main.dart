import 'package:flutter/material.dart';
import 'package:tugas_5/screen/book_list_screen.dart';
// import 'screens/books_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.blueAccent,
      ),
      home: BookListScreen(),
    );
  }
}
