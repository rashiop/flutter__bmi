import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    this.onTap,
    @required this.buttonTitle,
  });

  final String buttonTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.only(top: 22.0),
        child: Text(
          buttonTitle,
          style: kButtonButtonTextStyle,
          textAlign: TextAlign.center,
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: kSpacingSm),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
