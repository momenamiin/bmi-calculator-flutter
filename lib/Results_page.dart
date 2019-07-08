import 'package:flutter/material.dart';
import 'Constants.dart';
import 'reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(this.bmiResult, this.resulttext, this.interpolation);
  final String bmiResult;
  final String resulttext;
  final String interpolation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: KTitleTextStyle),
            ),
          ),
          Expanded(
              flex: 5,
              child: ReusableCard(
                colour: KActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resulttext.toUpperCase(),
                      style: KresultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: KBMITextStyle,
                    ),
                    Text(
                      interpolation,
                      style: KBoadyTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  'RE-Calculate',
                  style: KLargeButtonTextStyle,
                ),
              ),
              color: KBottomContainerColor,
              padding: EdgeInsets.only(bottom: 20),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: KbottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}
