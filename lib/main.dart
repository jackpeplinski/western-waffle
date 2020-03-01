import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './blocs/theme.dart';
import './pages/Home.dart';

void main() => runApp(WesternFood());

//<<<<<<< HEAD
class WesternFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.dark()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      home: Home(),
      theme: theme.getTheme(),
    );
  }
}
// =======
// class WesternFood extends StatefulWidget {
//   @override
//   _WesternFoodState createState() => _WesternFoodState();
// }

// class _WesternFoodState extends State<WesternFood> {

//   //intializes, declares, assigns var (the zero is arbitrary)
//   int _selectedTab = 0;
//   final List<Widget> _potentialTabs = [
//     //pages here must be listed in the same order that they are listed in the navigation bar widget below
//     Home(),
//     TransactionsPage(),
//     LocationSpending(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         //access _selectedTab from the list of _potentialTabs
//         body: _potentialTabs[_selectedTab],
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _selectedTab,
//           //change page displayed to _selectedTab .
//           onTap:(int index){
//             setState((){
//               _selectedTab = index;
//             }); //setState
//           }, //onTap
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               title: Text('Home'),
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.attach_money),
//               title: Text('Transactions'),
//             ),
//              BottomNavigationBarItem(
//               icon: Icon(Icons.map),
//               title: Text('Location Spending'),
//             ),
//           ], 
//         ),
//       ),
// >>>>>>> transactions
//     );
//   } 
// } 