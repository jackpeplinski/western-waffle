import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/theme.dart';
import './send_feedback.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("Dark Theme"),
              onPressed: () => _themeChanger.setTheme(ThemeData.dark()),
            ),
            FlatButton(
              child: Text("Light Theme"),
              onPressed: () => _themeChanger.setTheme(ThemeData.light()),
            ),
            FlatButton(
              child: Text("Western Theme"),
              onPressed: () => _themeChanger.setTheme(
                ThemeData(
                  primaryColor: Colors.white,
                  canvasColor: Colors.purple[300],
                  textTheme: TextTheme(),
                ),
              ),
            ),
            FlatButton(
              child: Text("Send Feedback"),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SendFeedback())),
            ),
          ],
        ),
      ),
    );
  }
}
