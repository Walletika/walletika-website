import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'spacer.dart';
import 'text.dart';

class CustomPieChart extends StatefulWidget {
  const CustomPieChart({
    required this.items,
    this.spacing = AppDecoration.spaceLarge,
    this.pieWidth = 300.0,
    this.pieHeight = 300.0,
    this.indicatorWidth,
    this.indicatorHeight,
    super.key,
  });

  final Map<String, double> items;
  final double spacing;
  final double pieWidth;
  final double pieHeight;
  final double? indicatorWidth;
  final double? indicatorHeight;

  @override
  State<CustomPieChart> createState() => _CustomPieChartState();
}

class _CustomPieChartState extends State<CustomPieChart> {
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: widget.spacing,
      runSpacing: widget.spacing,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: widget.pieWidth,
          height: widget.pieHeight,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      _touchedIndex = -1;
                      return;
                    }
                    _touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              sectionsSpace: 3.0,
              sections: _pieSectionsBuilder(),
            ),
          ),
        ),
        SizedBox(
          width: widget.indicatorWidth,
          height: widget.indicatorHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _indicatorsBuilder(),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> _pieSectionsBuilder() {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final TextStyle textStyle = themeData.textTheme.bodyMedium!.copyWith(
      color: colorScheme.onPrimary,
    );

    int index = 0;

    return widget.items.values.map<PieChartSectionData>((value) {
      final bool isTouched = index == _touchedIndex;
      final double radius = isTouched ? 90.0 : 80.0;
      index++;

      return PieChartSectionData(
        color: _pieColorBuilder(index, colorScheme.primary),
        value: value,
        title: '$value%',
        radius: radius,
        titleStyle: textStyle,
      );
    }).toList();
  }

  List<Widget> _indicatorsBuilder() {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    final List<Widget> widgets = [];
    int index = 0;

    for (final String text in widget.items.keys) {
      final bool isTouched = index == _touchedIndex;
      index++;

      widgets.add(Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: AppDecoration.iconSmallSize,
            height: AppDecoration.iconSmallSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _pieColorBuilder(index, colorScheme.primary),
            ),
          ),
          horizontalSpace(),
          Flexible(
            child: CustomText(
              text: text,
              blueLightColor: !isTouched,
            ),
          ),
        ],
      ));

      if (index != widget.items.length) widgets.add(verticalSpace());
    }

    return widgets;
  }

  Color _pieColorBuilder(int index, Color mainColor) {
    final int rate = 180 ~/ widget.items.length;
    return mainColor.withAlpha(230 - (rate * index));
  }
}
