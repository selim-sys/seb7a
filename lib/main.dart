import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const Seb7aApp());
}

class Seb7aApp extends StatelessWidget {
  const Seb7aApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
