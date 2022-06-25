import 'package:flutter/material.dart';
import 'package:ProCalculator/widgets/CalculatorButton.dart';
import 'package:ProCalculator/widgets/drawer.dart';
import 'package:ProCalculator/sizes_helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:decimal/decimal.dart';
import 'package:ProCalculator/settings.dart';


class WeightCalculatorPage extends StatelessWidget {
  static const String routeName = '/weightCalculator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WeightCalculator()
    );
  }
}


class WeightCalculator extends StatefulWidget {
  @override
  _WeightCalculatorState createState() => _WeightCalculatorState();
}

class _WeightCalculatorState extends State<WeightCalculator> {
  String char;
  String dropdownValue1 = 'Kilograms';
  String dropdownValue2 = 'Pounds';
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
    else if (listEquals(transferUnits, ["Carats", "Milligrams"])){
      output = (decimalInput * Decimal.parse('200')).toString();
    }
    else if (listEquals(transferUnits, ["Carats", "Centigrams"])){
      output = (decimalInput * Decimal.parse('20')).toString();
    }
    else if (listEquals(transferUnits, ["Carats", "Decigrams"])){
      output = (decimalInput * Decimal.parse('2')).toString();
    }
    else if (listEquals(transferUnits, ["Carats", "Grams"])){
      output = (decimalInput / Decimal.parse('5')).toString();
    }
    else if (listEquals(transferUnits, ["Carats", "Decagrams"])){
      output = (decimalInput / Decimal.parse('50')).toString();
    }
    else if (listEquals(transferUnits, ["Carats", "Hectograms"])){
      output = (decimalInput / Decimal.parse('500')).toString();
    }
    else if (listEquals(transferUnits, ["Carats", "Kilograms"])){
      output = (decimalInput / Decimal.parse('5000')).toString();
    }
    else if (listEquals(transferUnits, ["Carats", "Ounces"])){
      output = (decimalInput / Decimal.parse('142')).toString();
    }
    else if (listEquals(transferUnits, ["Carats", "Pounds"])){
      output = (decimalInput / Decimal.parse('2268')).toString();
    }
    else if (listEquals(transferUnits, ["Carats", "Stone"])){
      output = (decimalInput / Decimal.parse('31751')).toString();
    }
    else if (listEquals(transferUnits, ["Carats", "US ton"])){
      output = (decimalInput / Decimal.parse('4.536e+6')).toString();
    }
    else if (listEquals(transferUnits, ["Carats", "Imperial ton"])){
      output = (decimalInput / Decimal.parse('5.08e+6')).toString();
    }
    else if (listEquals(transferUnits, ["Milligrams", "Carats"])){
      output = (decimalInput / Decimal.parse('200')).toString();
    }
    else if (listEquals(transferUnits, ["Milligrams", "Centigrams"])){
      output = (decimalInput / Decimal.parse('10')).toString();
    }
    else if (listEquals(transferUnits, ["Milligrams", "Decigrams"])){
      output = (decimalInput / Decimal.parse('100')).toString();
    }
    else if (listEquals(transferUnits, ["Milligrams", "Grams"])){
      output = (decimalInput / Decimal.parse('1000')).toString();
    }
    else if (listEquals(transferUnits, ["Milligrams", "Decagrams"])){
      output = (decimalInput / Decimal.parse('10000')).toString();
    }
    else if (listEquals(transferUnits, ["Milligrams", "Hectograms"])){
      output = (decimalInput / Decimal.parse('100000')).toString();
    }
    else if (listEquals(transferUnits, ["Milligrams", "Kilograms"])){
      output = (decimalInput / Decimal.parse('1e+6')).toString();
    }
    else if (listEquals(transferUnits, ["Milligrams", "Ounces"])){
      output = (decimalInput / Decimal.parse('28350')).toString();
    }
    else if (listEquals(transferUnits, ["Milligrams", "Pounds"])){
      output = (decimalInput / Decimal.parse('453592')).toString();
    }
    else if (listEquals(transferUnits, ["Milligrams", "Stone"])){
      output = (decimalInput / Decimal.parse('6.35e+6')).toString();
    }
    else if (listEquals(transferUnits, ["Milligrams", "US ton"])){
      output = (decimalInput / Decimal.parse('9.072e+8')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 9.072e+8).toString();
      }
    }
    else if (listEquals(transferUnits, ["Milligrams", "Imperial ton"])){
      output = (decimalInput / Decimal.parse('1.016e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.016e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ["Centigrams", "Carats"])){
      output = (decimalInput / Decimal.parse('20')).toString();
    }
    else if (listEquals(transferUnits, ["Centigrams", "Milligrams"])){
      output = (decimalInput * Decimal.parse('10')).toString();
    }
    else if (listEquals(transferUnits, ["Centigrams", "Decigrams"])){
      output = (decimalInput / Decimal.parse('10')).toString();
    }
    else if (listEquals(transferUnits, ["Centigrams", "Grams"])){
      output = (decimalInput / Decimal.parse('100')).toString();
    }
    else if (listEquals(transferUnits, ["Centigrams", "Decagrams"])){
      output = (decimalInput / Decimal.parse('1000')).toString();
    }
    else if (listEquals(transferUnits, ["Centigrams", "Hectograms"])){
      output = (decimalInput / Decimal.parse('10000')).toString();
    }
    else if (listEquals(transferUnits, ["Centigrams", "Kilograms"])){
      output = (decimalInput / Decimal.parse('100000')).toString();
    }
    else if (listEquals(transferUnits, ["Centigrams", "Ounces"])){
      output = (decimalInput / Decimal.parse('2835')).toString();
    }
    else if (listEquals(transferUnits, ["Centigrams", "Pounds"])){
      output = (decimalInput / Decimal.parse('45359')).toString();
    }
    else if (listEquals(transferUnits, ["Centigrams", "Stone"])){
      output = (decimalInput / Decimal.parse('635029')).toString();
    }
    else if (listEquals(transferUnits, ["Centigrams", "US ton"])){
      output = (decimalInput / Decimal.parse('9.072e+7')).toString();
    }
    else if (listEquals(transferUnits, ["Centigrams", "Imperial ton"])){
      output = (decimalInput / Decimal.parse('1.016e+8')).toString();
    }
    else if (listEquals(transferUnits, ["Decigrams", "Carats"])){
      output = (decimalInput / Decimal.parse('2')).toString();
    }
    else if (listEquals(transferUnits, ["Decigrams", "Milligrams"])){
      output = (decimalInput * Decimal.parse('100')).toString();
    }
    else if (listEquals(transferUnits, ["Decigrams", "Centigrams"])){
      output = (decimalInput * Decimal.parse('10')).toString();
    }
    else if (listEquals(transferUnits, ["Decigrams", "Grams"])){
      output = (decimalInput / Decimal.parse('10')).toString();
    }
    else if (listEquals(transferUnits, ["Decigrams", "Decagrams"])){
      output = (decimalInput / Decimal.parse('100')).toString();
    }
    else if (listEquals(transferUnits, ["Decigrams", "Hectograms"])){
      output = (decimalInput / Decimal.parse('1000')).toString();
    }
    else if (listEquals(transferUnits, ["Decigrams", "Kilograms"])){
      output = (decimalInput / Decimal.parse('10000')).toString();
    }
    else if (listEquals(transferUnits, ["Decigrams", "Ounces"])){
      output = (decimalInput / Decimal.parse('283')).toString();
    }
    else if (listEquals(transferUnits, ["Decigrams", "Pounds"])){
      output = (decimalInput / Decimal.parse('4536')).toString();
    }
    else if (listEquals(transferUnits, ["Decigrams", "Stone"])){
      output = (decimalInput / Decimal.parse('63503')).toString();
    }
    else if (listEquals(transferUnits, ["Decigrams", "US ton"])){
      output = (decimalInput / Decimal.parse('9.072e+6')).toString();
    }
    else if (listEquals(transferUnits, ["Decigrams", "Imperial ton"])){
      output = (decimalInput / Decimal.parse('1.016e+7')).toString();
    }
    else if (listEquals(transferUnits, ["Grams", "Carats"])){
      output = (decimalInput * Decimal.parse('5')).toString();
    }
    else if (listEquals(transferUnits, ["Grams", "Milligrams"])){
      output = (decimalInput * Decimal.parse('1000')).toString();
    }
    else if (listEquals(transferUnits, ["Grams", "Centigrams"])){
      output = (decimalInput * Decimal.parse('100')).toString();
    }
    else if (listEquals(transferUnits, ["Grams", "Decigrams"])){
      output = (decimalInput * Decimal.parse('10')).toString();
    }
    else if (listEquals(transferUnits, ["Grams", "Decagrams"])){
      output = (decimalInput / Decimal.parse('10')).toString();
    }
    else if (listEquals(transferUnits, ["Grams", "Hectograms"])){
      output = (decimalInput / Decimal.parse('100')).toString();
    }
    else if (listEquals(transferUnits, ["Grams", "Kilograms"])){
      output = (decimalInput / Decimal.parse('1000')).toString();
    }
    else if (listEquals(transferUnits, ["Grams", "Ounces"])){
      output = (decimalInput / Decimal.parse('28.35')).toString();
    }
    else if (listEquals(transferUnits, ["Grams", "Pounds"])){
      output = (decimalInput / Decimal.parse('454')).toString();
    }
    else if (listEquals(transferUnits, ["Grams", "Stone"])){
      output = (decimalInput / Decimal.parse('6350')).toString();
    }
    else if (listEquals(transferUnits, ["Grams", "US ton"])){
      output = (decimalInput / Decimal.parse('907185')).toString();
    }
    else if (listEquals(transferUnits, ["Grams", "Imperial ton"])){
      output = (decimalInput / Decimal.parse('1.016e+6')).toString();
    }
    else if (listEquals(transferUnits, ["Decagrams", "Carats"])){
      output = (decimalInput * Decimal.parse('50')).toString();
    }
    else if (listEquals(transferUnits, ["Decagrams", "Milligrams"])){
      output = (decimalInput * Decimal.parse('10000')).toString();
    }
    else if (listEquals(transferUnits, ["Decagrams", "Centigrams"])){
      output = (decimalInput * Decimal.parse('1000')).toString();
    }
    else if (listEquals(transferUnits, ["Decagrams", "Decigrams"])){
      output = (decimalInput * Decimal.parse('100')).toString();
    }
    else if (listEquals(transferUnits, ["Decagrams", "Grams"])){
      output = (decimalInput * Decimal.parse('10')).toString();
    }
    else if (listEquals(transferUnits, ["Decagrams", "Hectograms"])){
      output = (decimalInput / Decimal.parse('10')).toString();
    }
    else if (listEquals(transferUnits, ["Decagrams", "Kilograms"])){
      output = (decimalInput / Decimal.parse('100')).toString();
    }
    else if (listEquals(transferUnits, ["Decagrams", "Ounces"])){
      output = (decimalInput / Decimal.parse('2.835')).toString();
    }
    else if (listEquals(transferUnits, ["Decagrams", "Pounds"])){
      output = (decimalInput / Decimal.parse('45.359')).toString();
    }
    else if (listEquals(transferUnits, ["Decagrams", "Stone"])){
      output = (decimalInput / Decimal.parse('635')).toString();
    }
    else if (listEquals(transferUnits, ["Decagrams", "US ton"])){
      output = (decimalInput / Decimal.parse('90718')).toString();
    }
    else if (listEquals(transferUnits, ["Decagrams", "Imperial ton"])){
      output = (decimalInput / Decimal.parse('101605')).toString();
    }
    else if (listEquals(transferUnits, ["Hectograms", "Carats"])){
      output = (decimalInput * Decimal.parse('500')).toString();
    }
    else if (listEquals(transferUnits, ["Hectograms", "Milligrams"])){
      output = (decimalInput * Decimal.parse('100000')).toString();
    }
    else if (listEquals(transferUnits, ["Hectograms", "Centigrams"])){
      output = (decimalInput * Decimal.parse('10000')).toString();
    }
    else if (listEquals(transferUnits, ["Hectograms", "Decigrams"])){
      output = (decimalInput * Decimal.parse('1000')).toString();
    }
    else if (listEquals(transferUnits, ["Hectograms", "Grams"])){
      output = (decimalInput * Decimal.parse('100')).toString();
    }
    else if (listEquals(transferUnits, ["Hectograms", "Decagrams"])){
      output = (decimalInput * Decimal.parse('10')).toString();
    }
    else if (listEquals(transferUnits, ["Hectograms", "Kilograms"])){
      output = (decimalInput / Decimal.parse('10')).toString();
    }
    else if (listEquals(transferUnits, ["Hectograms", "Ounces"])){
      output = (decimalInput * Decimal.parse('3.527')).toString();
    }
    else if (listEquals(transferUnits, ["Hectograms", "Pounds"])){
      output = (decimalInput / Decimal.parse('4.536')).toString();
    }
    else if (listEquals(transferUnits, ["Hectograms", "Stone"])){
      output = (decimalInput / Decimal.parse('63.503')).toString();
    }
    else if (listEquals(transferUnits, ["Hectograms", "US ton"])){
      output = (decimalInput / Decimal.parse('9072')).toString();
    }
    else if (listEquals(transferUnits, ["Hectograms", "Imperial ton"])){
      output = (decimalInput / Decimal.parse('10160')).toString();
    }
    else if (listEquals(transferUnits, ["Kilograms", "Carats"])){
      output = (decimalInput * Decimal.parse('5000')).toString();
    }
    else if (listEquals(transferUnits, ["Kilograms", "Milligrams"])){
      output = (decimalInput * Decimal.parse('1e+6')).toString();
    }
    else if (listEquals(transferUnits, ["Kilograms", "Centigrams"])){
      output = (decimalInput * Decimal.parse('100000')).toString();
    }
    else if (listEquals(transferUnits, ["Kilograms", "Decigrams"])){
      output = (decimalInput * Decimal.parse('10000')).toString();
    }
    else if (listEquals(transferUnits, ["Kilograms", "Grams"])){
      output = (decimalInput * Decimal.parse('1000')).toString();
    }
    else if (listEquals(transferUnits, ["Kilograms", "Decagrams"])){
      output = (decimalInput * Decimal.parse('100')).toString();
    }
    else if (listEquals(transferUnits, ["Kilograms", "Hectograms"])){
      output = (decimalInput * Decimal.parse('10')).toString();
    }
    else if (listEquals(transferUnits, ["Kilograms", "Ounces"])){
      output = (decimalInput * Decimal.parse('35.274')).toString();
    }
    else if (listEquals(transferUnits, ["Kilograms", "Pounds"])){
      output = (decimalInput * Decimal.parse('2.205')).toString();
    }
    else if (listEquals(transferUnits, ["Kilograms", "Stone"])){
      output = (decimalInput / Decimal.parse('6.35')).toString();
    }
    else if (listEquals(transferUnits, ["Kilograms", "US ton"])){
      output = (decimalInput / Decimal.parse('907')).toString();
    }
    else if (listEquals(transferUnits, ["Kilograms", "Imperial ton"])){
      output = (decimalInput / Decimal.parse('1016')).toString();
    }
    else if (listEquals(transferUnits, ["Ounces", "Carats"])){
      output = (decimalInput * Decimal.parse('142')).toString();
    }
    else if (listEquals(transferUnits, ["Ounces", "Milligrams"])){
      output = (decimalInput * Decimal.parse('28350')).toString();
    }
    else if (listEquals(transferUnits, ["Ounces", "Centigrams"])){
      output = (decimalInput * Decimal.parse('2835')).toString();
    }
    else if (listEquals(transferUnits, ["Ounces", "Decigrams"])){
      output = (decimalInput * Decimal.parse('283')).toString();
    }
    else if (listEquals(transferUnits, ["Ounces", "Grams"])){
      output = (decimalInput * Decimal.parse('28.35')).toString();
    }
    else if (listEquals(transferUnits, ["Ounces", "Decagrams"])){
      output = (decimalInput * Decimal.parse('2.835')).toString();
    }
    else if (listEquals(transferUnits, ["Ounces", "Hectograms"])){
      output = (decimalInput / Decimal.parse('3.527')).toString();
    }
    else if (listEquals(transferUnits, ["Ounces", "Kilograms"])){
      output = (decimalInput / Decimal.parse('35.274')).toString();
    }
    else if (listEquals(transferUnits, ["Ounces", "Pounds"])){
      output = (decimalInput / Decimal.parse('16')).toString();
    }
    else if (listEquals(transferUnits, ["Ounces", "Stone"])){
      output = (decimalInput / Decimal.parse('224')).toString();
    }
    else if (listEquals(transferUnits, ["Ounces", "US ton"])){
      output = (decimalInput / Decimal.parse('32000')).toString();
    }
    else if (listEquals(transferUnits, ["Ounces", "Imperial ton"])){
      output = (decimalInput / Decimal.parse('35840')).toString();
    }
    else if (listEquals(transferUnits, ["Pounds", "Carats"])){
      output = (decimalInput * Decimal.parse('2268')).toString();
    }
    else if (listEquals(transferUnits, ["Pounds", "Milligrams"])){
      output = (decimalInput * Decimal.parse('453592')).toString();
    }
    else if (listEquals(transferUnits, ["Pounds", "Centigrams"])){
      output = (decimalInput * Decimal.parse('45359')).toString();
    }
    else if (listEquals(transferUnits, ["Pounds", "Decigrams"])){
      output = (decimalInput * Decimal.parse('4536')).toString();
    }
    else if (listEquals(transferUnits, ["Pounds", "Grams"])){
      output = (decimalInput * Decimal.parse('454')).toString();
    }
    else if (listEquals(transferUnits, ["Pounds", "Decagrams"])){
      output = (decimalInput * Decimal.parse('45.359')).toString();
    }
    else if (listEquals(transferUnits, ["Pounds", "Hectograms"])){
      output = (decimalInput * Decimal.parse('4.536')).toString();
    }
    else if (listEquals(transferUnits, ["Pounds", "Kilograms"])){
      output = (decimalInput / Decimal.parse('2.205')).toString();
    }
    else if (listEquals(transferUnits, ["Pounds", "Ounces"])){
      output = (decimalInput * Decimal.parse('16')).toString();
    }
    else if (listEquals(transferUnits, ["Pounds", "Stone"])){
      output = (decimalInput / Decimal.parse('14')).toString();
    }
    else if (listEquals(transferUnits, ["Pounds", "US ton"])){
      output = (decimalInput / Decimal.parse('2000')).toString();
    }
    else if (listEquals(transferUnits, ["Pounds", "Imperial ton"])){
      output = (decimalInput / Decimal.parse('2240')).toString();
    }
    else if (listEquals(transferUnits, ["Stone", "Carats"])){
      output = (decimalInput * Decimal.parse('31751')).toString();
    }
    else if (listEquals(transferUnits, ["Stone", "Milligrams"])){
      output = (decimalInput * Decimal.parse('6.35e+6')).toString();
    }
    else if (listEquals(transferUnits, ["Stone", "Centigrams"])){
      output = (decimalInput * Decimal.parse('635029')).toString();
    }
    else if (listEquals(transferUnits, ["Stone", "Decigrams"])){
      output = (decimalInput * Decimal.parse('63503')).toString();
    }
    else if (listEquals(transferUnits, ["Stone", "Grams"])){
      output = (decimalInput * Decimal.parse('6350')).toString();
    }
    else if (listEquals(transferUnits, ["Stone", "Decagrams"])){
      output = (decimalInput * Decimal.parse('635')).toString();
    }
    else if (listEquals(transferUnits, ["Stone", "Hectograms"])){
      output = (decimalInput * Decimal.parse('63.503')).toString();
    }
    else if (listEquals(transferUnits, ["Stone", "Kilograms"])){
      output = (decimalInput * Decimal.parse('6.35')).toString();
    }
    else if (listEquals(transferUnits, ["Stone", "Ounces"])){
      output = (decimalInput * Decimal.parse('224')).toString();
    }
    else if (listEquals(transferUnits, ["Stone", "Pounds"])){
      output = (decimalInput * Decimal.parse('14')).toString();
    }
    else if (listEquals(transferUnits, ["Stone", "US ton"])){
      output = (decimalInput / Decimal.parse('143')).toString();
    }
    else if (listEquals(transferUnits, ["Stone", "Imperial ton"])){
      output = (decimalInput / Decimal.parse('160')).toString();
    }
    else if (listEquals(transferUnits, ["US ton", "Carats"])){
      output = (decimalInput * Decimal.parse('4.536e+6')).toString();
    }
    else if (listEquals(transferUnits, ["US ton", "Milligrams"])){
      output = (decimalInput * Decimal.parse('9.072e+8')).toString();
    }
    else if (listEquals(transferUnits, ["US ton", "Centigrams"])){
      output = (decimalInput * Decimal.parse('9.072e+7')).toString();
    }
    else if (listEquals(transferUnits, ["US ton", "Decigrams"])){
      output = (decimalInput * Decimal.parse('9.072e+6')).toString();
    }
    else if (listEquals(transferUnits, ["US ton", "Grams"])){
      output = (decimalInput * Decimal.parse('907185')).toString();
    }
    else if (listEquals(transferUnits, ["US ton", "Decagrams"])){
      output = (decimalInput * Decimal.parse('90718')).toString();
    }
    else if (listEquals(transferUnits, ["US ton", "Hectograms"])){
      output = (decimalInput * Decimal.parse('9072')).toString();
    }
    else if (listEquals(transferUnits, ["US ton", "Kilograms"])){
      output = (decimalInput * Decimal.parse('907')).toString();
    }
    else if (listEquals(transferUnits, ["US ton", "Ounces"])){
      output = (decimalInput * Decimal.parse('32000')).toString();
    }
    else if (listEquals(transferUnits, ["US ton", "Pounds"])){
      output = (decimalInput * Decimal.parse('2000')).toString();
    }
    else if (listEquals(transferUnits, ["US ton", "Stone"])){
      output = (decimalInput * Decimal.parse('143')).toString();
    }
    else if (listEquals(transferUnits, ["US ton", "Imperial ton"])){
      output = (decimalInput / Decimal.parse('1.12')).toString();
    }
    else if (listEquals(transferUnits, ["Imperial ton", "Carats"])){
      output = (decimalInput * Decimal.parse('5.08e+6')).toString();
    }
    else if (listEquals(transferUnits, ["Imperial ton", "Milligrams"])){
      output = (decimalInput * Decimal.parse('1.016e+9')).toString();
    }
    else if (listEquals(transferUnits, ["Imperial ton", "Centigrams"])){
      output = (decimalInput * Decimal.parse('1.016e+8')).toString();
    }
    else if (listEquals(transferUnits, ["Imperial ton", "Decigrams"])){
      output = (decimalInput * Decimal.parse('1.016e+7')).toString();
    }
    else if (listEquals(transferUnits, ["Imperial ton", "Grams"])){
      output = (decimalInput * Decimal.parse('1.016e+6')).toString();
    }
    else if (listEquals(transferUnits, ["Imperial ton", "Decagrams"])){
      output = (decimalInput * Decimal.parse('101605')).toString();
    }
    else if (listEquals(transferUnits, ["Imperial ton", "Hectograms"])){
      output = (decimalInput * Decimal.parse('10160')).toString();
    }
    else if (listEquals(transferUnits, ["Imperial ton", "Kilograms"])){
      output = (decimalInput * Decimal.parse('1016')).toString();
    }
    else if (listEquals(transferUnits, ["Imperial ton", "Ounces"])){
      output = (decimalInput * Decimal.parse('35840')).toString();
    }
    else if (listEquals(transferUnits, ["Imperial ton", "Pounds"])){
      output = (decimalInput * Decimal.parse('2240')).toString();
    }
    else if (listEquals(transferUnits, ["Imperial ton", "Stone"])){
      output = (decimalInput * Decimal.parse('160')).toString();
    }
    else if (listEquals(transferUnits, ["Imperial ton", "US ton"])){
      output = (decimalInput * Decimal.parse('1.12')).toString();
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
        title: Text("Weight Calculator", style: TextStyle(fontSize: displayHeight(context) * 0.025, color: Colors.white)),
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

              items: ['Carats', 'Milligrams', 'Centigrams', 'Decigrams', 'Grams', 'Decagrams', 'Hectograms', 'Kilograms', 'Ounces', 'Pounds', 'Stone', 'US ton', 'Imperial ton'].map<DropdownMenuItem<String>>((String value) {
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

              items: ['Carats', 'Milligrams', 'Centigrams', 'Decigrams', 'Grams', 'Decagrams', 'Hectograms', 'Kilograms', 'Ounces', 'Pounds', 'Stone', 'US ton', 'Imperial ton'].map<DropdownMenuItem<String>>((String value) {
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