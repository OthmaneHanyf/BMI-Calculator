import 'dart:math';

import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:bmi_calculator/theme/color_palette.dart';
import 'package:bmi_calculator/theme/typography.dart';
import 'package:bmi_calculator/widgets/number_control.widget.dart';
import 'package:flutter/material.dart';
import '../widgets/card.widget.dart';
import '../widgets/icon_column.widget.dart';

enum Gender {
  male,
  female,
  none,
}

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  Gender gender = Gender.none;
  int height = 170;
  int weight = 60;
  int age = 30;

  onGenderChange(Gender gender) {
    setState(() {
      this.gender = gender;
    });
  }

  onHeightChange(int height) {
    setState(() {
      this.height = height;
    });
  }

  onWeightChange(int weight) {
    setState(() {
      this.weight = weight;
    });
  }

  onAgeChange(int age) {
    setState(() {
      this.age = age;
    });
  }

  handleCalculation() {
    double bmi = weight / pow(height / 100, 2);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultsScreen(bmi: bmi)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () => onGenderChange(Gender.male),
                  child: OCard(
                      color: gender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      child: const OIconColumn(
                        icon: Icons.male,
                        primaryText: "MALE",
                        contentColor: whiteColor,
                      )),
                )),
                Expanded(
                    child: GestureDetector(
                  onTap: () => onGenderChange(Gender.female),
                  child: OCard(
                      color: gender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      child: const OIconColumn(
                        icon: Icons.female,
                        primaryText: "FEMALE",
                        contentColor: whiteColor,
                      )),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: OCard(
                        color: activeCardColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "HEIGHT",
                              style: TextStyle(
                                color: Color(whiteColor),
                                fontSize: labelTextFontSize,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: const TextStyle(
                                    fontSize: numberTextFontSize,
                                    fontWeight: numberTextFornWeight,
                                  ),
                                ),
                                const Text(
                                  "cm",
                                  style: TextStyle(
                                    color: Color(whiteColor),
                                    fontSize: labelTextFontSize,
                                  ),
                                )
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 12.0),
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                onChanged: (h) => onHeightChange(h.toInt()),
                                min: 1.0,
                                max: 200.0,
                                activeColor: const Color(secondaryColor),
                                inactiveColor: const Color(secondaryDarkColor),
                              ),
                            )
                          ],
                        ))),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: OCard(
                  color: activeCardColor,
                  child: ONumberControl(
                    onChange: onWeightChange,
                    label: 'WEIGHT',
                    value: weight,
                    minValue: 1,
                    maxValue: 62,
                  ),
                )),
                Expanded(
                  child: OCard(
                    color: activeCardColor,
                    child: ONumberControl(
                      onChange: onAgeChange,
                      label: 'AGE',
                      value: age,
                      minValue: 1,
                      maxValue: 33,
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: handleCalculation,
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                "CALCULATE",
                style: TextStyle(
                  fontSize: 23.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              color: const Color(secondaryColor),
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: 65.0,
            ),
          ),
        ],
      ),
    );
  }
}
