//creates the transactions page
import 'package:flutter/material.dart';

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> { 
  List<Transaction> transactions = [ //data goes here
    Transaction('Buy', 'Medway-Sydenham', "500", "2020-01-01"),
    Transaction('Buy', 'Delaware', "600", "2020-01-01"),
  ];

  Widget transactionTemplate(Transaction transaction){
    return Card(
     margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //charge
            Text(
            transaction.charge,
              style: TextStyle(
                fontSize: 70.0,
                color: Theme.of(context).accentColor,
              ),
            ),
            //location
            Text(
              transaction.location,
              style: TextStyle(
                fontSize: 14.0,
                color: Theme.of(context).accentColor,
              ),
            ),
            //date
            Text(
              transaction.date,
              style: TextStyle(
                fontSize: 14.0,
                color: Theme.of(context).accentColor,
              ),
            ),
            //type
            Text(
              transaction.transactionType,
              style: TextStyle(
                fontSize: 14.0,
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text(
          'Transactions',
          style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Column(
        //makes transactions card appear on screen
        children: transactions.map((transaction) => transactionTemplate(transaction)).toList(),
      )
    );
  }
}

class Transaction {
  String transactionType;
  String location;
  String charge;
  String date;
  
  Transaction(this.transactionType, this.location, this.charge, this.date);
}