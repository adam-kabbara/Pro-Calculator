import 'package:flutter/material.dart';
import 'package:ProCalculator/widgets/CalculatorButton.dart';
import 'package:ProCalculator/widgets/drawer.dart';
import 'package:ProCalculator/sizes_helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:decimal/decimal.dart';
import 'package:ProCalculator/settings.dart';


class EnergyCalculatorPage extends StatelessWidget {
  static const String routeName = '/energyCalculator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EnergyCalculator()
    );
  }
}


class EnergyCalculator extends StatefulWidget {
  @override
  _EnergyCalculatorState createState() => _EnergyCalculatorState();
}

class _EnergyCalculatorState extends State<EnergyCalculator> {
  String char;
  String dropdownValue1 = 'Gram calorie';
  String dropdownValue2 = 'Kilocalorie';
  String currentTextField = 'textField1';
  String textField1 = 'textField1';
  String textField2 = 'textField2';
  List transferUnits = [];
  bool negative = false;
  var fontWeight1 = FontWeight.bold;
  var fontWeight2 = FontWeight.normal;
  final myController1 = TextEditingController(text: '0');
  final myController2 = TextEditingController(text: '0');
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose(){
    super.dispose();
    myController1.dispose();
    myController2.dispose();
  }

  String calculate(String input, String fromValue, String toValue){
    transferUnits.clear();
    String output;
    transferUnits.add(fromValue);
    transferUnits.add(toValue);
    var decimalInput = Decimal.parse(input);
    var intInput = double.parse(input);

    if (transferUnits[0] == transferUnits[1]) {
        output = decimalInput.toString();
    }
    else if (listEquals(transferUnits, ["Joules", "Kilojoules"])){
      output = (decimalInput / Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ["Joules", "Gram calorie"])){
      output = (decimalInput / Decimal.parse('4.184')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 4.184).toString();
      }
    }
    else if (listEquals(transferUnits, ["Joules", "Kilocalorie"])){
      output = (decimalInput / Decimal.parse('4184')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 4184).toString();
      }
    }
    else if (listEquals(transferUnits, ["Joules", "Watt per hour"])){
      output = (decimalInput / Decimal.parse('3600')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3600).toString();
      }
    }
    else if (listEquals(transferUnits, ["Joules", "Kilowatt per hour"])){
      output = (decimalInput * Decimal.parse('3.6e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.6e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Joules", "Electronvolt"])){
      output = (decimalInput * Decimal.parse('6.242e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 6.242e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Joules", "British thermal unit"])){
      output = (decimalInput / Decimal.parse('1055')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1055).toString();
      }
    }
    else if (listEquals(transferUnits, ["Joules", "US therm"])){
      output = (decimalInput / Decimal.parse('1.055e+8')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.055e+8).toString();
      }
    }
    else if (listEquals(transferUnits, ["Joules", "Foot-pound"])){
      output = (decimalInput / Decimal.parse('1.356')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.356).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilojoules", "Joules"])){
      output = (decimalInput * Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilojoules", "Gram calorie"])){
      output = (decimalInput * Decimal.parse('239')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 239).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilojoules", "Kilocalorie"])){
      output = (decimalInput / Decimal.parse('4.184')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 4.184).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilojoules", "Watt per hour"])){
      output = (decimalInput / Decimal.parse('3.6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilojoules", "Kilowatt per hour"])){
      output = (decimalInput / Decimal.parse('3600')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3600).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilojoules", "Electronvolt"])){
      output = (decimalInput * Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilojoules", "British thermal unit"])){
      output = (decimalInput * Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilojoules", "US therm"])){
      output = (decimalInput / Decimal.parse('105480')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 105480).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilojoules", "Foot-pound"])){
      output = (decimalInput * Decimal.parse('738')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 738).toString();
      }
    }
    else if (listEquals(transferUnits, ["Gram calorie", "Joules"])){
      output = (decimalInput * Decimal.parse('4.184')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 4.184).toString();
      }
    }
    else if (listEquals(transferUnits, ["Gram calorie", "Kilojoules"])){
      output = (decimalInput / Decimal.parse('239')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 239).toString();
      }
    }
    else if (listEquals(transferUnits, ["Gram calorie", "Kilocalorie"])){
      output = (decimalInput / Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ["Gram calorie", "Watt per hour"])){
      output = (decimalInput / Decimal.parse('860')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 860).toString();
      }
    }
    else if (listEquals(transferUnits, ["Gram calorie", "Kilowatt per hour"])){
      output = (decimalInput / Decimal.parse('860')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 860).toString();
      }
    }
    else if (listEquals(transferUnits, ["Gram calorie", "Electronvolt"])){
      output = (decimalInput * Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Gram calorie", "British thermal unit"])){
      output = (decimalInput / Decimal.parse('252')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 252).toString();
      }
    }
    else if (listEquals(transferUnits, ["Gram calorie", "US therm"])){
      output = (decimalInput / Decimal.parse('2.521e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.521e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ["Gram calorie", "Foot-pound"])){
      output = (decimalInput * Decimal.parse('3.086')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.086).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilocalorie", "Joules"])){
      output = (decimalInput * Decimal.parse('4184')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 4184).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilocalorie", "Kilojoules"])){
      output = (decimalInput * Decimal.parse('4.184')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 4.184).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilocalorie", "Gram calorie"])){
      output = (decimalInput * Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilocalorie", "Watt per hour"])){
      output = (decimalInput * Decimal.parse('1.162')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1.162).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilocalorie", "Kilowatt per hour"])){
      output = (decimalInput / Decimal.parse('860')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 860).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilocalorie", "Electronvolt"])){
      output = (decimalInput * Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilocalorie", "British thermal unit"])){
      output = (decimalInput * Decimal.parse('3.966')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.966).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilocalorie", "US therm"])){
      output = (decimalInput / Decimal.parse('25210')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 25210).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilocalorie", "Foot-pound"])){
      output = (decimalInput * Decimal.parse('3086')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3086).toString();
      }
    }
    else if (listEquals(transferUnits, ["Watt per hour", "Joules"])){
      output = (decimalInput * Decimal.parse('3600')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3600).toString();
      }
    }
    else if (listEquals(transferUnits, ["Watt per hour", "Kilojoules"])){
      output = (decimalInput * Decimal.parse('3.6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Watt per hour", "Gram calorie"])){
      output = (decimalInput * Decimal.parse('860')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 860).toString();
      }
    }
    else if (listEquals(transferUnits, ["Watt per hour", "Kilocalorie"])){
      output = (decimalInput / Decimal.parse('1.162')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.162).toString();
      }
    }
    else if (listEquals(transferUnits, ["Watt per hour", "Kilowatt per hour"])){
      output = (decimalInput / Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ["Watt per hour", "Electronvolt"])){
      output = (decimalInput * Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Watt per hour", "British thermal unit"])){
      output = (decimalInput * Decimal.parse('3.412')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.412).toString();
      }
    }
    else if (listEquals(transferUnits, ["Watt per hour", "US therm"])){
      output = (decimalInput / Decimal.parse('29300')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 29300).toString();
      }
    }
    else if (listEquals(transferUnits, ["Watt per hour", "Foot-pound"])){
      output = (decimalInput * Decimal.parse('2655')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2655).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilowatt per hour", "Joules"])){
      output = (decimalInput * Decimal.parse('3.6e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.6e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilowatt per hour", "Kilojoules"])){
      output = (decimalInput * Decimal.parse('3600')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3600).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilowatt per hour", "Gram calorie"])){
      output = (decimalInput * Decimal.parse('860421')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 860421).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilowatt per hour", "Kilocalorie"])){
      output = (decimalInput * Decimal.parse('860')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 860).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilowatt per hour", "Watt per hour"])){
      output = (decimalInput * Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilowatt per hour", "Electronvolt"])){
      output = (decimalInput * Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilowatt per hour", "British thermal unit"])){
      output = (decimalInput / Decimal.parse('3412')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3412).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilowatt per hour", "US therm"])){
      output = (decimalInput * Decimal.parse('29.3')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 29.3).toString();
      }
    }
    else if (listEquals(transferUnits, ["Kilowatt per hour", "Foot-pound"])){
      output = (decimalInput * Decimal.parse('2.655e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.655e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Electronvolt", "Joules"])){
      output = (decimalInput / Decimal.parse('6.242e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 6.242e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Electronvolt", "Kilojoules"])){
      output = (decimalInput / Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Electronvolt", "Gram calorie"])){
      output = (decimalInput / Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Electronvolt", "Kilocalorie"])){
      output = (decimalInput / Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Electronvolt", "Watt per hour"])){
      output = (decimalInput / Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Electronvolt", "Kilowatt per hour"])){
      output = (decimalInput / Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Electronvolt", "British thermal unit"])){
      output = (decimalInput / Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Electronvolt", "US therm"])){
      output = (decimalInput / Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Electronvolt", "Foot-pound"])){
      output = (decimalInput / Decimal.parse('8.462e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 8.462e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["British thermal unit", "Joules"])){
      output = (decimalInput * Decimal.parse('1055')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1055).toString();
      }
    }
    else if (listEquals(transferUnits, ["British thermal unit", "Kilojoules"])){
      output = (decimalInput * Decimal.parse('1.055')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1.055).toString();
      }
    }
    else if (listEquals(transferUnits, ["British thermal unit", "Gram calorie"])){
      output = (decimalInput * Decimal.parse('252')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 252).toString();
      }
    }
    else if (listEquals(transferUnits, ["British thermal unit", "Kilocalorie"])){
      output = (decimalInput / Decimal.parse('3.966')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.966).toString();
      }
    }
    else if (listEquals(transferUnits, ["British thermal unit", "Watt per hour"])){
      output = (decimalInput / Decimal.parse('3.412')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.412).toString();
      }
    }
    else if (listEquals(transferUnits, ["British thermal unit", "Kilowatt per hour"])){
      output = (decimalInput / Decimal.parse('3412')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3412).toString();
      }
    }
    else if (listEquals(transferUnits, ["British thermal unit", "Electronvolt"])){
      output = (decimalInput * Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["British thermal unit", "US therm"])){
      output = (decimalInput / Decimal.parse('99976')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 99976).toString();
      }
    }
    else if (listEquals(transferUnits, ["British thermal unit", "Foot-pound"])){
      output = (decimalInput * Decimal.parse('778')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 778).toString();
      }
    }
    else if (listEquals(transferUnits, ["US therm", "Joules"])){
      output = (decimalInput * Decimal.parse('1.055e+8')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1.055e+8).toString();
      }
    }
    else if (listEquals(transferUnits, ["US therm", "Kilojoules"])){
      output = (decimalInput * Decimal.parse('105480')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 105480).toString();
      }
    }
    else if (listEquals(transferUnits, ["US therm", "Gram calorie"])){
      output = (decimalInput * Decimal.parse('2.521e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.521e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ["US therm", "Kilocalorie"])){
      output = (decimalInput * Decimal.parse('25210')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 25210).toString();
      }
    }
    else if (listEquals(transferUnits, ["US therm", "Watt per hour"])){
      output = (decimalInput * Decimal.parse('29300')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 29300).toString();
      }
    }
    else if (listEquals(transferUnits, ["US therm", "Kilowatt per hour"])){
      output = (decimalInput * Decimal.parse('29.3')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 29.3).toString();
      }
    }
    else if (listEquals(transferUnits, ["US therm", "Electronvolt"])){
      output = (decimalInput * Decimal.parse('9.223e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 9.223e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["US therm", "British thermal unit"])){
      output = (decimalInput * Decimal.parse('99976')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 99976).toString();
      }
    }
    else if (listEquals(transferUnits, ["US therm", "Foot-pound"])){
      output = (decimalInput * Decimal.parse('7.78e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 7.78e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ["Foot-pound", "Joules"])){
      output = (decimalInput * Decimal.parse('1.356')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1.356).toString();
      }
    }
    else if (listEquals(transferUnits, ["Foot-pound", "Kilojoules"])){
      output = (decimalInput / Decimal.parse('738')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 738).toString();
      }
    }
    else if (listEquals(transferUnits, ["Foot-pound", "Gram calorie"])){
      output = (decimalInput / Decimal.parse('3.086')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.086).toString();
      }
    }
    else if (listEquals(transferUnits, ["Foot-pound", "Kilocalorie"])){
      output = (decimalInput / Decimal.parse('3086')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3086).toString();
      }
    }
    else if (listEquals(transferUnits, ["Foot-pound", "Watt per hour"])){
      output = (decimalInput / Decimal.parse('2655')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2655).toString();
      }
    }
    else if (listEquals(transferUnits, ["Foot-pound", "Kilowatt per hour"])){
      output = (decimalInput / Decimal.parse('2.655e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.655e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Foot-pound", "Electronvolt"])){
      output = (decimalInput * Decimal.parse('8.462e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 8.462e+18).toString();
      }
    }
    else if (listEquals(transferUnits, ["Foot-pound", "British thermal unit"])){
      output = (decimalInput / Decimal.parse('778')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 778).toString();
      }
    }
    else if (listEquals(transferUnits, ["Foot-pound", "US therm"])){
      output = (decimalInput / Decimal.parse('7.78e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 7.78e+7).toString();
      }
    }
    return output;
  }

  void updateOutput(String _char){
    char = _char;

    setState(() {
    if (currentTextField == textField1){
      var returnVar = charParser(myController1.text);
      if (returnVar != null){
        myController1.text = returnVar;
        myController2.text = calculate(myController1.text, dropdownValue1, dropdownValue2);     
    
      }
    }
    else{
      var returnVar = charParser(myController2.text);
      if (returnVar != null){
        myController2.text = returnVar;
        myController1.text = calculate(myController2.text, dropdownValue2, dropdownValue1);
      }
    } 
    });
  }


  String charParser(String output){ 
    if (char == 'C'){
      output = '0';
    }
    else if (char == 'backspace'){
      if (output.length >= 2){
        output = output.substring(0, output.length - 1);
      }
      else if (output.length == 1){
        output = '0';
      }
    }
    else if (output == '0' && char != '.'){
      output = char;
    }
    else{
      if (char == '.' && output.contains('.')){

      }
      else{
      output += char;
      }
    }

    return output;
  }


  void onChange(String value, String newValue){
    setState(() {
      if (value == 'dropdownValue1'){
        dropdownValue1 = newValue;
      }
      else{
        dropdownValue2 = newValue;
      }

      if (currentTextField == textField1){
        myController2.text = calculate(myController1.text, dropdownValue1, dropdownValue2);
      }
      else{
        myController1.text = calculate(myController2.text, dropdownValue2, dropdownValue1);
      }
    });
  }


  void onTap(String textField){
    setState(() {
    if (textField == textField1 && currentTextField != textField1){
      fontWeight1 = FontWeight.bold;
      fontWeight2 = FontWeight.normal;
      currentTextField = textField1;
      myController1.text = '0';
      myController2.text = calculate(myController1.text, dropdownValue1, dropdownValue2);
    }
    else if (textField == textField2 && currentTextField != textField2){
      fontWeight2 = FontWeight.bold;
      fontWeight1 = FontWeight.normal;
      currentTextField = textField2;
      myController2.text = '0';
      myController1.text = calculate(myController2.text, dropdownValue2, dropdownValue1);
      }      
    });
  }


  @override
  Widget build(BuildContext context) {
    double horizontalPadding = displayHeight(context) * 0.03029105755;
    double verticalPadding = displayWidth(context) * 0.0585688821;
    double outputTextSize = displayHeight(context) * 0.052680110009;

        return Scaffold(
    key: _scaffoldKey,

    appBar: PreferredSize(
      preferredSize: Size.fromHeight(displayHeight(context) * 0.07),
      child: AppBar(
        backgroundColor: GC.globalColor,
        leading: IconButton(
          icon: IconTheme(data: IconThemeData(color: Colors.white), child: Icon(Icons.menu, size: displayHeight(context) * 0.035)),
          onPressed: () => _scaffoldKey.currentState.openDrawer()            
          ),
        title: Text("Energy Calculator", style: TextStyle(fontSize: displayHeight(context) * 0.025, color: Colors.white)),
        ),
      ),
    drawer: AppDrawer(),

    body:  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Opacity(
            opacity: 0.0,
            child: Divider(height: displayHeight(context) * 0.0395)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.02),
            child: TextFormField(
              controller: myController1,
              readOnly: true,
              showCursor: true,
              cursorWidth: 0,
              textAlign: TextAlign.end,
              onTap: () => onTap(textField1),
              style: TextStyle(
              fontSize: outputTextSize, fontWeight: fontWeight1),
              decoration: InputDecoration(
                border: InputBorder.none, 
               ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: displayWidth(context) * 0.03),
            child: DropdownButton(
              value: dropdownValue1,
              underline: Opacity(opacity: 0),
              style: TextStyle(color: GC.globalColor, fontWeight: FontWeight.w500, fontSize: displayHeight(context) * 0.018),
              elevation: 16,
              onChanged: (newValue) => {onChange('dropdownValue1', newValue)},

              items: ['Joules', 'Kilojoules', 'Gram calorie', 'Kilocalorie', 'Watt per hour', 'Kilowatt per hour', 'Electronvolt', 'British thermal unit', 'US therm', 'Foot-pound'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),


          Opacity(
            opacity: 0.0,
            child: Divider(height: displayHeight(context) * 0.06585)),


          Padding(
            padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.02),
            child: TextFormField(
              controller: myController2,
              readOnly: true,
              showCursor: true,
              cursorWidth: 0,
              textAlign: TextAlign.end,
              onTap: () => onTap(textField2),
              style: TextStyle(
              fontSize: outputTextSize, fontWeight: fontWeight2),
              decoration: InputDecoration(
                border: InputBorder.none, 
                ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: displayWidth(context) * 0.03),
            child: DropdownButton(
              value: dropdownValue2,
              underline: Opacity(opacity: 0),
              style: TextStyle(color: GC.globalColor, fontWeight: FontWeight.w500, fontSize: displayHeight(context) * 0.018),
              elevation: 16,
              onChanged: (newValue) => {onChange('dropdownValue2', newValue)},

              items: ['Joules', 'Kilojoules', 'Gram calorie', 'Kilocalorie', 'Watt per hour', 'Kilowatt per hour', 'Electronvolt', 'British thermal unit', 'US therm', 'Foot-pound'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          Expanded(
            child: Opacity(
              opacity: 0.0,
              child: Divider())
            ),

          Row(
            children: [
              CalculatorButton('C', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor), 
              CalculatorButton('backspace', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor),
            ]),

          Row(
            children: [
              CalculatorButton('7', verticalPadding, horizontalPadding, updateOutput), 
              CalculatorButton('8', verticalPadding, horizontalPadding, updateOutput),
              CalculatorButton('9', verticalPadding, horizontalPadding, updateOutput),
              ]),

          Row(
            children: [
              CalculatorButton('4', verticalPadding, horizontalPadding, updateOutput), 
              CalculatorButton('5', verticalPadding, horizontalPadding, updateOutput),
              CalculatorButton('6', verticalPadding, horizontalPadding, updateOutput),
              ]),

          Row(
            children: [
              CalculatorButton('1', verticalPadding, horizontalPadding, updateOutput), 
              CalculatorButton('2', verticalPadding, horizontalPadding, updateOutput),
              CalculatorButton('3', verticalPadding, horizontalPadding, updateOutput),
              ]),   

          Row(
            children: [
              CalculatorButton('0', verticalPadding, horizontalPadding, updateOutput),
              CalculatorButton('.', verticalPadding, horizontalPadding, updateOutput),
              ])
          ]
        )
    ));
  }
}