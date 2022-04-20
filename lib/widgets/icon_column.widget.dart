import 'package:bmi_calculator/theme/color_palette.dart';
import 'package:bmi_calculator/theme/typography.dart';
import 'package:flutter/material.dart';

class OIconColumn extends StatelessWidget {
  final int contentColor;
  final String primaryText;
  final IconData icon;

  const OIconColumn(
      {Key? key,
      required this.primaryText,
      required this.icon,
      this.contentColor = whiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Color(contentColor),
          size: 88.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          primaryText,
          style: TextStyle(
            fontSize: labelTextFontSize,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
