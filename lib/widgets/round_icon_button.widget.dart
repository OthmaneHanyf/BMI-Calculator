import 'package:flutter/material.dart';

class ORoundIconButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;

  const ORoundIconButton(
      {Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: () => onPressed(),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF2c4867),
    );
  }
}
