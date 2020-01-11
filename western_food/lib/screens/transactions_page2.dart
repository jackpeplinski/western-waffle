import 'package:flutter/material.dart';
import 'transaction.dart';

void main() => runApp(MaterialApp(
  home: TransactionsPage(),
));

class TransactionsPage extends StatefulWidget {
  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {

  List<Transaction> transactions = [
    Transaction(type:'Buy', location:'Medway-Sydenham', charge:"500", date:"2020-01-01")
  ];

  Widget transactionTemplate(transaction){
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
                color: Colors.black,
              ),
            ),
            //location
            Text(
              transaction.location,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            //date
            Text(
              transaction.date,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
            //type
            Text(
              transaction.type,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.black,
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
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: Column(
        children: transactions.map((transaction) => transactionTemplate(transaction)).toList(),
      )
    );
  }
}