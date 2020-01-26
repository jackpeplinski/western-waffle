import 'package:flutter/material.dart';
import './Home.dart';
import './Transactions.dart';

void main() => runApp(WesternFood());

class WesternFood extends StatefulWidget {
  @override
  _WesternFoodState createState() => _WesternFoodState();
}

class _WesternFoodState extends State<WesternFood> {
  //underscore variables e.g. '_selectedTab' are only variables in the page where they are present 
  int _selectedTab = 0;
  final _potentialTabs = [
    //pages here must be listed in the same order that they are listed in the navigation bar widget below
    Home(),
    TransactionsPage(),
    //Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //???don't understand syntax for body below
        body: _potentialTabs[_selectedTab],
        //???isn't it redundant to have 'bottomNavigationBar: BottomNavigationBar(' why not just 'BottomNavigationBar('
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          //don't understand syntax for onTap below
          onTap:(int index){
            setState((){
              _selectedTab = index;
            });//setState
          },//onTap
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
            //could also use .access_time as an icon and then use .attach_money as icon for adding profits
              icon: Icon(Icons.attach_money),
              title: Text('Transactions'),
            ),
            //uncomment to the following section when settings has been added
            /*BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            ),*/
          ], //items
        ),
      ),
    );
  }
}