import 'package:flutter/material.dart';
import "dart:math";
import 'package:math_expressions/math_expressions.dart';
import 'package:ProCalculator/sizes_helpers.dart';
import 'package:ProCalculator/widgets/CalculatorButton.dart';
import 'package:ProCalculator/widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:ProCalculator/settings.dart';


class BasicCalculatorPage extends StatelessWidget {
  static const String routeName = '/basicCalculator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BasicCalculator(),
      );
  }
}


class BasicCalculator extends StatefulWidget {
  BasicCalculator({Key key}) : super(key: key);

  @override
  _BasicCalculator createState() => _BasicCalculator();
}

class _BasicCalculator extends State<BasicCalculator> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Parser p = Parser();
  Set selectionSet = {};
  String output = '0';
  String outputPreview = '';
  List selectionList = [];
  List <Widget> historyWidgetList = [];
  String equationToCalculate = '';
  final myController = TextEditingController(text: '0');
  String counter = '0';

  File jsonFile;
  Directory dir;
  String fileName = 'history.json';
  bool fileExists = false;
  Map <String, dynamic> fileContent = {};
  static final DateFormat formatter = DateFormat('MMM d, yyyy');

  @override
  void dispose(){
    super.dispose();
    myController.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initAll('last_exp', 'counter'));
    getApplicationDocumentsDirectory().then((Directory directory){
      dir = directory;
      jsonFile = File(dir.path + '/' + fileName);
      fileExists = jsonFile.existsSync();
      if(fileExists) {this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));}
    });
  }

  void showAlertDialog(BuildContext context, msg, double width, double height) {
    Widget okButton = Container(
      width: displayWidth(context) * 0.1782,
      height: displayHeight(context) * 0.0565,
      child: FlatButton(
        child: Text("OK", style: TextStyle(fontSize: displayHeight(context) * 0.022)),
        onPressed:  () {Navigator.of(context).pop();}
        )
      );

    AlertDialog alert = AlertDialog(
      title: Text("ERROR", style: TextStyle(fontSize: displayHeight(context) * 0.03)),
      content: Text(msg, style: TextStyle(fontSize: displayHeight(context) * 0.0211)),
      elevation: 24.0,
      actions: [
        okButton,
        ],
      );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(width: width, height: height, child: alert);
      },
    );
  }

  String getDate(){
  DateTime n = DateTime.now();
  DateTime now = DateTime(n.year, n.month, n.day);
  return formatter.format(now);
  }


  void cleanUpInput(){
    output ??= '0';
    equationToCalculate = output;
    if (equationToCalculate.startsWith('+')){
      equationToCalculate = equationToCalculate.substring(1);
    }
    equationToCalculate = equationToCalculate.replaceAll('x', '*');
    equationToCalculate = equationToCalculate.replaceAll(')(', ')*(');
    equationToCalculate = equationToCalculate.replaceAll('\u00f7', '/');
    equationToCalculate = equationToCalculate.replaceAll('%', '/100');
    equationToCalculate = equationToCalculate.replaceAll('\u221A', 'sqrt');

    // should've used regex but i don't know how it works in dart
    equationToCalculate = equationToCalculate.replaceAll('0(', '0*(');
    equationToCalculate = equationToCalculate.replaceAll('1(', '1*(');
    equationToCalculate = equationToCalculate.replaceAll('2(', '2*(');
    equationToCalculate = equationToCalculate.replaceAll('3(', '3*(');
    equationToCalculate = equationToCalculate.replaceAll('4(', '4*(');
    equationToCalculate = equationToCalculate.replaceAll('5(', '5*(');
    equationToCalculate = equationToCalculate.replaceAll('6(', '6*(');
    equationToCalculate = equationToCalculate.replaceAll('7(', '7*(');
    equationToCalculate = equationToCalculate.replaceAll('8(', '8*(');
    equationToCalculate = equationToCalculate.replaceAll('9(', '9*(');
    equationToCalculate = equationToCalculate.replaceAll(')0', ')*0');
    equationToCalculate = equationToCalculate.replaceAll(')1', ')*1');
    equationToCalculate = equationToCalculate.replaceAll(')2', ')*2');
    equationToCalculate = equationToCalculate.replaceAll(')3', ')*3');
    equationToCalculate = equationToCalculate.replaceAll(')4', ')*4');
    equationToCalculate = equationToCalculate.replaceAll(')5', ')*5');
    equationToCalculate = equationToCalculate.replaceAll(')6', ')*6');
    equationToCalculate = equationToCalculate.replaceAll(')7', ')*7');
    equationToCalculate = equationToCalculate.replaceAll(')8', ')*8');
    equationToCalculate = equationToCalculate.replaceAll(')9', ')*9');
    equationToCalculate = equationToCalculate.replaceAll('0sqrt', '0*sqrt');
    equationToCalculate = equationToCalculate.replaceAll('1sqrt', '1*sqrt');
    equationToCalculate = equationToCalculate.replaceAll('2sqrt', '2*sqrt');
    equationToCalculate = equationToCalculate.replaceAll('3sqrt', '3*sqrt');
    equationToCalculate = equationToCalculate.replaceAll('4sqrt', '4*sqrt');
    equationToCalculate = equationToCalculate.replaceAll('5sqrt', '5*sqrt');
    equationToCalculate = equationToCalculate.replaceAll('6sqrt', '6*sqrt');
    equationToCalculate = equationToCalculate.replaceAll('7sqrt', '7*sqrt');
    equationToCalculate = equationToCalculate.replaceAll('8sqrt', '8*sqrt');
    equationToCalculate = equationToCalculate.replaceAll('9sqrt', '9*sqrt');
    equationToCalculate = equationToCalculate.replaceAll('0\u03C0', '0*\u03C0');
    equationToCalculate = equationToCalculate.replaceAll('1\u03C0', '1*\u03C0');
    equationToCalculate = equationToCalculate.replaceAll('2\u03C0', '2*\u03C0');
    equationToCalculate = equationToCalculate.replaceAll('3\u03C0', '3*\u03C0');
    equationToCalculate = equationToCalculate.replaceAll('4\u03C0', '4*\u03C0');
    equationToCalculate = equationToCalculate.replaceAll('5\u03C0', '5*\u03C0');
    equationToCalculate = equationToCalculate.replaceAll('6\u03C0', '6*\u03C0');
    equationToCalculate = equationToCalculate.replaceAll('7\u03C0', '7*\u03C0');
    equationToCalculate = equationToCalculate.replaceAll('8\u03C0', '8*\u03C0');
    equationToCalculate = equationToCalculate.replaceAll('9\u03C0', '9*\u03C0');
    equationToCalculate = equationToCalculate.replaceAll('\u03C0' + '0', '\u03C0*0');
    equationToCalculate = equationToCalculate.replaceAll('\u03C0' + '1', '\u03C0*1');
    equationToCalculate = equationToCalculate.replaceAll('\u03C0' + '2', '\u03C0*2');
    equationToCalculate = equationToCalculate.replaceAll('\u03C0' + '3', '\u03C0*3');
    equationToCalculate = equationToCalculate.replaceAll('\u03C0' + '4', '\u03C0*4');
    equationToCalculate = equationToCalculate.replaceAll('\u03C0' + '5', '\u03C0*5');
    equationToCalculate = equationToCalculate.replaceAll('\u03C0' + '6', '\u03C0*6');
    equationToCalculate = equationToCalculate.replaceAll('\u03C0' + '7', '\u03C0*7');
    equationToCalculate = equationToCalculate.replaceAll('\u03C0' + '8', '\u03C0*8');
    equationToCalculate = equationToCalculate.replaceAll('\u03C0' + '9', '\u03C0*9');
    equationToCalculate = equationToCalculate.replaceAll('*+', '*');
    equationToCalculate = equationToCalculate.replaceAll('/+', '/');
    equationToCalculate = equationToCalculate.replaceAll('^+', '^');
    equationToCalculate = equationToCalculate.replaceAll('sqrt+', 'sqrt');
    equationToCalculate = equationToCalculate.replaceAll('\u03C0', pi.toString());
    print(equationToCalculate);
  }

  String removeTrailing(String pattern, String from) {
    int i = from.length;
    while (from.startsWith(pattern, i - pattern.length)) i -= pattern.length;
    return from.substring(0, i);
  }

  void evaluateExpression(){
    if (output.contains(RegExp(r'\D'))){
      cleanUpInput();
      var eq = output;
      counter ??= '0';


      try{
        Expression exp = p.parse(equationToCalculate);
        String expOutput;
        expOutput = exp.evaluate(EvaluationType.REAL, null).toString();
          
        expOutput = double.parse(expOutput).toStringAsFixed(9);
        if (expOutput.contains('.')){expOutput = removeTrailing('0', expOutput);}
        if (expOutput.endsWith('.')){expOutput = expOutput.substring(0, expOutput.length - 1);}
        output = expOutput;
        //save equations
        writeToFile(counter, [eq, output, getDate()]);
        initalizeHistoryList();
        counter = (int.parse(counter) + 1).toString();
        _save('counter', counter);
      }

      on FormatException{
      showAlertDialog(context, "There is an error in the equation", displayWidth(context) * 0.051, displayHeight(context)* 0.01257);
      }
      on RangeError{
      showAlertDialog(context, "There is an error in the equation", displayWidth(context) * 0.051, displayHeight(context)* 0.01257);
      }
      on StateError{
        showAlertDialog(context, "There is an error in the equation", displayWidth(context) * 0.051, displayHeight(context)* 0.01257);
      }
      on UnsupportedError{
        showAlertDialog(context, "Division by 0 error", displayWidth(context) * 0.051, displayHeight(context)* 0.01257);
      }
    }
  }

  void evaluatePreview(){
    cleanUpInput();
    if (! output.contains(RegExp(r'\D'))){
      print('output $output');
      outputPreview = output;
    }

    else{
      if (output == ''){outputPreview = '';}
      if (output.contains(RegExp(r'[0-9]\u00f70'))) {outputPreview = 'error';}

      else{
        try{
          Expression exp = p.parse(equationToCalculate);
          String expOutput;
          expOutput = exp.evaluate(EvaluationType.REAL, null).toString();
      
          expOutput = double.parse(expOutput).toStringAsFixed(9);
          if (expOutput.contains('.')){expOutput = removeTrailing('0', expOutput);}
          if (expOutput.endsWith('.')){expOutput = expOutput.substring(0, expOutput.length - 1);}
          outputPreview = expOutput;
        }

        on FormatException{
        }
        on RangeError{
        }
        on StateError{
        }
      }
    }
  }


  void updateSelection(){
    if (myController.selection.baseOffset != -1){
      selectionSet.add(myController.selection.baseOffset);
      selectionSet.add(myController.selection.extentOffset);
      selectionSet.forEach((element) {selectionList.add(element);});
      selectionList.sort();
    }
  }

  void updateOutput(var char){
    updateSelection();

    if (char == 'C'){
      output = '0';
      myController.selection = TextSelection(baseOffset: 0, extentOffset: 0);
      updateSelection();
    }

    else if (char == 'backspace'){
      if (selectionList.length == 1){
        output = output.substring(0, selectionList[0] - 1) + output.substring(selectionList[0]);
      }

      else if (selectionList.length == 2){
        output = output.substring(0, selectionList[0]) + output.substring(selectionList[1]);
      }

      else if (output.length >= 1){
        output = output.substring(0, output.length - 1);
      }
      if (output.length == 0){
        output = '0';
      }
    }

    else if (output == '0' && char != '.'){
      output = char;
    }

    else if (output == '0' && char == '0'){
      output = '0';
    }

    else if (char == '='){
      evaluateExpression();
    }

    else{
      if (selectionList.length == 1){
        output = output.substring(0, selectionList[0]) + char + output.substring(selectionList[0]);
      }
      else{
        if (char == '.' && output.substring(output.length-1) == '.'){
        }
        else{
          output += char;
        }
      }
    }

    if (output == '='){
      output = '0';
    }

    myController.text = output;
    if (selectionList.length == 1){
      if (char == 'backspace'){
        myController.selection = TextSelection(baseOffset: selectionList[0] - 1, extentOffset: selectionList[0] - 1);
      }
      else if (output.length >= 1){
        myController.selection = TextSelection(baseOffset: selectionList[0] + 1, extentOffset: selectionList[0] + 1);
      }
    }
    else if (selectionList.length == 2){
      myController.selection = TextSelection(baseOffset: selectionList[0], extentOffset: selectionList[0]);
    }
    setState(() {});
    selectionList.clear();
    selectionSet.clear();
    _save('last_exp', output);
    evaluatePreview();
    if (char == '=') {outputPreview = '';}
  }

  // for saving and reading last equation
  _initAll(final key1, final key2) async {
    final prefs = await SharedPreferences.getInstance();
    final value1 = prefs.getString(key1);
    final value2 = prefs.getString(key2);
    output = value1;
    counter = value2;
    myController.text = output;
    evaluatePreview(); // get the preview
    _readColor('GC');
    setState(() {});
  }

  void initalizeHistoryList(){
    historyWidgetList.clear();
    fileContent.forEach((key, value) {historyWidgetList.add(_createDrawerItem(value[0], value[1], value[2]));});
    historyWidgetList = historyWidgetList.reversed.toList();
  }

  _save(final key, final value) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {prefs.remove(key);}
    prefs.setString(key, value);
  }

  _readColor(final key) async {
    Map colorsMap = {'Red': Colors.red[700], 'Blue': Colors.blue, 'Green': Colors.green, 'Black': Colors.black, 'Yellow': Colors.yellow, 'Purple': Colors.purple, 'Pink': Colors.pink[400], 'Brown': Colors.brown, 'Grey': Colors.grey[700], 'Orange': Colors.orange};
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getString(key);
    var value = v;
    value ??= 'Blue';
    GC.globalColor = colorsMap[value];
    setState(() {});
  }

  void createFile(Map<String, dynamic> content){
    jsonFile.createSync();
    fileExists = true;
    jsonFile.writeAsStringSync(json.encode(content));
  }

  void writeToFile(String key, List value){
    Map <String, dynamic> content = {key: value};
    if (fileExists){
      Map <String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));
    }
    else{
      createFile(content);
    }
    this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
  }

  void deleteFileData(){
    if (fileExists){
      jsonFile.writeAsStringSync(json.encode({}));
      historyWidgetList.clear();
      this.setState(() => fileContent = json.decode(jsonFile.readAsStringSync()));
    }
  }

  void _openEndDrawer() {
    initalizeHistoryList();
    _scaffoldKey.currentState.openEndDrawer();
    setState(() {});
  }

  Widget _createDrawerItem(String equation, String solution, String date){
    return ListTile(
      title: Column( 
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            
          Padding(
            padding: EdgeInsets.only(left: displayWidth(context) * 0.05),
            child: Expanded(child: SelectableText(date, style: TextStyle(fontSize: displayHeight(context) * 0.02, color: Colors.grey))), //0.0176
            ),
          Padding(
            padding: EdgeInsets.only(left: displayWidth(context) * 0.05),
            child: Expanded(child: SelectableText(equation + '=' , style: TextStyle(fontSize: displayHeight(context) * 0.023))), //0.0176
            ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(left: displayWidth(context) * 0.05),
              child: Expanded(child: SelectableText(solution, style: TextStyle(fontSize: displayHeight(context) * 0.035, fontWeight: FontWeight.w500))), //0.0176
              ),
          ),

            Divider(height: displayHeight(context) * 0.0564102564,color: GC.globalColor, thickness: 1.2),
            
            ],
          ),
      );
    }

  
  @override
  Widget build(BuildContext context) {
    double horizontalPadding = displayHeight(context) * 0.03029105755; //23
    double verticalPadding = displayWidth(context) * 0.0585688821; // 23
    double outputTextSize = displayHeight(context) * 0.052680110009; // 40


    return Scaffold(
        key: _scaffoldKey,

        appBar: PreferredSize(
          preferredSize: Size.fromHeight(displayHeight(context) * 0.07),
          child: AppBar(

            actions: <Widget>[Container()], // to remove the enddrawer ha,burger icon
            backgroundColor: GC.globalColor,
            leading: IconButton(
              icon: IconTheme(data: IconThemeData(color: Colors.white), child: Icon(Icons.menu, size: displayHeight(context) * 0.035)),
              onPressed: () => _scaffoldKey.currentState.openDrawer()            
              ),
            title: Text("Basic Calculator", style: TextStyle(fontSize: displayHeight(context) * 0.025, color: Colors.white)),
            ),
          ),
        drawer: AppDrawer(),
        
        endDrawer: Drawer(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: ListView(
                    children: <Widget> [
                      Container(
                        height: displayHeight(context) * 0.1,
                        child: DrawerHeader(
                          decoration: BoxDecoration(
                            color: GC.globalColor,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('History', style: TextStyle(fontSize: displayHeight(context) * 0.03, color: Colors.white))
                            ),   
                        )
                      ),
                    ] + historyWidgetList
                  ),
                ),

                Opacity(opacity: 0, child: Divider()),

                IconTheme(
                  data: IconThemeData(color: GC.globalColor),
                  child: IconButton(
                    icon: Icon(Icons.delete),
                    iconSize: displayHeight(context) * 0.038461,
                    onPressed: () => {deleteFileData()},
                  )
                )

              ]
            ),

            ),
          ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [

            Container(
                child: IconTheme(
                data: IconThemeData(color: GC.globalColor), 
                child: IconButton(
                  icon: Icon(Icons.history),
                  iconSize: displayHeight(context) * 0.0448717,
                  onPressed: () {_openEndDrawer();}
                  ),
                ),
              ),

            Container(
              padding: EdgeInsets.only(
                top: displayHeight(context) * 0.07,
                left: displayWidth(context) * 0.03,
                right: displayWidth(context) * 0.03
              ),
              alignment: Alignment.bottomRight,

              child: TextFormField(
                controller: myController,
                textAlign: TextAlign.end,
                style: TextStyle(
                fontSize: outputTextSize, fontWeight: FontWeight.bold),
                showCursor: true,
                cursorColor: GC.globalColor,
                readOnly: true,
                decoration: InputDecoration(        
                  enabledBorder: UnderlineInputBorder(      
                    borderSide: BorderSide(color: GC.globalColor, width: displayHeight(context) * 0.0026),   
                    ),  
                )
                )
              ),

            Padding(
              padding: EdgeInsets.only(
                top: displayHeight(context) * 0.01,
                left: displayWidth(context) * 0.03, 
                right: displayWidth(context) * 0.03),

              child: SelectableText(
                outputPreview,
                style: TextStyle(color: Colors.grey[700], fontSize: displayHeight(context) * 0.035897),
              ),
            ),

            Expanded(
              child: Opacity(
                opacity: 0.0,
                child: Divider()
                )
              ),

            SafeArea(
              child: Container(
                color: Colors.grey[150],
                child: Column(
                  children: [

                  Row(
                    children: [
                      CalculatorButton('C', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor), 
                      CalculatorButton('\u221A', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor),
                      CalculatorButton('\u03C0', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor),
                      CalculatorButton('backspace', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor),
                    ]),

                  Row(
                    children: [
                      CalculatorButton('(', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor), 
                      CalculatorButton(')', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor),
                      CalculatorButton('^', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor),
                      CalculatorButton('\u00f7', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor),
                    ]),

                  Row(
                    children: [
                      CalculatorButton('7', verticalPadding, horizontalPadding, updateOutput), 
                      CalculatorButton('8', verticalPadding, horizontalPadding, updateOutput),
                      CalculatorButton('9', verticalPadding, horizontalPadding, updateOutput),
                      CalculatorButton('x', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor),
                      ]),

                  Row(
                    children: [
                      CalculatorButton('4', verticalPadding, horizontalPadding, updateOutput), 
                      CalculatorButton('5', verticalPadding, horizontalPadding, updateOutput),
                      CalculatorButton('6', verticalPadding, horizontalPadding, updateOutput),
                      CalculatorButton('-', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor),
                      ]),

                  Row(
                    children: [
                      CalculatorButton('1', verticalPadding, horizontalPadding, updateOutput), 
                      CalculatorButton('2', verticalPadding, horizontalPadding, updateOutput),
                      CalculatorButton('3', verticalPadding, horizontalPadding, updateOutput),
                      CalculatorButton('+', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor),
                      ]),   

                  Row(
                    children: [
                      CalculatorButton('%', verticalPadding, horizontalPadding, updateOutput), 
                      CalculatorButton('0', verticalPadding, horizontalPadding, updateOutput),
                      CalculatorButton('.', verticalPadding, horizontalPadding, updateOutput),
                      CalculatorButton('=', verticalPadding, horizontalPadding, updateOutput, color: GC.globalColor),
                      ])

                  ])
              ),
            )
          ])
      );
    }
  }