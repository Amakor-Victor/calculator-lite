import 'package:flutter/material.dart';
import 'package:listviewbuilder/homepage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my app',
      home: CalCScreen(),
    );
  }
}
