import 'package:flutter/material.dart';
import 'package:test1_221252k/screens/home_screen.dart';
import 'package:test1_221252k/screens/order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //TODO Q2 Set theme color to green
      theme: ThemeData(primarySwatch: Colors.green),
      //TODO Q2 Set inital route and define routes
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/screens': (context) => const OrderScreen(),
      },
    );
  }
}
