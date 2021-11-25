import 'package:flutter/material.dart';

import '../constants.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({
    @required this.status,
    @required this.result,
    @required this.color,
  });

  final String status;
  final double result;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          status,
          style: kTitleTextStyle.copyWith(
            color: color,
          ),
        ),
        Text(
          result.toString(),
          style: kBMITextStyle,
        ),
        Text(
          'Your BMI is too low please eat something',
          textAlign: TextAlign.center,
          style: kBodyTextStyle,
        )
      ],
    );
  }
}
