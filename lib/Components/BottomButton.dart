import 'package:flutter/material.dart';
import '../Constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonTitle, @required this.onTap});
  final String buttonTitle;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kbottomContainerColour,
      height: kbottomBarHeight,
      margin: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: Text(buttonTitle,
            style: kLargeButtonTextStyle,),
        ),
      ),
    );
  }
}