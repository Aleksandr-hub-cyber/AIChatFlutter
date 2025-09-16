import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SpendingChartPage extends StatelessWidget {
  // Demo spending data (day, amount)
  final List<Map<String, dynamic>> spending = [
    {'day': '01 Sep', 'amount': 3.4},
    {'day': '02 Sep', 'amount': 2.1},
    {'day': '03 Sep', 'amount': 4.0},
    {'day': '04 Sep', 'amount': 1.8},
    {'day': '05 Sep', 'amount': 2.7},
  ];

  SpendingChartPage({Key? key}) : super(key: key);

  List<BarChartGroupData> _makeBarGroups() {
    return List.generate(spending.length, (i) {
      final val = spending[i]['amount'] as double;
      return BarChartGroupData(x: i, barRods: [BarChartRodData(toY: val)]);
    });
  }

  @override
  Widget build(BuildContext context) {
    final groups = _makeBarGroups();
    return Scaffold(
      appBar: AppBar(title: Text('График расходов по дням')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Расходы по дням (демо данные)'),
            SizedBox(height: 12),
            Expanded(
              child: BarChart(BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 6,
                barGroups: groups,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
                  bottomTitles: AxisTitles(sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      final idx = value.toInt();
                      if (idx < 0 || idx >= spending.length) return Text('');
                      return Text(spending[idx]['day']);
                    },
                  )),
                ),
              )),
            ),
            SizedBox(height: 8),
            ElevatedButton(onPressed: () => Navigator.pop(context), child: Text('Назад')),
          ],
        ),
      ),
    );
  }
}
