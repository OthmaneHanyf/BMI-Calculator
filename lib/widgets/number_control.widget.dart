import 'package:bmi_calculator/theme/color_palette.dart';
import 'package:bmi_calculator/theme/typography.dart';
import 'package:bmi_calculator/widgets/round_icon_button.widget.dart';
import 'package:flutter/material.dart';

class ONumberControl extends StatelessWidget {
  final int value;
  final String label;
  final Function onChange;
  final int minValue;
  final int maxValue;
  const ONumberControl({
    Key? key,
    required this.onChange,
    required this.label,
    required this.value,
    required this.minValue,
    required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: labelTextFontSize,
            color: const Color(whiteColor),
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: numberTextFontSize,
            fontWeight: numberTextFornWeight,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ORoundIconButton(
              icon: Icons.add,
              onPressed: () =>
                  onChange(value == maxValue ? maxValue : value + 1),
            ),
            SizedBox(
              width: 10.0,
            ),
            ORoundIconButton(
              icon: Icons.remove,
              onPressed: () =>
                  onChange(value == minValue ? minValue : value - 1),
            ),
          ],
        )
      ],
    );
  }
}
