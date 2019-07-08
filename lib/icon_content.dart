import 'package:flutter/material.dart';
import 'Constants.dart';

class ReusableInCard extends StatelessWidget {
  ReusableInCard(this.icon, this.text);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(text, style: KLabelTextStyle),
      ],
    );
  }
}
