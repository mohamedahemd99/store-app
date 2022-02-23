import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late List<SalesData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    _tooltip = TooltipBehavior(enable: true);

    getOrdersPerMonth();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(title: AxisTitle(text: "Times/Month")),
        primaryYAxis: CategoryAxis(title: AxisTitle(text: "Orders")),
        tooltipBehavior: _tooltip,
        series: <ChartSeries<SalesData, String>>[
          ColumnSeries<SalesData, String>(
            borderRadius: BorderRadius.circular(5),
            spacing:2 ,

            // Bind data source
            dataSource: <SalesData>[
              SalesData('Jan', orders[0]),
              SalesData('Feb', orders[1]),
              SalesData('Mar', orders[2]),
              SalesData('Apr', orders[3]),
              SalesData('May', orders[4]),
              SalesData('Jun', orders[5]),
              SalesData('Jul', orders[6]),
              SalesData('Aug', orders[7]),
              SalesData('Sep', orders[8]),
              SalesData('Oct', orders[9]),
              SalesData('Nov', orders[10]),
              SalesData('Dec', orders[11]),
            ],
            xValueMapper: (SalesData sales, _) => sales.month,
            yValueMapper: (SalesData sales, _) => sales.sales,

            animationDuration: 2000,
          ),
        ]);
  }
}

class SalesData {
  SalesData(this.month, this.sales);
  final String month;
  final int sales;
}
