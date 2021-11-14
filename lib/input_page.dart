import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';
import 'icon_content.dart';
import 'number_content.dart';
import 'reusable_card.dart';

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
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 28.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
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
                  SizedBox(width: kSpacingSm),
                  Expanded(
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: kSpacingSm,
            ),
            Expanded(
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
            SizedBox(
              height: kSpacingSm,
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
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
                  SizedBox(width: 8.0),
                  Expanded(
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
                ],
              ),
            ),
            Container(
              color: kBottomContainerColor,
              margin: EdgeInsets.only(top: kSpacingSm),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ],
        ),
      ),
      floatingActionButton: Theme(
        data: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
        ),
        child: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
