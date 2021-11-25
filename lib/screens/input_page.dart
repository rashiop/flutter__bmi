import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/number_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 154;
  int weight = 48;
  int age = 28;

  void _setHeight(double newHeight) {
    height = newHeight.round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(kSpacingSm),
                    child: ReusableCard(
                      onTap: () => setState(() {
                        selectedGender = Gender.male;
                      }),
                      color: selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: IconContent(
                          icon: FontAwesomeIcons.mars, text: 'MALE'),
                    ),
                  ),
                ),
                SizedBox(width: kSpacingSm),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(kSpacingSm),
                    child: ReusableCard(
                      onTap: () => setState(() {
                        selectedGender = Gender.female;
                      }),
                      color: selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      child: IconContent(
                          icon: FontAwesomeIcons.venus, text: 'FEMALE'),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: kSpacingSm,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(kSpacingSm),
              child: ReusableCard(
                color: kInactiveCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text('cm'),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTrackColor: kActiveSliderColor,
                          overlayShape: RoundSliderOverlayShape(
                            overlayRadius: kOverlayRadiusSize,
                          ),
                          trackHeight: 1,
                          thumbColor: kThumbSliderColor,
                          overlayColor: kOverlaySliderColor,
                          thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: kThumbSliderSize,
                          )),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 200,
                        onChanged: (double newHeight) {
                          setState(() {
                            _setHeight(newHeight);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: kSpacingSm,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(kSpacingSm),
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: NumberCard(
                        label: 'Weight',
                        number: weight.toString(),
                        onDecrement: () {
                          setState(() {
                            weight--;
                          });
                        },
                        onIncrement: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(kSpacingSm),
                    child: ReusableCard(
                      color: kActiveCardColor,
                      child: NumberCard(
                        label: 'Age',
                        number: age.toString(),
                        onDecrement: () {
                          setState(() {
                            age--;
                          });
                        },
                        onIncrement: () {
                          setState(() {
                            age++;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  new CalculatorBrain(weight: weight, height: height);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    status: calc.getResult(),
                    bmi: calc.calculateBMI(),
                    suggestion: calc.getSuggestion(),
                    color: calc.getColor(),
                  ),
                ),
              );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
