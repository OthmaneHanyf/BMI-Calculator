import 'package:flutter/material.dart';
import '../theme/color_palette.dart';

class OCard extends StatelessWidget {
  final int color;
  final Widget child;

  const OCard({Key? key, required this.color, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
