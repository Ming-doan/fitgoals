import 'package:fitgoals/core/models/models.dart';
import 'package:fitgoals/core/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartColumn2 extends StatelessWidget {
  final List<double> dataPoints;
  final double targetPoint1;
  final double targetPoint2;
  final BarChartColors colors;
  final List<String> dateLabels;

  const ChartColumn2({
    super.key,
    required this.dataPoints,
    required this.targetPoint1,
    required this.targetPoint2,
    required this.colors,
    required this.dateLabels,
  });

  @override
  Widget build(BuildContext context) => _ChartColumn2(
        dataPoints: dataPoints,
        targetPoint1: targetPoint1,
        targetPoint2: targetPoint2,
        colors: colors,
        dateLabels: dateLabels,
      );
}

class _ChartColumn2 extends StatefulWidget {
  final List<double> dataPoints;
  final double targetPoint1;
  final double targetPoint2;
  final BarChartColors colors;
  final List<String> dateLabels;

  const _ChartColumn2({
    required this.dataPoints,
    required this.targetPoint1,
    required this.targetPoint2,
    required this.colors,
    required this.dateLabels,
  });

  @override
  _ChartColumn2State createState() => _ChartColumn2State();
}

class _ChartColumn2State extends State<_ChartColumn2> {
  static const double barWidth = 11;
  int touchedIndex = -1;

  Widget _buildBottomTitles(double value, TitleMeta meta) {
    final style = StyleObject(
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      backgroundColor: value == 4
          ? AppColors.primary
          : (value < 4 ? Colors.black : Colors.grey),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: CircleAvatar(
        backgroundColor: style.backgroundColor,
        child: Text(
          widget.dateLabels[value.toInt()],
          style: style.textStyle,
        ),
      ),
    );
  }

  BarChartGroupData _generateGroup(int x, double value) {
    final isTouched = touchedIndex == x;
    return BarChartGroupData(
      x: x,
      groupVertically: true,
      showingTooltipIndicators: isTouched ? [0] : [],
      barRods: [
        BarChartRodData(
          toY: value,
          width: barWidth,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          rodStackItems: [
            BarChartRodStackItem(
              0,
              value,
              _getBarColor(
                value,
                widget.targetPoint1,
              ),
            ),
          ],
        ),
        BarChartRodData(
          toY: -value,
          width: barWidth,
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          rodStackItems: [
            BarChartRodStackItem(
              0,
              -value,
              _getBarColor(
                value,
                widget.targetPoint2,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Color _getBarColor(double point, double targetPoint) {
    if (point >= targetPoint) {
      return widget.colors.aboveTargetColor;
    } else if (point > targetPoint / 2) {
      return widget.colors.belowTargetColor;
    } else {
      return widget.colors.farBelowTargetColor;
    }
  }

  bool _isShadowBar(int rodIndex) => rodIndex == 1;

  void _handleTouch(FlTouchEvent event, BarTouchResponse? barTouchResponse) {
    setState(() {
      if (!event.isInterestedForInteractions ||
          barTouchResponse == null ||
          barTouchResponse.spot == null) {
        touchedIndex = -1;
        return;
      }
      final rodIndex = barTouchResponse.spot!.touchedRodDataIndex;
      if (_isShadowBar(rodIndex)) {
        touchedIndex = -1;
        return;
      }
      touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          barTouchData: BarTouchData(
            handleBuiltInTouches: false,
            touchCallback: _handleTouch,
          ),
          titlesData: FlTitlesData(
            show: true,
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: _buildBottomTitles,
              ),
            ),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
          ),
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: 0,
                color: Colors.black,
                strokeWidth: 1,
                dashArray: [4, 2],
              ),
            ],
          ),
          barGroups: widget.dataPoints
              .asMap()
              .entries
              .map((e) => _generateGroup(e.key, e.value))
              .toList(),
        ),
      ),
    );
  }
}
