import 'package:flutter/material.dart';
import 'package:g/screens/Home_Page.dart';

void main() {
  runApp(const MusicApp());
}

class MusicApp extends StatelessWidget {
  const MusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
/*
 Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const NumbersPage();
              }));
*/ 