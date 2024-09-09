import 'package:fitgoals/resources/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

enum DayType {
  previous(-1),
  current(0),
  next(1);

  final int value;
  const DayType(this.value);
}

class StyleObject {
  final TextStyle textStyle;
  final Color backgroundColor;

  StyleObject({
    required this.textStyle,
    required this.backgroundColor,
  });
}

const double targetPoint = 10;

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 16,
        barGroups: barGroups,
        borderData: borderData,
        titlesData: titlesData,
        barTouchData: barTouchData,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            HorizontalLine(
              y: targetPoint,
              color: AppColors.primary,
              strokeWidth: 1,
              dashArray: [4, 2],
            ),
          ],
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
      );

  Widget getTitles(double value, TitleMeta meta) {
    final previousDayStyle = StyleObject(
      textStyle: const TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      backgroundColor: AppColors.black,
    );
    final currentDayStyle = StyleObject(
      textStyle: const TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      backgroundColor: AppColors.primary,
    );
    final nextDayStyle = StyleObject(
      textStyle: const TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      backgroundColor: AppColors.grey,
    );

    StyleObject style = nextDayStyle;
    String text;
    DayType type;

    switch (value.toInt()) {
      case 0:
        text = '19';
        type = DayType.previous;
        break;
      case 1:
        text = '20';
        type = DayType.previous;
        break;
      case 2:
        text = '21';
        type = DayType.previous;
        break;
      case 3:
        text = '22';
        type = DayType.previous;
        break;
      case 4:
        text = '23';
        type = DayType.current;
        break;
      case 5:
        text = '24';
        type = DayType.next;
        break;
      case 6:
        text = '25';
        type = DayType.next;
        break;
      default:
        text = '';
        type = DayType.next;
        break;
    }

    if (type == DayType.current) {
      style = currentDayStyle;
    } else if (type == DayType.previous) {
      style = previousDayStyle;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      // child: Text(text, style: style),
      child: CircleAvatar(
        backgroundColor: style.backgroundColor,
        child: Text(
          text,
          style: style.textStyle,
        ),
      ),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 12,
              color: AppColors.primary,
            )
          ],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 10.5,
              color: AppColors.primary,
            )
          ],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 6,
              color: AppColors.secondary,
            )
          ],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 2,
              color: AppColors.tertiary,
            )
          ],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: 4,
              color: AppColors.tertiary,
            )
          ],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [BarChartRodData(toY: 0)],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [BarChartRodData(toY: 0)],
        ),
      ];
}

class ChartColumn extends StatefulWidget {
  const ChartColumn({super.key});

  @override
  State<StatefulWidget> createState() => ChartColumnState();
}

class ChartColumnState extends State<ChartColumn> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.6,
            child: _BarChart(),
          ),
        ],
      ),
    );
  }
}
