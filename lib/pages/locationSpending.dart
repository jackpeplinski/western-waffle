import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class LocationSpending extends StatefulWidget {
  @override
  _LocationSpendingState createState() => _LocationSpendingState();
}

class _LocationSpendingState extends State<LocationSpending> {
  List<charts.Series<Location, String>> _seriesLocationData;

  _generateData() { //data goes in here
    var locationData =[
      //colors must use andriod format
      Location("Medway-Sydenham", 5.80, Color(0xFFA533FF)),
      Location("Delaware", 10.01, Color(0xFFCA88FF)),
    ];

    _seriesLocationData.add(
      charts.Series(
        //the =>__ means "holds the __ value"
        domainFn: (Location location, _) => location.location,
        measureFn: (Location location, _) => location.chargePercent,
        id: "Spending by Location",
        data: locationData,
        colorFn: (Location location, _) => charts.ColorUtil.fromDartColor(location.color),
        //puts percent inside pie chart
          labelAccessorFn:  (Location row, _)=>'${row.chargePercent}', 
      ),//charts.Series
    );//_seriesLocationData.add
  }

  @override
  //initState is called on start up to sync data
  void initState() {
    super.initState();
    _seriesLocationData = List<charts.Series<Location, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Location Spending'),
          backgroundColor: Theme.of(context).accentColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                //creates title
                /*Text('Spending by Location',style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor,
                  ),),*/
                SizedBox(height: 10.0,),
                Expanded(
                  //creates PieChat
                  child: charts.PieChart(
                    _seriesLocationData,
                    animate: true,
                    animationDuration: Duration(seconds: 1),
                    //legend
                    behaviors: [
                        charts.DatumLegend(
                        outsideJustification: charts.OutsideJustification.endDrawArea,
                        horizontalFirst: false,
                        desiredMaxRows: 2,
                        cellPadding: new EdgeInsets.only(right: 4.0, bottom: 4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            //fontFamily: 'Georgia',
                            fontSize: 11),
                      )
                    ],
                    defaultRenderer: new charts.ArcRendererConfig(
                      arcWidth: 100,
                      arcRendererDecorators: [
                        new charts.ArcLabelDecorator(
                        labelPosition: charts.ArcLabelPosition.inside)
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Location {
  String location;
  double chargePercent;
  Color color;
  
  Location(this.location, this.chargePercent, this.color);
}
