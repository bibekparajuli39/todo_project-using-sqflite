import 'package:flutter/material.dart';
import 'package:todo_project/features/pdf/screens/pdf_screen.dart';

import 'package:todo_project/features/utils/screens/utils_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const PdfScreen(),
    );
  }
}
