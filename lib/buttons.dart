import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;
  const MyButton(
      {super.key,
      required this.color,
      required this.textColor,
      required this.buttonText,
      required this.buttonTapped});
  @override
  Widget build(context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            color: color,
            child: Center(
                child: Text(
              buttonText,
              style: TextStyle(
                  color: textColor, fontSize: 30, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
    );
  }
}
