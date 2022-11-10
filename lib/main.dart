import 'package:flutter/material.dart';
import 'package:posts_app/core/appthemes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BONJOUR',
      theme: appTheme,
      home: Container(
        child: Text('bonjour'),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
