import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Day12Page extends StatelessWidget {
  final List<charts.Series<int, String>> chartData1 = [
    charts.Series<int, String>(
      id: 'barChart',
      colorFn: (value, index) => charts.MaterialPalette.deepOrange.shadeDefault,
      domainFn: (value, index) {
        return index.toString();
      },
      measureFn:(value, index) {
        return value;
      },
      data: [30, 1, 1, 2, 3, 5, 21, 13, 21, 34, 55, 30]
    )
  ];

  final List<charts.Series<int, int>> chartData2 = [
    charts.Series<int, int>(
      id: 'lineChart',
      colorFn: (value, index) => charts.MaterialPalette.black.lighter,
      domainFn: (value, index) {
        return index;
      },
      measureFn:(value, index) {
        return value;
      },
      data: [10, 12, 14, 25, 31, 52, 41, 31, 52, 66, 22, 11]
    )
  ];

  final List<charts.Series<int, int>> chartData3 = [
    charts.Series<int, int>(
      id: 'pieChart',
      domainFn: (value, index) {
        return index;
      },
      measureFn:(value, index) {
        return value;
      },
      data: [30, 10, 31, 52, 63]
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('charts'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              alignment: Alignment.center,
              child: Text('Bar chart', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),)
            ),
            Container(
              height: 200.0,
              child: charts.BarChart(
                chartData1
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              alignment: Alignment.center,
              child: Text('Line chart', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),)
            ),
            Container(
              height: 200.0,
              child: charts.LineChart(
                chartData2
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              alignment: Alignment.center,
              child: Text('Pie chart', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),)
            ),
            Container(
              height: 200.0,
              child: charts.PieChart(
                chartData3
              )
            ),
          ],
        )
      ),
    );
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}