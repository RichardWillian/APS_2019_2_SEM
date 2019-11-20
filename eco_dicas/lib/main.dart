import 'package:flutter/material.dart';
import 'ui/home_page.dart';

void main() => runApp(EcoDicasApp());

class EcoDicasApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoDicas',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        hintColor: Colors.white
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}