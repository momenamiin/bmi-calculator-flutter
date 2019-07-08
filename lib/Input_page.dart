import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'Constants.dart';
import 'Results_page.dart';
import 'calculator_Brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum GenderType { Male, Female }

class _InputPageState extends State<InputPage> {
  GenderType SelectedGender;
  int heigt = 180;
  int weight = 60;
  int Age = 22;
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
                    child: ReusableCard(
                      colour: SelectedGender == GenderType.Male
                          ? KActiveCardColor
                          : KInactiveCardColor,
                      cardChild: ReusableInCard(FontAwesomeIcons.mars, "MALE"),
                      onPress: () {
                        setState(() {
                          SelectedGender = GenderType.Male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: SelectedGender == GenderType.Female
                          ? KActiveCardColor
                          : KInactiveCardColor,
                      cardChild:
                          ReusableInCard(FontAwesomeIcons.venus, "Female"),
                      onPress: () {
                        setState(() {
                          SelectedGender = GenderType.Female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  colour: KActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "HEIGHT",
                        style: KLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            heigt.toString(),
                            style: KNumberStyle,
                          ),
                          Text(
                            'cm',
                            style: KLabelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0XFFEB1555),
                            inactiveTickMarkColor: Color(0xFF8D8E98),
                            activeTrackColor: Colors.white,
                            overlayColor: Color(0x295B1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0)),
                        child: Slider(
                          value: heigt.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newvalue) {
                            setState(() {
                              heigt = newvalue.round();
                            });
                          },
                        ),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        colour: KActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Weight',
                              style: KLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: KNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(
                                      () {
                                        weight++;
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        colour: KActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: KLabelTextStyle,
                            ),
                            Text(
                              Age.toString(),
                              style: KNumberStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(
                                      () {
                                        Age++;
                                      },
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      Age--;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalculatorBrain Calc =
                    CalculatorBrain(Height: heigt, Weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(Calc.calcualteBMI(),
                            Calc.getResult(), Calc.getInterpretation())));
              },
              child: Container(
                child: Center(
                  child: Text(
                    'Calculate',
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
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onpressed;
  RoundIconButton({this.icon, this.onpressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4c4f5e),
    );
  }
}
