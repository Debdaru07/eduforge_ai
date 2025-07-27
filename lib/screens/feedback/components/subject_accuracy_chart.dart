import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SubjectAccuracyChart extends StatelessWidget {
  const SubjectAccuracyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
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
                      return Text('Economics', style: style);
                    case 1:
                      return Text('Geography', style: style);
                    case 2:
                      return Text('History', style: style);
                    case 3:
                      return Text('Polity', style: style);
                    case 4:
                      return Text('Current Affairs', style: style);
                    default:
                      return const Text('');
                  }
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: true),
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(
                  toY: 58,
                  color: Color(0xFFFC8D62),
                  width: 20,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
              ],
            ),
            BarChartGroupData(
              x: 1,
              barRods: [
                BarChartRodData(
                  toY: 67,
                  color: Color(0xFFBFBB50),
                  width: 20,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(
                  toY: 89,
                  color: Color(0xFF8DD3C7),
                  width: 20,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
              ],
            ),
            BarChartGroupData(
              x: 3,
              barRods: [
                BarChartRodData(
                  toY: 92,
                  color: Color(0xFF57B5E7),
                  width: 20,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(
                  toY: 76,
                  color: Color(0xFF8DD3C7),
                  width: 20,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
              ],
            ),
          ],
          maxY: 100,
        ),
      ),
    );
  }
}
