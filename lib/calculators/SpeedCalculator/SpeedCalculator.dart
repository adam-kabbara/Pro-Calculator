import 'package:flutter/material.dart';
import 'package:ProCalculator/widgets/CalculatorButton.dart';
import 'package:ProCalculator/widgets/drawer.dart';
import 'package:ProCalculator/sizes_helpers.dart';
import 'package:flutter/foundation.dart';
import 'package:decimal/decimal.dart';
import 'package:ProCalculator/settings.dart';


class SpeedCalculatorPage extends StatelessWidget {
  static const String routeName = '/speedCalculator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpeedCalculator()
    );
  }
}


class SpeedCalculator extends StatefulWidget {
  @override
  _SpeedCalculatorState createState() => _SpeedCalculatorState();
}

class _SpeedCalculatorState extends State<SpeedCalculator> {
  String char;
  String dropdownValue1 = 'Centimeters per second';
  String dropdownValue2 = 'Meters per second';
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

    if (transferUnits[0] == transferUnits[1]) {
        output = decimalInput.toString();
    }
    else if (listEquals(transferUnits, ["Centimeters per second", "Meters per second"])){
      output = (decimalInput / Decimal.parse('100')).toString();
    }
    else if (listEquals(transferUnits, ["Centimeters per second", "Feet per second"])){
      output = (decimalInput / Decimal.parse('30.48')).toString();
    }
    else if (listEquals(transferUnits, ["Centimeters per second", "Kilometers per hour"])){
      output = (decimalInput / Decimal.parse('27.778')).toString();
    }
    else if (listEquals(transferUnits, ["Centimeters per second", "Miles per hour"])){
      output = (decimalInput / Decimal.parse('44.704')).toString();
    }
    else if (listEquals(transferUnits, ["Centimeters per second", "Knot"])){
      output = (decimalInput * Decimal.parse('51.444')).toString();
    }
    else if (listEquals(transferUnits, ["Centimeters per second", "Mach"])){
      output = (decimalInput * Decimal.parse('34300')).toString();
    }
    else if (listEquals(transferUnits, ["Meters per second", "Centimeters per second"])){
      output = (decimalInput * Decimal.parse('100')).toString();
    }
    else if (listEquals(transferUnits, ["Meters per second", "Feet per second"])){
      output = (decimalInput * Decimal.parse('3.281')).toString();
    }
    else if (listEquals(transferUnits, ["Meters per second", "Kilometers per hour"])){
      output = (decimalInput * Decimal.parse('3.6')).toString();
    }
    else if (listEquals(transferUnits, ["Meters per second", "Miles per hour"])){
      output = (decimalInput * Decimal.parse('2.237')).toString();
    }
    else if (listEquals(transferUnits, ["Meters per second", "Knot"])){
      output = (decimalInput * Decimal.parse('1.944')).toString();
    }
    else if (listEquals(transferUnits, ["Meters per second", "Mach"])){
      output = (decimalInput / Decimal.parse('343')).toString();
    }
    else if (listEquals(transferUnits, ["Feet per second", "Centimeters per second"])){
      output = (decimalInput * Decimal.parse('30.48')).toString();
    }
    else if (listEquals(transferUnits, ["Feet per second", "Meters per second"])){
      output = (decimalInput / Decimal.parse('3.281')).toString();
    }
    else if (listEquals(transferUnits, ["Feet per second", "Kilometers per hour"])){
      output = (decimalInput * Decimal.parse('1.097')).toString();
    }
    else if (listEquals(transferUnits, ["Feet per second", "Miles per hour"])){
      output = (decimalInput / Decimal.parse('1.467')).toString();
    }
    else if (listEquals(transferUnits, ["Feet per second", "Knot"])){
      output = (decimalInput / Decimal.parse('1.688')).toString();
    }
    else if (listEquals(transferUnits, ["Feet per second", "Mach"])){
      output = (decimalInput / Decimal.parse('1125')).toString();
    }
    else if (listEquals(transferUnits, ["Kilometers per hour", "Centimeters per second"])){
      output = (decimalInput * Decimal.parse('27.778')).toString();
    }
    else if (listEquals(transferUnits, ["Kilometers per hour", "Meters per second"])){
      output = (decimalInput / Decimal.parse('3.6')).toString();
    }
    else if (listEquals(transferUnits, ["Kilometers per hour", "Feet per second"])){
      output = (decimalInput / Decimal.parse('1.097')).toString();
    }
    else if (listEquals(transferUnits, ["Kilometers per hour", "Miles per hour"])){
      output = (decimalInput / Decimal.parse('1.609')).toString();
    }
    else if (listEquals(transferUnits, ["Kilometers per hour", "Knot"])){
      output = (decimalInput / Decimal.parse('1.852')).toString();
    }
    else if (listEquals(transferUnits, ["Kilometers per hour", "Mach"])){
      output = (decimalInput / Decimal.parse('1235')).toString();
    }
    else if (listEquals(transferUnits, ["Miles per hour", "Centimeters per second"])){
      output = (decimalInput * Decimal.parse('44.704')).toString();
    }
    else if (listEquals(transferUnits, ["Miles per hour", "Meters per second"])){
      output = (decimalInput / Decimal.parse('2.237')).toString();
    }
    else if (listEquals(transferUnits, ["Miles per hour", "Feet per second"])){
      output = (decimalInput * Decimal.parse('1.467')).toString();
    }
    else if (listEquals(transferUnits, ["Miles per hour", "Kilometers per hour"])){
      output = (decimalInput * Decimal.parse('1.609')).toString();
    }
    else if (listEquals(transferUnits, ["Miles per hour", "Knot"])){
      output = (decimalInput / Decimal.parse('1.151')).toString();
    }
    else if (listEquals(transferUnits, ["Miles per hour", "Mach"])){
      output = (decimalInput / Decimal.parse('767')).toString();
    }
    else if (listEquals(transferUnits, ["Knot", "Centimeters per second"])){
      output = (decimalInput * Decimal.parse('51.444')).toString();
    }
    else if (listEquals(transferUnits, ["Knot", "Meters per second"])){
      output = (decimalInput / Decimal.parse('1.944')).toString();
    }
    else if (listEquals(transferUnits, ["Knot", "Feet per second"])){
      output = (decimalInput * Decimal.parse('1.688')).toString();
    }
    else if (listEquals(transferUnits, ["Knot", "Kilometers per hour"])){
      output = (decimalInput * Decimal.parse('1.852')).toString();
    }
    else if (listEquals(transferUnits, ["Knot", "Miles per hour"])){
      output = (decimalInput * Decimal.parse('1.151')).toString();
    }
    else if (listEquals(transferUnits, ["Knot", "Mach"])){
      output = (decimalInput / Decimal.parse('667')).toString();
    }
    else if (listEquals(transferUnits, ["Mach", "Centimeters per second"])){
      output = (decimalInput * Decimal.parse('34300')).toString();
    }
    else if (listEquals(transferUnits, ["Mach", "Meters per second"])){
      output = (decimalInput * Decimal.parse('343')).toString();
    }
    else if (listEquals(transferUnits, ["Mach", "Feet per second"])){
      output = (decimalInput * Decimal.parse('1125')).toString();
    }
    else if (listEquals(transferUnits, ["Mach", "Kilometers per hour"])){
      output = (decimalInput * Decimal.parse('1235')).toString();
    }
    else if (listEquals(transferUnits, ["Mach", "Miles per hour"])){
      output = (decimalInput * Decimal.parse('767')).toString();
    }
    else if (listEquals(transferUnits, ["Mach", "Knot"])){
      output = (decimalInput * Decimal.parse('667')).toString();
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
        title: Text("Speed Calculator", style: TextStyle(fontSize: displayHeight(context) * 0.025, color: Colors.white)),
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

              items: ['Centimeters per second', 'Meters per second', 'Feet per second', 'Kilometers per hour', 'Miles per hour', 'Knot', 'Mach'].map<DropdownMenuItem<String>>((String value) {
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

              items: ['Centimeters per second', 'Meters per second', 'Feet per second', 'Kilometers per hour', 'Miles per hour', 'Knot', 'Mach'].map<DropdownMenuItem<String>>((String value) {
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