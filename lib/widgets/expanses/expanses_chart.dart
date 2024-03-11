import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:memoapp/utils/db_helper.dart';
import 'package:provider/provider.dart';

class ExpansesChart extends StatefulWidget {
  final String category;
  const ExpansesChart({super.key, required this.category});

  @override
  State<StatefulWidget> createState() {
    return _StateExpansesChart();
  }
}

class _StateExpansesChart extends State<ExpansesChart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var maxY =
            db.calculateEntriesAndAmmount(widget.category)['totalAmmount'];
        var list = db.calculateWeekExpanses();
        return BarChart(
          BarChartData(
            minY: 0,
            maxY: maxY,
            barGroups: [
              ...list.map(
                (e) => BarChartGroupData(
                  x: list.indexOf(e),
                  barRods: [
                    BarChartRodData(
                      toY: e['ammount'],
                      width: 20,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
              )
            ],
            titlesData: FlTitlesData(
              topTitles: const AxisTitles(
                drawBelowEverything: true,
              ),
              leftTitles: const AxisTitles(
                drawBelowEverything: true,
              ),
              rightTitles: const AxisTitles(
                drawBelowEverything: true,
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) => Text(DateFormat.E().format(
                    list[value.toInt()]['day'],
                  )),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
