import 'package:flutter/material.dart';
import 'package:ProCalculator/widgets/CalculatorButton.dart';
import 'package:ProCalculator/widgets/drawer.dart';
import 'package:ProCalculator/sizes_helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:decimal/decimal.dart';
import 'package:ProCalculator/settings.dart';


class LengthCalculatorPage extends StatelessWidget {
  static const String routeName = '/lengthCalculatore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LengthCalculator()
    );
  }
}


class LengthCalculator extends StatefulWidget {
  @override
  _LengthCalculatorState createState() => _LengthCalculatorState();
}

class _LengthCalculatorState extends State<LengthCalculator> {
  String char;
  String dropdownValue1 = 'Meter';
  String dropdownValue2 = 'Centimeter';
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
    double intInput = double.parse(input);

      
    if (transferUnits[0] == transferUnits[1]) {
        output = input.toString();
    }
    else if (listEquals(transferUnits, ['Nanometer', 'Micrometer'])){
      output = (decimalInput/Decimal.parse('100')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 100).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nanometer', 'Millimeter'])){
      output = (decimalInput/Decimal.parse('1e+6')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 1e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nanometer', 'Centimeter'])){
      output = (decimalInput/Decimal.parse('1e+7')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 1e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nanometer', 'Meter'])){
      output = (decimalInput/Decimal.parse('1e+9')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 1e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nanometer', 'Kilometer'])){
      output = (decimalInput/Decimal.parse('1e+12')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 1e+12).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nanometer', 'Inches'])){
      output = (decimalInput/Decimal.parse('2.54e+7')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 2.54e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nanometer', 'Feet'])){
      output = (decimalInput/Decimal.parse('3.048e+8')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 3.048e+8).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nanometer', 'Yards'])){
      output = (decimalInput/Decimal.parse('9.144e+8')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 9.144e+8).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nanometer', 'Miles'])){
      output = (decimalInput/Decimal.parse('1.609e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.609e+12).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nanometer', 'Nautical Miles'])){
      output = (decimalInput/Decimal.parse('1.852e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.852e+12).toString();
      }
    }
    else if (listEquals(transferUnits, ['Micrometer', 'Nanometer'])){
      output = (decimalInput*Decimal.parse('1000')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ['Micrometer', 'Millimeter'])){
      output = (decimalInput/Decimal.parse('1000')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ['Micrometer', 'Centimeter'])){
      output = (decimalInput/Decimal.parse('10000')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 10000).toString();
      }
    }
    else if (listEquals(transferUnits, ['Micrometer', 'Meter'])){
      output = (decimalInput/Decimal.parse('1e+6')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 1e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ['Micrometer', 'Kilometer'])){
      output = (decimalInput/Decimal.parse('1e+9')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 1e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ['Micrometer', 'Inches'])){
      output = (decimalInput/Decimal.parse('25400')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 25400).toString();
      }
    }
    else if (listEquals(transferUnits, ['Micrometer', 'Feet'])){
      output = (decimalInput/Decimal.parse('304800')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 304800).toString();
      }
    }
    else if (listEquals(transferUnits, ['Micrometer', 'Yards'])){
      output = (decimalInput/Decimal.parse('914400')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 914400).toString();
      }
    }
    else if (listEquals(transferUnits, ['Micrometer', 'Miles'])){
      output = (decimalInput/Decimal.parse('1.609e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.609e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ['Micrometer', 'Nautical Miles'])){
      output = (decimalInput/Decimal.parse('1.852e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.852e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ['Millimeter', 'Nanometer'])){
      output = (decimalInput*Decimal.parse('1e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ['Millimeter', 'Micrometer'])){
      output = (decimalInput*Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ['Millimeter', 'Centimeter'])){
      output = (decimalInput/Decimal.parse('10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 10).toString();
      }
    }
    else if (listEquals(transferUnits, ['Millimeter', 'Meter'])){
      output = (decimalInput/Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ['Millimeter', 'Kilometer'])){
      output = (decimalInput/Decimal.parse('1e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ['Millimeter', 'Inches'])){
      output = (decimalInput/Decimal.parse('25.4')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 25.4).toString();
      }
    }
    else if (listEquals(transferUnits, ['Millimeter', 'Feet'])){
      output = (decimalInput/Decimal.parse('305')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 305).toString();
      }
    }
    else if (listEquals(transferUnits, ['Millimeter', 'Yards'])){
      output = (decimalInput/Decimal.parse('914')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 914).toString();
      }
    }
    else if (listEquals(transferUnits, ['Millimeter', 'Miles'])){
      output = (decimalInput/Decimal.parse('1.609e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.609e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ['Millimeter', 'Nautical Miles'])){
      output = (decimalInput/Decimal.parse('1.852e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.852e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ['Centimeter', 'Nanometer'])){
      output = (decimalInput*Decimal.parse('1e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ['Centimeter', 'Micrometer'])){
      output = (decimalInput*Decimal.parse('10000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 10000).toString();
      }
    }
    else if (listEquals(transferUnits, ['Centimeter', 'Millimeter'])){
      output = (decimalInput*Decimal.parse('10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 10).toString();
      }
    }
    else if (listEquals(transferUnits, ['Centimeter', 'Meter'])){
      output = (decimalInput/Decimal.parse('100')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 100).toString();
      }
    }
    else if (listEquals(transferUnits, ['Centimeter', 'Kilometer'])){
      output = (decimalInput/Decimal.parse('100000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 100000).toString();
      }
    }
    else if (listEquals(transferUnits, ['Centimeter', 'Inches'])){
      output = (decimalInput/Decimal.parse('2.54')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.54).toString();
      }
    }
    else if (listEquals(transferUnits, ['Centimeter', 'Feet'])){
      output = (decimalInput/Decimal.parse('30.48')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 30.48).toString();
      }
    }
    else if (listEquals(transferUnits, ['Centimeter', 'Yards'])){
      output = (decimalInput/Decimal.parse('91.44')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 91.44).toString();
      }
    }
    else if (listEquals(transferUnits, ['Centimeter', 'Miles'])){
      output = (decimalInput/Decimal.parse('160934')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 160934).toString();
      }
    }
    else if (listEquals(transferUnits, ['Centimeter', 'Nautical Miles'])){
      output = (decimalInput/Decimal.parse('185200')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 185200).toString();
      }
    }
    else if (listEquals(transferUnits, ['Meter', 'Nanometer'])){
      output = (decimalInput*Decimal.parse('1e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ['Meter', 'Micrometer'])){
      output = (decimalInput*Decimal.parse('1e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ['Meter', 'Millimeter'])){
      output = (decimalInput*Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ['Meter', 'Centimeter'])){
      output = (decimalInput*Decimal.parse('100')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 100).toString();
      }
    }
    else if (listEquals(transferUnits, ['Meter', 'Kilometer'])){
      output = (decimalInput/Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ['Meter', 'Inches'])){
      output = (decimalInput*Decimal.parse('39.37')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 39.37).toString();
      }
    }
    else if (listEquals(transferUnits, ['Meter', 'Feet'])){
      output = (decimalInput*Decimal.parse('3.281')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.281).toString();
      }
    }
    else if (listEquals(transferUnits, ['Meter', 'Yards'])){
      output = (decimalInput*Decimal.parse('1.094')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1.094).toString();
      }
    }
    else if (listEquals(transferUnits, ['Meter', 'Miles'])){
      output = (decimalInput/Decimal.parse('1609')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1609).toString();
      }
    }
    else if (listEquals(transferUnits, ['Meter', 'Nautical Miles'])){
      output = (decimalInput/Decimal.parse('1852')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1852).toString();
      }
    }
    else if (listEquals(transferUnits, ['Kilometer', 'Nanometer'])){
      output = (decimalInput*Decimal.parse('1e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+12).toString();
      }
    }
    else if (listEquals(transferUnits, ['Kilometer', 'Micrometer'])){
      output = (decimalInput*Decimal.parse('1e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ['Kilometer', 'Millimeter'])){
      output = (decimalInput*Decimal.parse('1e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ['Kilometer', 'Centimeter'])){
      output = (decimalInput*Decimal.parse('100000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 100000).toString();
      }
    }
    else if (listEquals(transferUnits, ['Kilometer', 'Meter'])){
      output = (decimalInput*Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1000).toString();
      }
    }
    else if (listEquals(transferUnits, ['Kilometer', 'Inches'])){
      output = (decimalInput*Decimal.parse('39370')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 39370).toString();
      }
    }
    else if (listEquals(transferUnits, ['Kilometer', 'Feet'])){
      output = (decimalInput*Decimal.parse('3281')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3281).toString();
      }
    }
    else if (listEquals(transferUnits, ['Kilometer', 'Yards'])){
      output = (decimalInput*Decimal.parse('1094')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1094).toString();
      }
    }
    else if (listEquals(transferUnits, ['Kilometer', 'Miles'])){
      output = (decimalInput/Decimal.parse('1.609')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.609).toString();
      }
    }
    else if (listEquals(transferUnits, ['Kilometer', 'Nautical Miles'])){
      output = (decimalInput/Decimal.parse('1.852')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.852).toString();
      }
    }
    else if (listEquals(transferUnits, ['Inches', 'Nanometer'])){
      output = (decimalInput*Decimal.parse('2.54e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.54e+7).toString();
      }
    }
    else if (listEquals(transferUnits, ['Inches', 'Micrometer'])){
      output = (decimalInput*Decimal.parse('25400')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 25400).toString();
      }
    }
    else if (listEquals(transferUnits, ['Inches', 'Millimeter'])){
      output = (decimalInput*Decimal.parse('25.4')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 25.4).toString();
      }
    }
    else if (listEquals(transferUnits, ['Inches', 'Centimeter'])){
      output = (decimalInput*Decimal.parse('2.54')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.54).toString();
      }
    }
    else if (listEquals(transferUnits, ['Inches', 'Meter'])){
      output = (decimalInput/Decimal.parse('39.37')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 39.37).toString();
      }
    }
    else if (listEquals(transferUnits, ['Inches', 'Kilometer'])){
      output = (decimalInput/Decimal.parse('39370')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 39370).toString();
      }
    }
    else if (listEquals(transferUnits, ['Inches', 'Feet'])){
      output = (decimalInput/Decimal.parse('12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 12).toString();
      }
    }
    else if (listEquals(transferUnits, ['Inches', 'Yards'])){
      output = (decimalInput/Decimal.parse('36')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 36).toString();
      }
    }
    else if (listEquals(transferUnits, ['Inches', 'Miles'])){
      output = (decimalInput/Decimal.parse('63360')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 63360).toString();
      }
    }
    else if (listEquals(transferUnits, ['Inches', 'Nautical Miles'])){
      output = (decimalInput/Decimal.parse('72913')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 72913).toString();
      }
    }
    else if (listEquals(transferUnits, ['Feet', 'Nanometer'])){
      output = (decimalInput*Decimal.parse('3.048e+8')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.048e+8).toString();
      }
    }
    else if (listEquals(transferUnits, ['Feet', 'Micrometer'])){
      output = (decimalInput*Decimal.parse('304800')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 304800).toString();
      }
    }
    else if (listEquals(transferUnits, ['Feet', 'Millimeter'])){
      output = (decimalInput*Decimal.parse('305')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 305).toString();
      }
    }
    else if (listEquals(transferUnits, ['Feet', 'Centimeter'])){
      output = (decimalInput*Decimal.parse('30.48')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 30.48).toString();
      }
    }
    else if (listEquals(transferUnits, ['Feet', 'Meter'])){
      output = (decimalInput/Decimal.parse('3.281')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.281).toString();
      }
    }
    else if (listEquals(transferUnits, ['Feet', 'Kilometer'])){
      output = (decimalInput/Decimal.parse('30.48')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3281).toString();
      }
    }
    else if (listEquals(transferUnits, ['Feet', 'Inches'])){
      output = (decimalInput*Decimal.parse('12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 12).toString();
      }
    }
    else if (listEquals(transferUnits, ['Feet', 'Yards'])){
      output = (decimalInput/Decimal.parse('3')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3).toString();
      }
    }
    else if (listEquals(transferUnits, ['Feet', 'Miles'])){
      output = (decimalInput/Decimal.parse('5280')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 5280).toString();
      }
    }
    else if (listEquals(transferUnits, ['Feet', 'Nautical Miles'])){
      output = (decimalInput/Decimal.parse('6076')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 6076).toString();
      }
    }
    else if (listEquals(transferUnits, ['Yards', 'Nanometer'])){
      output = (decimalInput*Decimal.parse('9.144e+8')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 9.144e+8).toString();
      }
    }
    else if (listEquals(transferUnits, ['Yards', 'Micrometer'])){
      output = (decimalInput*Decimal.parse('914400')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 914400).toString();
      }
    }
    else if (listEquals(transferUnits, ['Yards', 'Millimeter'])){
      output = (decimalInput*Decimal.parse('914')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 914).toString();
      }
    }
    else if (listEquals(transferUnits, ['Yards', 'Centimeter'])){
      output = (decimalInput*Decimal.parse('91.44')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 91.44).toString();
      }
    }
    else if (listEquals(transferUnits, ['Yards', 'Meter'])){
      output = (decimalInput/Decimal.parse('1.094')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1.094).toString();
      }
    }
    else if (listEquals(transferUnits, ['Yards', 'Kilometer'])){
      output = (decimalInput/Decimal.parse('1094')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1094).toString();
      }
    }
    else if (listEquals(transferUnits, ['Yards', 'Inches'])){
      output = (decimalInput*Decimal.parse('36')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 36).toString();
      }
    }
    else if (listEquals(transferUnits, ['Yards', 'Feet'])){
      output = (decimalInput*Decimal.parse('3')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3).toString();
      }
    }
    else if (listEquals(transferUnits, ['Yards', 'Miles'])){
      output = (decimalInput/Decimal.parse('1760')).toString(); 
      if (output == '0' && input != '0'){
        output = (intInput / 1760).toString();
      }
    }
    else if (listEquals(transferUnits, ['Yards', 'Nautical Miles'])){
      output = (decimalInput/Decimal.parse('2025')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 2025).toString();
      }
    }
    else if (listEquals(transferUnits, ['Miles', 'Nanometer'])){
      output = (decimalInput*Decimal.parse('1.609e+12')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1.609e+12).toString();
      }
    }
    else if (listEquals(transferUnits, ['Miles', 'Micrometer'])){
      output = (decimalInput*Decimal.parse('1.609e+9')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1.609e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ['Miles', 'Millimeter'])){
      output = (decimalInput*Decimal.parse('1.609e+6')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1.609e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ['Miles', 'Centimeter'])){
      output = (decimalInput*Decimal.parse('160934')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 160934).toString();
      }
    }
    else if (listEquals(transferUnits, ['Miles', 'Meter'])){
      output = (decimalInput*Decimal.parse('1609')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1609).toString();
      }
    }
    else if (listEquals(transferUnits, ['Miles', 'Kilometer'])){
      output = (decimalInput*Decimal.parse('1.609')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1.609).toString();
      }
    }
    else if (listEquals(transferUnits, ['Miles', 'Inches'])){
      output = (decimalInput*Decimal.parse('63360')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 63360).toString();
      }
    }
    else if (listEquals(transferUnits, ['Miles', 'Feet'])){
      output = (decimalInput*Decimal.parse('5280')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 5280).toString();
      }
    }
    else if (listEquals(transferUnits, ['Miles', 'Yards'])){
      output = (decimalInput*Decimal.parse('1760')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1760).toString();
      }
    }
    else if (listEquals(transferUnits, ['Miles', 'Nautical Miles'])){
      output = (decimalInput/Decimal.parse('1.151')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput / 1.151).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nautical Miles', 'Nanometer'])){
      output = (decimalInput*Decimal.parse('1.852e+12')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1.852e+12).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nautical Miles', 'Micrometer'])){
      output = (decimalInput*Decimal.parse('1.852e+9')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1.852e+9).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nautical Miles', 'Millimeter'])){
      output = (decimalInput*Decimal.parse('1.852e+6')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1.852e+6).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nautical Miles', 'Centimeter'])){
      output = (decimalInput*Decimal.parse('185200')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 185200).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nautical Miles', 'Meter'])){
      output = (decimalInput*Decimal.parse('1852')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1852).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nautical Miles', 'Kilometer'])){
      output = (decimalInput*Decimal.parse('1.852')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1.852).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nautical Miles', 'Inches'])){
      output = (decimalInput*Decimal.parse('72913')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 72913).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nautical Miles', 'Feet'])){
      output = (decimalInput*Decimal.parse('6076')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 6076).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nautical Miles', 'Yards'])){
      output = (decimalInput*Decimal.parse('2025')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 2025).toString();
      }
    }
    else if (listEquals(transferUnits, ['Nautical Miles', 'Miles'])){
      output = (decimalInput*Decimal.parse('1.151')).toString();      
      if (output == '0' && input != '0'){
        output = (intInput * 1.151).toString();
      }
    }

    print(output);
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
    double verticalPadding = displayWidth(context) * 0.0505688821;
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
        title: Text("Length Calculator", style: TextStyle(fontSize: displayHeight(context) * 0.025, color: Colors.white)),
        ),
      ),
    drawer: AppDrawer(),

    body:  Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Opacity(
            opacity: 0.0,
            child: Divider(height: displayHeight(context) * 0.04)),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.02),
            child: TextFormField(
              controller: myController1,
              readOnly: true,
              showCursor: true,
              textAlign: TextAlign.end,
              cursorWidth: 0,
              style: TextStyle(
              fontSize: outputTextSize, fontWeight: fontWeight1),
              onTap: () => onTap(textField1),
              decoration: InputDecoration(
                border: InputBorder.none, 
                ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: displayWidth(context) * 0.03),
            child: DropdownButton(
              value: dropdownValue1,
              style: TextStyle(color: GC.globalColor, fontWeight: FontWeight.w500, fontSize: displayHeight(context) * 0.018),
              elevation: 16,
              underline: Opacity(opacity: 0),
              onChanged: (newValue) => {onChange('dropdownValue1', newValue)},

              items: ['Nanometer','Micrometer','Millimeter', 'Centimeter', 'Meter', 'Kilometer', 'Inches', 'Feet', 'Yards', 'Miles', 'Nautical Miles'].map<DropdownMenuItem<String>>((String value) {
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
              onTap: () => onTap(textField2),
              showCursor: true,
              cursorWidth: 0,
              textAlign: TextAlign.end,
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
              style: TextStyle(color: GC.globalColor, fontWeight: FontWeight.w500, fontSize: displayHeight(context) * 0.018),
              elevation: 16,
              underline: Opacity(opacity: 0),
              onChanged: (newValue) => {onChange('dropdownValue2', newValue)},

              items: ['Nanometer','Micrometer','Millimeter', 'Centimeter', 'Meter', 'Kilometer', 'Inches', 'Feet', 'Yards', 'Miles', 'Nautical Miles'].map<DropdownMenuItem<String>>((String value) {
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