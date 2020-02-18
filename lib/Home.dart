import 'package:flutter/material.dart';
import './spendingRate.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //background and AppBar
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Home'),
        ),
      //SpendingRate also contains the balance card
      body: SpendingRate(),
      ),
    );
  }
}