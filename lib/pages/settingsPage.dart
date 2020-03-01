import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../blocs/theme.dart';
import './sendFeedback.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  _launchURL() async {
    const url = 'https://www.mealplan.uwo.ca/topup/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } //opens the URL

  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26.0,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Page"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              elevation: 5.0,
              margin: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Themes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                  buildListTile(
                    "Dark Theme",
                    Icons.invert_colors,
                    () => _themeChanger.setTheme(ThemeData.dark()),
                  ), //sets the theme to dark
                  buildListTile(
                    "Light Theme",
                    Icons.invert_colors,
                    () => _themeChanger.setTheme(ThemeData.light().copyWith(
                      accentColor: Colors.orange,
                    )),
                  ), //sets the theme to light
                  buildListTile(
                    "Western Theme",
                    Icons.invert_colors,
                    () => _themeChanger.setTheme(
                      ThemeData(
                        primaryColor: Colors.purple,
                        canvasColor: Colors.white,
                        accentColor: Colors.yellow,
                      ),
                    ),
                  ), //sets the theme to dark
                ],
              ),
            ),
            Card(
              elevation: 5.0,
              margin: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              child: buildListTile(
                "Send Feedback",
                Icons.help,
                () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SendFeedback())),
              ), //opens a new page which allows users to submit feedback
            ),
            Card(
              elevation: 5.0,
              margin: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              child: buildListTile(
                "Top Up Meal Plan",
                Icons.cake,
                _launchURL,
              ),
            ),
            Card(
              elevation: 5.0,
              margin: EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              child: buildListTile(
                "Logout",
                Icons.exit_to_app,
                null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
