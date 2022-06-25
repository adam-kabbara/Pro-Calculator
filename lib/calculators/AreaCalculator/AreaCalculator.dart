import 'package:flutter/material.dart';
import 'package:ProCalculator/widgets/CalculatorButton.dart';
import 'package:ProCalculator/widgets/drawer.dart';
import 'package:ProCalculator/sizes_helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:decimal/decimal.dart';
import 'package:ProCalculator/settings.dart';


class AreaCalculatorPage extends StatelessWidget {
  static const String routeName = '/areaCalculator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AreaCalculator()
    );
  }
}


class AreaCalculator extends StatefulWidget {
  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  String char;
  String dropdownValue1 = 'Square meters';
  String dropdownValue2 = 'Square yards';
  String currentTextField = 'textField1';
  String textField1 = 'textField1';
  String textField2 = 'textField2';
  List transferUnits = [];
  bool negative = false;
  var fontWeight1 = FontWeight.bold;
  var fontWeight2 = FontWeight.normal;
  final myController1 = TextEditingController(text: '0');
  final myController2 = TextEditingController(text: '0');

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
    else if (listEquals(transferUnits, ["Square millimeters", "Square centimeters"])){
      output = (decimalInput / Decimal.parse('100')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 100).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square millimeters", "Square meters"])){
      output = (decimalInput / Decimal.parse('1e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square millimeters", "Hectares"])){
      output = (decimalInput / Decimal.parse('1e+10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1e+10).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square millimeters", "Square kilometers"])){
      output = (decimalInput / Decimal.parse('1e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1e+12).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square millimeters", "Square inches"])){
      output = (decimalInput / Decimal.parse('645')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 645).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square millimeters", "Square feet"])){
      output = (decimalInput / Decimal.parse('92903')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 92903).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square millimeters", "Square yards"])){
      output = (decimalInput / Decimal.parse('836127')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 836127).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square millimeters", "Acres"])){
      output = (decimalInput / Decimal.parse('4.047e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 4.047e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square millimeters", "Square miles"])){
      output = (decimalInput / Decimal.parse('2.59e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.59e+12).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square centimeters", "Square millimeters"])){
      output = (decimalInput * Decimal.parse('100')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 100).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square centimeters", "Square meters"])){
      output = (decimalInput / Decimal.parse('10000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 10000).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square centimeters", "Hectares"])){
      output = (decimalInput / Decimal.parse('1e+8')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1e+8).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square centimeters", "Square kilometers"])){
      output = (decimalInput / Decimal.parse('1e+10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1e+10).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square centimeters", "Square inches"])){
      output = (decimalInput / Decimal.parse('6.452')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 6.452).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square centimeters", "Square feet"])){
      output = (decimalInput / Decimal.parse('929')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 929).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square centimeters", "Square yards"])){
      output = (decimalInput / Decimal.parse('8361')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 8361).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square centimeters", "Acres"])){
      output = (decimalInput / Decimal.parse('4.047e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 4.047e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square centimeters", "Square miles"])){
      output = (decimalInput / Decimal.parse('2.59e+10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.59e+10).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square meters", "Square millimeters"])){
      output = (decimalInput * Decimal.parse('1e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square meters", "Square centimeters"])){
      output = (decimalInput * Decimal.parse('10000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 10000).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square meters", "Hectares"])){
      output = (decimalInput / Decimal.parse('10000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 10000).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square meters", "Square kilometers"])){
      output = (decimalInput / Decimal.parse('1e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square meters", "Square inches"])){
      output = (decimalInput * Decimal.parse('1550')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1550).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square meters", "Square feet"])){
      output = (decimalInput * Decimal.parse('10.764')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 10.764).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square meters", "Square yards"])){
      output = (decimalInput * Decimal.parse('1.196')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1.196).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square meters", "Acres"])){
      output = (decimalInput / Decimal.parse('4047')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 4047).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square meters", "Square miles"])){
      output = (decimalInput / Decimal.parse('2.59e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.59e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Hectares", "Square millimeters"])){
      output = (decimalInput * Decimal.parse('1e+10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+10).toString();
      }
    }
    else if (listEquals(transferUnits, ["Hectares", "Square centimeters"])){
      output = (decimalInput * Decimal.parse('1e+8')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+8).toString();
      }
    }
    else if (listEquals(transferUnits, ["Hectares", "Square meters"])){
      output = (decimalInput * Decimal.parse('10000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 10000).toString();
      }
    }
    else if (listEquals(transferUnits, ["Hectares", "Square kilometers"])){
      output = (decimalInput / Decimal.parse('100')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 100).toString();
      }
    }
    else if (listEquals(transferUnits, ["Hectares", "Square inches"])){
      output = (decimalInput * Decimal.parse('1.55e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1.55e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ["Hectares", "Square feet"])){
      output = (decimalInput * Decimal.parse('107639')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 107639).toString();
      }
    }
    else if (listEquals(transferUnits, ["Hectares", "Square yards"])){
      output = (decimalInput * Decimal.parse('11960')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 11960).toString();
      }
    }
    else if (listEquals(transferUnits, ["Hectares", "Acres"])){
      output = (decimalInput * Decimal.parse('2.471')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.471).toString();
      }
    }
    else if (listEquals(transferUnits, ["Hectares", "Square miles"])){
      output = (decimalInput / Decimal.parse('259')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 259).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square kilometers", "Square millimeters"])){
      output = (decimalInput * Decimal.parse('1e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+12).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square kilometers", "Square centimeters"])){
      output = (decimalInput * Decimal.parse('1e+10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+10).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square kilometers", "Square meters"])){
      output = (decimalInput * Decimal.parse('1e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square kilometers", "Hectares"])){
      output = (decimalInput * Decimal.parse('100')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 100).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square kilometers", "Square inches"])){
      output = (decimalInput * Decimal.parse('1.55e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1.55e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square kilometers", "Square feet"])){
      output = (decimalInput * Decimal.parse('1.076e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1.076e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square kilometers", "Square yards"])){
      output = (decimalInput * Decimal.parse('1.196e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1.196e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square kilometers", "Acres"])){
      output = (decimalInput * Decimal.parse('247')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 247).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square kilometers", "Square miles"])){
      output = (decimalInput / Decimal.parse('2.59')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.59).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square inches", "Square millimeters"])){
      output = (decimalInput * Decimal.parse('645')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 645).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square inches", "Square centimeters"])){
      output = (decimalInput * Decimal.parse('6.452')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 6.452).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square inches", "Square meters"])){
      output = (decimalInput / Decimal.parse('1550')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1550).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square inches", "Hectares"])){
      output = (decimalInput / Decimal.parse('1.55e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.55e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square inches", "Square kilometers"])){
      output = (decimalInput / Decimal.parse('1.55e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.55e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square inches", "Square feet"])){
      output = (decimalInput / Decimal.parse('144')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 144).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square inches", "Square yards"])){
      output = (decimalInput / Decimal.parse('1296')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1296).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square inches", "Acres"])){
      output = (decimalInput / Decimal.parse('6.273e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 6.273e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square inches", "Square miles"])){
      output = (decimalInput / Decimal.parse('4.014e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 4.014e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square feet", "Square millimeters"])){
      output = (decimalInput * Decimal.parse('92903')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 92903).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square feet", "Square centimeters"])){
      output = (decimalInput * Decimal.parse('929')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 929).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square feet", "Square meters"])){
      output = (decimalInput / Decimal.parse('10.764')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 10.764).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square feet", "Hectares"])){
      output = (decimalInput / Decimal.parse('107639')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 107639).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square feet", "Square kilometers"])){
      output = (decimalInput / Decimal.parse('1.076e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.076e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square feet", "Square inches"])){
      output = (decimalInput * Decimal.parse('144')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 144).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square feet", "Square yards"])){
      output = (decimalInput / Decimal.parse('9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 9).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square feet", "Acres"])){
      output = (decimalInput / Decimal.parse('43560')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 43560).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square feet", "Square miles"])){
      output = (decimalInput / Decimal.parse('2.788e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.788e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square yards", "Square millimeters"])){
      output = (decimalInput * Decimal.parse('836127')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 836127).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square yards", "Square centimeters"])){
      output = (decimalInput * Decimal.parse('8361')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 8361).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square yards", "Square meters"])){
      output = (decimalInput / Decimal.parse('1.196')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.196).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square yards", "Hectares"])){
      output = (decimalInput / Decimal.parse('11960')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 11960).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square yards", "Square kilometers"])){
      output = (decimalInput / Decimal.parse('1.196e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.196e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square yards", "Square inches"])){
      output = (decimalInput * Decimal.parse('1296')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1296).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square yards", "Square feet"])){
      output = (decimalInput * Decimal.parse('9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 9).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square yards", "Acres"])){
      output = (decimalInput / Decimal.parse('4840')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 4840).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square yards", "Square miles"])){
      output = (decimalInput / Decimal.parse('3.098e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.098e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Acres", "Square millimeters"])){
      output = (decimalInput * Decimal.parse('4.047e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 4.047e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ["Acres", "Square centimeters"])){
      output = (decimalInput * Decimal.parse('4.047e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 4.047e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ["Acres", "Square meters"])){
      output = (decimalInput * Decimal.parse('4047')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 4047).toString();
      }
    }
    else if (listEquals(transferUnits, ["Acres", "Hectares"])){
      output = (decimalInput / Decimal.parse('2.471')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.471).toString();
      }
    }
    else if (listEquals(transferUnits, ["Acres", "Square kilometers"])){
      output = (decimalInput / Decimal.parse('247')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 247).toString();
      }
    }
    else if (listEquals(transferUnits, ["Acres", "Square inches"])){
      output = (decimalInput * Decimal.parse('6.273e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 6.273e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Acres", "Square feet"])){
      output = (decimalInput * Decimal.parse('43560')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 43560).toString();
      }
    }
    else if (listEquals(transferUnits, ["Acres", "Square yards"])){
      output = (decimalInput * Decimal.parse('4840')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 4840).toString();
      }
    }
    else if (listEquals(transferUnits, ["Acres", "Square miles"])){
      output = (decimalInput / Decimal.parse('640')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 640).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square miles", "Square millimeters"])){
      output = (decimalInput * Decimal.parse('2.59e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.59e+12).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square miles", "Square centimeters"])){
      output = (decimalInput * Decimal.parse('2.59e+10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.59e+10).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square miles", "Square meters"])){
      output = (decimalInput * Decimal.parse('2.59e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.59e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square miles", "Hectares"])){
      output = (decimalInput * Decimal.parse('259')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 259).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square miles", "Square kilometers"])){
      output = (decimalInput * Decimal.parse('2.59')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.59).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square miles", "Square inches"])){
      output = (decimalInput * Decimal.parse('4.014e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 4.014e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square miles", "Square feet"])){
      output = (decimalInput * Decimal.parse('2.788e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.788e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square miles", "Square yards"])){
      output = (decimalInput * Decimal.parse('3.098e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.098e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ["Square miles", "Acres"])){
      output = (decimalInput * Decimal.parse('640')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 640).toString();
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
    final _scaffoldKey = GlobalKey<ScaffoldState>();

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
        title: Text("Area Calculator", style: TextStyle(fontSize: displayHeight(context) * 0.025, color: Colors.white)),
        ),
      ),
    drawer: AppDrawer(),

    body: Container(
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

              items: ['Square millimeters', 'Square centimeters', 'Square meters', 'Hectares', 'Square kilometers', 'Square inches', 'Square feet', 'Square yards', 'Acres', 'Square miles'].map<DropdownMenuItem<String>>((String value) {
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

              items: ['Square millimeters', 'Square centimeters', 'Square meters', 'Hectares', 'Square kilometers', 'Square inches', 'Square feet', 'Square yards', 'Acres', 'Square miles'].map<DropdownMenuItem<String>>((String value) {
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
      )
    );
  }
}