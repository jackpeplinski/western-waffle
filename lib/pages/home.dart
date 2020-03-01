import 'package:flutter/material.dart';
import '../spendingRate.dart';
import '../transactionsPage.dart';
import '../locationSpending.dart';
import './settingsPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

//intializes, declares, assigns var (the zero is arbitrary)
  int _selectedTab = 0;
  final List<Widget> _potentialTabs = [
    //pages here must be listed in the same order that they are listed in the navigation bar widget below
    SpendingRate(),
    TransactionsPage(),
    LocationSpending(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        //access _selectedTab from the list of _potentialTabs
        body: _potentialTabs[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          //change page displayed to _selectedTab .
          onTap:(int index){
            setState((){
              _selectedTab = index;
            }); //setState
          }, //onTap
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              title: Text('Transactions'),
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('Location Spending'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ], 
        ),
      );
  }
}