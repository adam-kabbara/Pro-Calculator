import 'package:flutter/material.dart';
import 'package:ProCalculator/widgets/CalculatorButton.dart';
import 'package:ProCalculator/widgets/drawer.dart';
import 'package:ProCalculator/sizes_helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:decimal/decimal.dart';
import 'package:ProCalculator/settings.dart';


class TimeCalculatorPage extends StatelessWidget {
  static const String routeName = '/timeCalculatore';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TimeCalculator()
    );
  }
}


class TimeCalculator extends StatefulWidget {
  @override
  _TimeCalculatorState createState() => _TimeCalculatorState();
}

class _TimeCalculatorState extends State<TimeCalculator> {
  String char;
  String dropdownValue1 = 'Seconds';
  String dropdownValue2 = 'Minutes';
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
    else if (listEquals(transferUnits, ["Nanoseconds", "Microseconds"])){
      output = (decimalInput / Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1000).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Nanoseconds", "Milliseconds"])){
      output = (decimalInput / Decimal.parse('1e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1e+6).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Nanoseconds", "Seconds"])){
      output = (decimalInput / Decimal.parse('1e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1e+9).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Nanoseconds", "Minutes"])){
      output = (decimalInput / Decimal.parse('6e+10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 6e+10).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Nanoseconds", "Hours"])){
      output = (decimalInput / Decimal.parse('3.6e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.6e+12).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Nanoseconds", "Days"])){
      output = (decimalInput / Decimal.parse('8.64e+13')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 8.64e+13).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Nanoseconds", "Weeks"])){
      output = (decimalInput / Decimal.parse('6.048e+14')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 6.048e+14).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Nanoseconds", "Months"])){
      output = (decimalInput / Decimal.parse('2.628e+15')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.628e+15).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Nanoseconds", "Years"])){
      output = (decimalInput / Decimal.parse('3.154e+16')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.154e+16).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Nanoseconds", "Decades"])){
      output = (decimalInput / Decimal.parse('3.154e+17')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.154e+17).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Nanoseconds", "Centuries"])){
      output = (decimalInput / Decimal.parse('3.154e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.154e+18).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Microseconds", "Nanoseconds"])){
      output = (decimalInput * Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1000).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Microseconds", "Milliseconds"])){
      output = (decimalInput / Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1000).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Microseconds", "Seconds"])){
      output = (decimalInput / Decimal.parse('1e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1e+6).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Microseconds", "Minutes"])){
      output = (decimalInput / Decimal.parse('6e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 6e+7).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Microseconds", "Hours"])){
      output = (decimalInput / Decimal.parse('3.6e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.6e+9).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Microseconds", "Days"])){
      output = (decimalInput / Decimal.parse('8.64e+10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 8.64e+10).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Microseconds", "Weeks"])){
      output = (decimalInput / Decimal.parse('6.048e+11')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 6.048e+11).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Microseconds", "Months"])){
      output = (decimalInput / Decimal.parse('2.628e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.628e+12).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Microseconds", "Years"])){
      output = (decimalInput / Decimal.parse('3.154e+13')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.154e+13).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Microseconds", "Decades"])){
      output = (decimalInput / Decimal.parse('3.154e+14')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.154e+14).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Microseconds", "Centuries"])){
      output = (decimalInput / Decimal.parse('3.154e+15')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.154e+15).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Milliseconds", "Nanoseconds"])){
      output = (decimalInput * Decimal.parse('1e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+6).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Milliseconds", "Microseconds"])){
      output = (decimalInput * Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1000).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Milliseconds", "Seconds"])){
      output = (decimalInput / Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1000).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Milliseconds", "Minutes"])){
      output = (decimalInput / Decimal.parse('60000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 60000).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Milliseconds", "Hours"])){
      output = (decimalInput / Decimal.parse('3.6e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.6e+6).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Milliseconds", "Days"])){
      output = (decimalInput / Decimal.parse('8.64e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 8.64e+7).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Milliseconds", "Weeks"])){
      output = (decimalInput / Decimal.parse('6.048e+8')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 6.048e+8).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Milliseconds", "Months"])){
      output = (decimalInput / Decimal.parse('2.628e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.628e+9).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Milliseconds", "Years"])){
      output = (decimalInput / Decimal.parse('3.154e+10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.154e+10).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Milliseconds", "Decades"])){
      output = (decimalInput / Decimal.parse('3.154e+11')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.154e+11).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Milliseconds", "Centuries"])){
      output = (decimalInput / Decimal.parse('3.154e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.154e+12).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Seconds", "Nanoseconds"])){
      output = (decimalInput * Decimal.parse('1e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+9).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Seconds", "Microseconds"])){
      output = (decimalInput * Decimal.parse('1e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1e+6).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Seconds", "Milliseconds"])){
      output = (decimalInput * Decimal.parse('1000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1000).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Seconds", "Minutes"])){
      output = (decimalInput / Decimal.parse('60')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 60).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Seconds", "Hours"])){
      output = (decimalInput / Decimal.parse('3600')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3600).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Seconds", "Days"])){
      output = (decimalInput / Decimal.parse('86400')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 86400).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Seconds", "Weeks"])){
      output = (decimalInput / Decimal.parse('604800')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 604800).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Seconds", "Months"])){
      output = (decimalInput / Decimal.parse('2.628e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 2.628e+6).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Seconds", "Years"])){
      output = (decimalInput / Decimal.parse('3.154e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.154e+7).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Seconds", "Decades"])){
      output = (decimalInput / Decimal.parse('3.154e+8')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.154e+8).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Seconds", "Centuries"])){
      output = (decimalInput / Decimal.parse('3.154e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3.154e+9).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Minutes", "Nanoseconds"])){
      output = (decimalInput * Decimal.parse('6e+10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 6e+10).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Minutes", "Microseconds"])){
      output = (decimalInput * Decimal.parse('6e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 6e+7).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Minutes", "Milliseconds"])){
      output = (decimalInput * Decimal.parse('60000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 60000).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Minutes", "Seconds"])){
      output = (decimalInput * Decimal.parse('60')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 60).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Minutes", "Hours"])){
      output = (decimalInput / Decimal.parse('60')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 60).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Minutes", "Days"])){
      output = (decimalInput / Decimal.parse('1440')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 1440).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Minutes", "Weeks"])){
      output = (decimalInput / Decimal.parse('10080')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 10080).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Minutes", "Months"])){
      output = (decimalInput / Decimal.parse('43800')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 43800).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Minutes", "Years"])){
      output = (decimalInput / Decimal.parse('525600')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 525600).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Minutes", "Decades"])){
      output = (decimalInput / Decimal.parse('5.256e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 5.256e+6).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Minutes", "Centuries"])){
      output = (decimalInput / Decimal.parse('5.256e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 5.256e+7).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Hours", "Nanoseconds"])){
      output = (decimalInput * Decimal.parse('3.6e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.6e+12).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Hours", "Microseconds"])){
      output = (decimalInput * Decimal.parse('3.6e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.6e+9).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Hours", "Milliseconds"])){
      output = (decimalInput * Decimal.parse('3.6e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.6e+6).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Hours", "Seconds"])){
      output = (decimalInput * Decimal.parse('3600')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3600).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Hours", "Minutes"])){
      output = (decimalInput * Decimal.parse('60')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 60).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Hours", "Days"])){
      output = (decimalInput / Decimal.parse('24')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 24).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Hours", "Weeks"])){
      output = (decimalInput / Decimal.parse('168')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 168).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Hours", "Months"])){
      output = (decimalInput / Decimal.parse('730')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 730).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Hours", "Years"])){
      output = (decimalInput / Decimal.parse('8760')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 8760).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Hours", "Decades"])){
      output = (decimalInput / Decimal.parse('87600')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 87600).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Hours", "Centuries"])){
      output = (decimalInput / Decimal.parse('3650')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3650).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Days", "Nanoseconds"])){
      output = (decimalInput * Decimal.parse('8.64e+13')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 8.64e+13).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Days", "Microseconds"])){
      output = (decimalInput * Decimal.parse('8.64e+10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 8.64e+10).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Days", "Milliseconds"])){
      output = (decimalInput * Decimal.parse('8.64e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 8.64e+7).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Days", "Seconds"])){
      output = (decimalInput * Decimal.parse('86400')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 86400).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Days", "Minutes"])){
      output = (decimalInput * Decimal.parse('1440')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1440).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Days", "Hours"])){
      output = (decimalInput * Decimal.parse('24')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 24).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Days", "Weeks"])){
      output = (decimalInput / Decimal.parse('7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 7).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Days", "Months"])){
      output = (decimalInput / Decimal.parse('30.417')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 30.417).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Days", "Years"])){
      output = (decimalInput / Decimal.parse('365')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 365).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Days", "Decades"])){
      output = (decimalInput / Decimal.parse('3650')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 3650).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Days", "Centuries"])){
      output = (decimalInput / Decimal.parse('36500')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 36500).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Weeks", "Nanoseconds"])){
      output = (decimalInput * Decimal.parse('6.048e+14')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 6.048e+14).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Weeks", "Microseconds"])){
      output = (decimalInput * Decimal.parse('6.048e+11')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 6.048e+11).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Weeks", "Milliseconds"])){
      output = (decimalInput * Decimal.parse('6.048e+8')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 6.048e+8).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Weeks", "Seconds"])){
      output = (decimalInput * Decimal.parse('604800')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 604800).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Weeks", "Minutes"])){
      output = (decimalInput * Decimal.parse('10080')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 10080).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Weeks", "Hours"])){
      output = (decimalInput * Decimal.parse('168')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 168).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Weeks", "Days"])){
      output = (decimalInput * Decimal.parse('7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 7).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Weeks", "Months"])){
      output = (decimalInput * Decimal.parse('4.345')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 4.345).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Weeks", "Years"])){
      output = (decimalInput / Decimal.parse('52.143')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 52.143).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Weeks", "Decades"])){
      output = (decimalInput / Decimal.parse('521.43')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 521.43).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Weeks", "Centuries"])){
      output = (decimalInput / Decimal.parse('5214.3')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 5214.3).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Months", "Nanoseconds"])){
      output = (decimalInput * Decimal.parse('2.628e+15')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.628e+15).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Months", "Microseconds"])){
      output = (decimalInput * Decimal.parse('2.628e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.628e+12).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Months", "Milliseconds"])){
      output = (decimalInput * Decimal.parse('2.628e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.628e+9).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Months", "Seconds"])){
      output = (decimalInput * Decimal.parse('2.628e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 2.628e+6).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Months", "Minutes"])){
      output = (decimalInput * Decimal.parse('43800')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 43800).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Months", "Hours"])){
      output = (decimalInput * Decimal.parse('730')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 730).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Months", "Weeks"])){
      output = (decimalInput * Decimal.parse('4.345')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 4.345).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Months", "Years"])){
      output = (decimalInput * Decimal.parse('12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 12).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Months", "Decades"])){
      output = (decimalInput * Decimal.parse('120')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 120).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Months", "Centuries"])){
      output = (decimalInput * Decimal.parse('1200')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1200).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Years", "Nanoseconds"])){
      output = (decimalInput * Decimal.parse('3.154e+16')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.154e+16).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Years", "Microseconds"])){
      output = (decimalInput * Decimal.parse('3.154e+13')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.154e+13).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Years", "Milliseconds"])){
      output = (decimalInput * Decimal.parse('3.154e+10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.154e+10).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Years", "Seconds"])){
      output = (decimalInput * Decimal.parse('3.154e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.154e+7).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Years", "Minutes"])){
      output = (decimalInput * Decimal.parse('525600')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 525600).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Years", "Hours"])){
      output = (decimalInput * Decimal.parse('8760')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 8760).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Years", "Days"])){
      output = (decimalInput * Decimal.parse('365')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 365).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Years", "Weeks"])){
      output = (decimalInput * Decimal.parse('52.143')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 52.143).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Years", "Months"])){
      output = (decimalInput * Decimal.parse('12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 12).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Years", "Decades"])){
      output = (decimalInput / Decimal.parse('521.43')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 521.43).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Years", "Centuries"])){
      output = (decimalInput / Decimal.parse('5214.3')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 5214.3).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Decades", "Nanoseconds"])){
      output = (decimalInput * Decimal.parse('3.154e+17')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.154e+17).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Decades", "Microseconds"])){
      output = (decimalInput * Decimal.parse('3.154e+14')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.154e+14).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Decades", "Milliseconds"])){
      output = (decimalInput * Decimal.parse('3.154e+11')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.154e+11).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Decades", "Seconds"])){
      output = (decimalInput * Decimal.parse('3.154e+8')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.154e+8).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Decades", "Minutes"])){
      output = (decimalInput * Decimal.parse('5.256e+6')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 5.256e+6).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Decades", "Hours"])){
      output = (decimalInput * Decimal.parse('87600')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 87600).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Decades", "Days"])){
      output = (decimalInput * Decimal.parse('3650')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3650).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Decades", "Weeks"])){
      output = (decimalInput * Decimal.parse('521.43')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 521.43).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Decades", "Months"])){
      output = (decimalInput * Decimal.parse('120')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 120).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Decades", "Years"])){
      output = (decimalInput * Decimal.parse('10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 10).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Decades", "Centuries"])){
      output = (decimalInput / Decimal.parse('10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput / 10).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Centuries", "Nanoseconds"])){
      output = (decimalInput * Decimal.parse('3.154e+18')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.154e+18).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Centuries", "Microseconds"])){
      output = (decimalInput * Decimal.parse('3.154e+15')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.154e+15).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Centuries", "Milliseconds"])){
      output = (decimalInput * Decimal.parse('3.154e+12')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.154e+12).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Centuries", "Seconds"])){
      output = (decimalInput * Decimal.parse('3.154e+9')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 3.154e+9).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Centuries", "Minutes"])){
      output = (decimalInput * Decimal.parse('5256e+7')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 5256e+7).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Centuries", "Hours"])){
      output = (decimalInput * Decimal.parse('876000')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 876000).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Centuries", "Days"])){
      output = (decimalInput * Decimal.parse('36500')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 36500).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Centuries", "Weeks"])){
      output = (decimalInput * Decimal.parse('5214')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 5214).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Centuries", "Months"])){
      output = (decimalInput * Decimal.parse('1200')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 1200).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Centuries", "Years"])){
      output = (decimalInput * Decimal.parse('100')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 100).toString();
      }    
    }
    else if (listEquals(transferUnits, ["Centuries", "Decades"])){
      output = (decimalInput * Decimal.parse('10')).toString();
      if (output == '0' && input != '0'){
        output = (intInput * 10).toString();
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
        title: Text("Time Calculator", style: TextStyle(fontSize: displayHeight(context) * 0.025, color: Colors.white)),
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
              underline: Opacity(opacity: 0),
              style: TextStyle(color: GC.globalColor, fontWeight: FontWeight.w500, fontSize: displayHeight(context) * 0.018),
              elevation: 16,
              onChanged: (newValue) => {onChange('dropdownValue1', newValue)},

              items: ['Nanoseconds', 'Microseconds', 'Milliseconds', 'Seconds', 'Minutes', 'Hours', 'Days', 'Weeks', 'Months', 'Years', 'Decades', 'Centuries'].map<DropdownMenuItem<String>>((String value) {
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

              items: ['Nanoseconds', 'Microseconds', 'Milliseconds', 'Seconds', 'Minutes', 'Hours', 'Days', 'Weeks', 'Months', 'Years', 'Decades', 'Centuries'].map<DropdownMenuItem<String>>((String value) {
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