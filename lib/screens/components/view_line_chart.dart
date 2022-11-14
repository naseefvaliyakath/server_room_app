import 'package:dashbord/controllers/api_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';

class ViewLineChart extends StatefulWidget {
  const ViewLineChart({Key? key}) : super(key: key);

  @override
  _ViewLineChartState createState() => _ViewLineChartState();
}

class _ViewLineChartState extends State<ViewLineChart> {
  List<Color> gradientColors = [
    primaryColor,
    secondaryColor,
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(builder: (ctrl) {
      return LineChart(LineChartData(
          gridData: FlGridData(
            show: false,
          ),
          titlesData: FlTitlesData(
            show: true,
            bottomTitles: SideTitles(
                showTitles: true,
                reservedSize: 2,
                getTextStyles: (context, value) => const TextStyle(
                      color: lightTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 0:
                      return '0 min';
                    case 10:
                      return '10 min';
                    case 20:
                      return '20 min';
                    case 30:
                      return '30 min';
                    case 40:
                      return '40 min';
                    case 50:
                      return '50 min';
                    case 60:
                      return '60 min';
                  }
                  return '';
                }),
            leftTitles: SideTitles(
                showTitles: true,
                reservedSize: 25,
                getTextStyles: (context, value) => const TextStyle(
                      color: lightTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 1:
                      return '0 °C';
                    case 5:
                      return '5 °C';
                    case 10:
                      return '10 °C';
                    case 15:
                      return '15 °C';
                    case 20:
                      return '20 °C';
                    case 25:
                      return '25 °C';
                    case 30:
                      return '30 °C';
                    case 35:
                      return '35 °C';
                    case 40:
                      return '40 °C';
                  }
                  return '';
                }),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          minX: 0,
          maxX: 60,
          maxY: 40,
          minY: 0,
          lineBarsData: [
            LineChartBarData(
                spots: ctrl.spots.reversed.toList(),
                isCurved: true,
                colors: [primaryColor],
                barWidth: 2,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                    show: true,
                    colors:
                        gradientColors.map((e) => e.withOpacity(0.3)).toList(),
                    gradientFrom: Offset(0, 0),
                    gradientTo: Offset(0, 1.75)))
          ]));
    });
  }
}
