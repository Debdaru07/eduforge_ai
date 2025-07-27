import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PerformanceTrendChart extends StatelessWidget {
  const PerformanceTrendChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(
                    color: Color(0xff68737d),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  );
                  switch (value.toInt()) {
                    case 0:
                      return Text('Week 1', style: style);
                    case 1:
                      return Text('Week 2', style: style);
                    case 2:
                      return Text('Week 3', style: style);
                    case 3:
                      return Text('Week 4', style: style);
                    case 4:
                      return Text('Week 5', style: style);
                    case 5:
                      return Text('Week 6', style: style);
                    default:
                      return const Text('');
                  }
                },
              ),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 65),
                FlSpot(1, 72),
                FlSpot(2, 78),
                FlSpot(3, 82),
                FlSpot(4, 85),
                FlSpot(5, 88),
              ],
              isCurved: true,
              color: Color(0xFF57B5E7),
              barWidth: 3,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: Color(0xFF57B5E7).withOpacity(0.3),
              ),
            ),
          ],
          minY: 0,
          maxY: 100,
        ),
      ),
    );
  }
}
