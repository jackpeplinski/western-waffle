import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../models/faces_properties.dart';

class SendFeedback extends StatefulWidget {
  @override
  _SendFeedbackState createState() => _SendFeedbackState();
}

class _SendFeedbackState extends State<SendFeedback> {
  final titleController = TextEditingController();

  Widget feedbackText(String text) {
    return Text(
      text,
      softWrap: true,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }

  List<FaceProperties> faces = [
    FaceProperties(color: Colors.green, onOrOff: false, value: 0),
    FaceProperties(color: Colors.lightGreen, onOrOff: false, value: 1),
    FaceProperties(color: Colors.yellow, onOrOff: false, value: 2),
    FaceProperties(color: Colors.orange, onOrOff: false, value: 3),
    FaceProperties(color: Colors.red, onOrOff: false, value: 4),
  ];

  Widget face(IconData icon, FaceProperties specificFace) {
    return IconTheme(
      data: IconThemeData(),
      child: IconButton(
        iconSize: 60.0,
        icon: Icon(
          icon,
          color: specificFace.onOrOff ? specificFace.color : Colors.grey,
        ),
        onPressed: () => setState(() {
          for (int i = 0; i < faces.length; i++) {
            if (specificFace.value == faces[i].value) {
              faces[specificFace.value].onOrOff = !specificFace.onOrOff;
            } else {
              faces[i].onOrOff = false;
            }
          }
        }),
      ),
    );
  }

  bool highlight1 = true;
  bool highlight2 = true;
  bool highlight3 = true;

  Widget feedbackCard(String text, bool highlight) {
    return Expanded(
      child: Card(
        color: highlight
            ? Theme.of(context).primaryColor
            : Theme.of(context).accentColor,
        elevation: 5.0,
        margin: EdgeInsets.all(2.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        child: FlatButton(
          onPressed: () => setState(() {
            highlight = !highlight;
            if (text == "Suggestion") {
              highlight1 = highlight;
              highlight2 = true;
              highlight3 = true;
            }
            if (text == "Something is not quite right") {
              highlight2 = highlight;
              highlight1 = true;
              highlight3 = true;
            }
            if (text == "Compliment") {
              highlight3 = highlight;
              highlight1 = true;
              highlight2 = true;
            }
          }),
          child: Text(
            text,
            softWrap: true,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Feedback"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          feedbackText("We would love your feedback to help improve our app"),
          SizedBox(height: 40.0),
          feedbackText("What is your opinion on this app?"),
          SizedBox(height: 10.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                face(MdiIcons.emoticon, faces[0]),
                face(MdiIcons.emoticonHappy, faces[1]),
                face(MdiIcons.emoticonNeutral, faces[2]),
                face(MdiIcons.emoticonSad, faces[3]),
                face(MdiIcons.emoticonAngry, faces[4]),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          feedbackText("Please select your feedback category below"),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              feedbackCard("Suggestion", highlight1),
              feedbackCard("Something is not quite right", highlight2),
              feedbackCard("Compliment", highlight3),
            ],
          ),
          SizedBox(height: 20.0),
          feedbackText("Please leave your feedback below"),
          SizedBox(height: 20.0),
          SingleChildScrollView(
            child: Card(
              margin: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Tell us how we can help",
                  border: OutlineInputBorder(),
                ),
                controller: titleController,
                onSubmitted: (_) => null,
                maxLines: 5,
              ),
            ),
          ),
          Card(
            elevation: 5.0,
            margin: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            child: FlatButton(
              onPressed: null,
              child: Text(
                "Submit",
                softWrap: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// final titleController = TextEditingController();
// final amountController = TextEditingController();

// void submitFeedback() {
//   if (titleController.text.isEmpty ||
//       amountController.text.isEmpty ||
//       double.parse(amountController.text) > 10 ||
//       double.parse(amountController.text) < 1) {
//     return;
//   }

//   final feedback = titleController.text;
//   final review = double.parse(amountController.text);
// }

// appBar: AppBar(
//   title: Text("Your Feedback"),
// ),
// body: Container(
//   child: Card(
//     elevation: 5.0,
//     margin: EdgeInsets.all(20.0),
//     shape:
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: <Widget>[
//         Expanded(
//           flex: 9,
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Card(
//                   margin: EdgeInsets.all(10.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: "Tell us how we can help",
//                       border: OutlineInputBorder(),
//                     ),
//                     controller: titleController,
//                     onSubmitted: (_) => submitFeedback,
//                     maxLines: null,
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 Card(
//                   margin: EdgeInsets.all(10.0),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: "Give us feedback from 1-10!",
//                       border: OutlineInputBorder(),
//                     ),
//                     controller: amountController,
//                     keyboardType: TextInputType.number,
//                     onSubmitted: (_) => submitFeedback,
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//               ],
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Card(
//             elevation: 5.0,
//             margin: EdgeInsets.all(20.0),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(25.0)),
//             child: FlatButton(
//               onPressed: null,
//               child: Text(
//                 "Submit",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20.0,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// ),
