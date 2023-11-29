import 'package:flutter/material.dart';
import 'package:flutter_codigo_taskdb/pages/home_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TaskApp",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
