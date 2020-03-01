import '../UI/CustomInputField.dart';
import 'package:flutter/material.dart';
import './navBar.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blueAccent,
        child: Center(
          child: Container(
              width: 400,
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    child: Image.asset(
                      'images/itzWorking.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  CustomInputField(
                      Icon(Icons.person, color: Colors.white), 'Username'),
                  CustomInputField(
                      Icon(Icons.lock, color: Colors.white), 'Password'),
                  Container(
                    width: 150,
                    child: RaisedButton(
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => NavBar())),
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Text('Login', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}