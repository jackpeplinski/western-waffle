import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import './widgets/balanceCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    //creates list w var name _seriesBalanceData
    List<charts.Series<Balance, int>> _seriesBalanceData;
    
  _generateData() { //data goes in here
    var spendingRate = [
      Balance(5, 0),
      Balance(8, 2),
    ];
    _seriesBalanceData.add(
      charts.Series(
        //colors have to be in andriod form
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Hello',
        data: spendingRate,
        domainFn: (Balance balance, _) => balance.date,
        measureFn: (Balance balance, _) => balance.charge,
      ),
    ); 
  } 

  @override
  void initState() {
    super.initState();
    _seriesBalanceData = List<charts.Series<Balance, int>>();
    _generateData();
  } 

  @override
  Widget build(BuildContext context) {
    return Column(
    children: <Widget>[
      BalanceCard(),
      Text('Spending Rate', style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).accentColor,
        ),),
        Expanded(
          child: charts.LineChart(
            _seriesBalanceData,
            defaultRenderer: charts.LineRendererConfig(includeArea: true),
            animate: true,
            animationDuration: Duration(seconds: 1),
            behaviors: [
              charts.ChartTitle(
                'Days',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleOutsideJustification:charts.OutsideJustification.middleDrawArea,
                titleStyleSpec: charts.TextStyleSpec(color: charts.MaterialPalette.white),
              ),
              charts.ChartTitle(
                'Purchases', 
                behaviorPosition: charts.BehaviorPosition.start, 
                titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                titleStyleSpec: charts.TextStyleSpec(color: charts.MaterialPalette.white),
              ),
            ] 
          ),
        ),
      ],
    );
  }
}

class Balance {
  int charge;
  int date;

  Balance(this.charge, this.date);
}
