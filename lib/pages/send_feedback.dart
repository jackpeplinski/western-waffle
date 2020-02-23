import 'package:flutter/material.dart';

class SendFeedback extends StatefulWidget {
  @override
  _SendFeedbackState createState() => _SendFeedbackState();
}

class _SendFeedbackState extends State<SendFeedback> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitFeedback() {
    if (titleController.text.isEmpty ||
        amountController.text.isEmpty ||
        double.parse(amountController.text) > 10 ||
        double.parse(amountController.text) < 1) {
      return;
    }

    final feedback = titleController.text;
    final review = double.parse(amountController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Send Feedback"),
      ),
      body: Container(
        child: Card(
          elevation: 5.0,
          margin: EdgeInsets.all(20.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Card(
                        margin: EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Tell us how we can help",
                            border: OutlineInputBorder(),
                          ),
                          controller: titleController,
                          onSubmitted: (_) => submitFeedback,
                          maxLines: null,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Card(
                        margin: EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Give us feedback from 1-10!",
                            border: OutlineInputBorder(),
                          ),
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          onSubmitted: (_) => submitFeedback,
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: FlatButton(
                    onPressed: null,
                    child: Text(
                      "Submit",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
