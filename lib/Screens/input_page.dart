import 'package:bmi_calculator/Calculator_brain.dart';
import 'package:bmi_calculator/Screens/resultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/cardChildContents.dart';
import '../Constants.dart';
import '../Components/BottomButton.dart';
import '../Components/RoundIconButton.dart';
import '../Components/ReusableCard.dart';
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
enum GenderType{
  Male,
  Female,
}
class _InputPageState extends State<InputPage> {
  GenderType gender;
  int height = 180;
  int weight = 60;
  int age = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: gender == GenderType.Male ? kactiveCardColor : kinactiveCardColor,
                  cardChild: cardChildContents(
                  icon: FontAwesomeIcons.mars,
                  label: "MALE",
                  ),
                  onPress: (){
                    setState(() {
                      gender = GenderType.Male;
                    });
                  },
                ),
              ),
              Expanded(
                child: ReusableCard(
                colour: gender==GenderType.Female?kactiveCardColor:kinactiveCardColor,
                cardChild: cardChildContents(
                  icon: FontAwesomeIcons.venus,
                  label: "FEMALE",
                ),
                  onPress: (){
                  setState(() {
                    gender = GenderType.Female;
                  });
                  },
              ),
              ),
            ],
          ),
          ),
          Expanded(
            child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour:kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("HEIGHT",
                      style: klabelTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(height.toString(),
                            style: knumberTextStyle,
                          ),
                          Text(" cm",
                            style: klabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x1fEB1555),
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Color(0xFF8D8E98),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min:120,
                          max:220,
                          onChanged: (double newValue){
                            setState(() {
                                height = newValue.round();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),
          Expanded(
            child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    Text("WEIGHT",
                    style: klabelTextStyle,),
                    Text(weight.toString(),
                    style: knumberTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                        onPressed: (){
                            setState(() {
                              weight++;
                            });
                        },),
                      ],
                    ),
                  ],
                  ),
                  colour:kactiveCardColor),
              ),
              Expanded(
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("AGE",
                      style: klabelTextStyle,),
                      Text(age.toString(),
                      style: knumberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },),
                          RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                age++;
                              });
                            },),
                        ],
                      ),
                    ],
                  ),
                    colour:kactiveCardColor),
              ),
            ],
          ),
          ),
          BottomButton(
            buttonTitle: "CALCULATE",
            onTap: (){
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ResultsPage(
                calculateBMI: calc.calculateBMI(),
                getResult: calc.getResult(),
                getInterpretation: calc.getInterpretation(),
                getWeightRange: calc.getWeightRange(),
                getWeightChange: calc.getWeightChange(),
              ),
              ),
            );
          },
          ),
        ],
      )
    );
  }
}





