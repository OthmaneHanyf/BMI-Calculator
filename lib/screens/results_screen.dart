import 'package:bmi_calculator/theme/color_palette.dart';
import 'package:bmi_calculator/widgets/card.widget.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final double bmi;
  const ResultsScreen({Key? key, required this.bmi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Your Result',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: OCard(
                  color: activeCardColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          bmi < 18.5
                              ? 'UNDERWEIGHT'
                              : bmi > 25
                                  ? 'OVERWEIGHT'
                                  : 'NORMAL',
                          style: TextStyle(
                            letterSpacing: 1.5,
                            color: Colors.green,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          bmi.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 90.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              'Normal BMI range:',
                              style: TextStyle(
                                color: Color(0x77FFFFFF),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              '18,5 - 25 kg/m2',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          bmi < 18.5
                              ? 'You are thin, Try to eat more but healthy ofc!'
                              : bmi > 25
                                  ? 'You are fat, Try to take a diat and exercice more!'
                                  : 'You have a normal body weight. Good job!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 1.1,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
