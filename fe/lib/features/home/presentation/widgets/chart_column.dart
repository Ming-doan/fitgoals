import 'package:fitgoals/core/models/models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _BarChart extends StatelessWidget {
  final List<double> dataPoints;
  final double targetPoint;
  final BarChartColors colors;
  final List<String> dateLabels;

  const _BarChart(
    this.dataPoints,
    this.targetPoint,
    this.colors,
    this.dateLabels,
  );

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: _barGroups,
        titlesData: _titlesData,
        barTouchData: _barTouchData,
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        extraLinesData: ExtraLinesData(
          horizontalLines: [
            HorizontalLine(
              y: targetPoint,
              color: colors.aboveTargetColor,
              strokeWidth: 1,
              dashArray: [4, 2],
            ),
          ],
        ),
      ),
    );
  }

  BarTouchData get _barTouchData => BarTouchData(
        enabled: true,
        // handleBuiltInTouches: false,
        // touchTooltipData: BarTouchTooltipData(
        //   getTooltipColor: (group) => Colors.transparent,
        //   tooltipMargin: 0,
        //   getTooltipItem: (
        //     BarChartGroupData group,
        //     int groupIndex,
        //     BarChartRodData rod,
        //     int rodIndex,
        //   ) {
        //     return BarTooltipItem(
        //       rod.toY.toString(),
        //       TextStyle(
        //         fontWeight: FontWeight.bold,
        //         color: rod.color,
        //         fontSize: 18,
        //         shadows: const [
        //           Shadow(
        //             color: Colors.black26,
        //             blurRadius: 12,
        //           )
        //         ],
        //       ),
        //     );
        //   },
        // ),
      );

  Widget _getTitles(double value, TitleMeta meta) {
    final style = StyleObject(
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      backgroundColor: value == 4
          ? colors.aboveTargetColor
          : (value < 4 ? Colors.black : Colors.grey),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: CircleAvatar(
        backgroundColor: style.backgroundColor,
        child: Text(
          dateLabels[value.toInt()],
          style: style.textStyle,
        ),
      ),
    );
  }

  FlTitlesData get _titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: _getTitles,
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

  List<BarChartGroupData> get _barGroups => [
        for (int i = 0; i < dataPoints.length; i++)
          BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: dataPoints[i],
                color: _getBarColor(dataPoints[i]),
              )
            ],
          ),
      ];

  Color _getBarColor(double point) {
    if (point >= targetPoint) {
      return colors.aboveTargetColor;
    } else if (point > targetPoint / 2) {
      return colors.belowTargetColor;
    } else {
      return colors.farBelowTargetColor;
    }
  }
}

class ChartColumn extends StatefulWidget {
  final List<double> dataPoints;
  final double targetPoint;
  final BarChartColors colors;
  final List<String> dateLabels;

  const ChartColumn({
    super.key,
    required this.dataPoints,
    required this.targetPoint,
    required this.colors,
    required this.dateLabels,
  });

  @override
  State<ChartColumn> createState() => ChartColumnState();
}

class ChartColumnState extends State<ChartColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.8,
          child: _BarChart(
            widget.dataPoints,
            widget.targetPoint,
            widget.colors,
            widget.dateLabels,
          ),
        ),
      ],
    );
  }
}
