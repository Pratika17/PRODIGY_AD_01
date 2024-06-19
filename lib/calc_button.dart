import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color btnColor;
  final Color txtColor;
  final Function(String) callback;

  CalcButton(this.text, this.btnColor, this.txtColor, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          callback(text);
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 35,
            color: txtColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: btnColor,
          padding: const EdgeInsets.all(20),
        ),
      ),
    );
  }
}