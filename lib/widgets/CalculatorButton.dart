import 'package:flutter/material.dart';
import 'package:ProCalculator/sizes_helpers.dart';
import 'package:ProCalculator/settings.dart';

class CalculatorButton extends StatefulWidget {
  final text;
  final verticalPadding;
  final horizontalPadding;
  final Function(String) callback;
  final color;
  CalculatorButton(this.text, this.verticalPadding, this.horizontalPadding, this.callback, {this.color});

  @override
  _CalculatorButtonState createState() => _CalculatorButtonState(text, verticalPadding, horizontalPadding, color: color);
}

class _CalculatorButtonState extends State<CalculatorButton> {
  final text;
  final verticalPadding;
  final horizontalPadding;
  final color;
  _CalculatorButtonState(this.text, this.verticalPadding, this.horizontalPadding, {this.color});

  void clicked(){
    widget.callback(this.text);
  }



  Widget buttonText(){
    if (text == 'backspace'){
      return IconTheme(
        data: IconThemeData(color: color),
        child: Icon(Icons.backspace, size: displayHeight(context) * 0.03));
    }
    else{
      return Text(this.text, style: TextStyle(fontSize: displayHeight(context) * 0.02565705255, fontWeight: FontWeight.bold, color: color));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: OutlineButton(
          child: buttonText(),
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding, 
            horizontal: horizontalPadding
          ),
          onPressed: clicked,
        )
    );  
  }
}
