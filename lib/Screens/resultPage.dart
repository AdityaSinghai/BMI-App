import 'package:bmi_calculator/Components/BottomButton.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/ReusableCard.dart';
import '../Constants.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.calculateBMI, @required this.getInterpretation, @required this.getResult,@required this.getWeightRange,@required this.getWeightChange});
  final String calculateBMI;
  final String getResult;
  final String getInterpretation;
  final String getWeightRange;
  final String getWeightChange;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result",
              style: kResultsTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(getResult.toUpperCase(),
                  style: kResultsSentenceTextStyle,),
                  Text(calculateBMI,
                  style: kResultBMITextStyle,),
                  Text(
                    getWeightRange,
                    style: klabelTextStyle,
                  ),
                  Text(
                    getWeightChange,
                    style: kLargeButtonTextStyle,
                  ),
                  Text(getInterpretation,
                  style: kBMISentenceTextStyle,),
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: "RE-CALCULATE",
          onTap: (){
            Navigator.pop(context);
          },
          ),
        ],
      ),
    );
  }
}
