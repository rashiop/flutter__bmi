import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

class NumberCard extends StatelessWidget {
  const NumberCard({
    @required this.label,
    @required this.number,
    @required this.onDecrement,
    @required this.onIncrement,
  });

  final String label;
  final String number;
  final Function onDecrement;
  final Function onIncrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          number,
          style: kNumberTextStyle,
        ),
        SizedBox(
          height: kSpacingSm,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundIconButton(
              onPressed: () {
                onDecrement();
              },
              icon: FontAwesomeIcons.minus,
            ),
            SizedBox(
              width: kSpacingSm,
            ),
            RoundIconButton(
              onPressed: () {
                onIncrement();
              },
              icon: FontAwesomeIcons.plus,
            ),
          ],
        ),
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    @required this.onPressed,
    @required this.icon,
  });

  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      disabledElevation: 6.0,
      child: Icon(
        icon,
        color: Colors.white,
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
    );
  }
}
