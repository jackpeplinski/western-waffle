import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './blocs/theme.dart';
import './pages/navBar.dart';

void main() => runApp(WesternFood());

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
      home: NavBar(),
      theme: theme.getTheme(),
    );
  }
}
