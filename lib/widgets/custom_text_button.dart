import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function press;
  CustomTextButton(this.title, this.press);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: press,
      child: Text(title),
      style: TextButton.styleFrom(
        textStyle: TextStyle(
          color: Theme.of(context).primaryTextTheme.button.color,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'Anton',
        ),
      ),
    );
  }
}
