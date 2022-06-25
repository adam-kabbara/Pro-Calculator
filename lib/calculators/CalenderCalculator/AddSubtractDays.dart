import 'package:flutter/material.dart';
import 'package:ProCalculator/sizes_helpers.dart';
import 'package:ProCalculator/widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ProCalculator/routes/routes.dart';
import 'package:ProCalculator/settings.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:ProCalculator/ad_manager.dart';


class ASDaysCalculatorPage extends StatelessWidget {
  static const String routeName = '/addSubtractDaysCalculator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ASDaysCalculator()
    );
  }
}


class ASDaysCalculator extends StatefulWidget {
  @override
  _ASDaysCalculatorState createState() => _ASDaysCalculatorState();
}

class _ASDaysCalculatorState extends State<ASDaysCalculator> {
  String dropdownValue0 = 'Add or subtract days';
  String dropdownValueYears = '0';
  String dropdownValueMonths = '0';
  String dropdownValueDays = '0';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  BannerAd _bannerAd;


  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('MMMM d, yyyy');
  static final String currentdate = formatter.format(now);

  var myController = TextEditingController(text: currentdate);
  var list = [for(var i=0; i<1000; i+=1) i.toString()];
  var outputString = currentdate;
  var pickedDate = now;
  int selectedRadio = 0;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: AdManager.bannerAdUnitId,
      size: AdSize.banner,
    );
    _loadBannerAd();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }


  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(0),
      lastDate: DateTime(10000),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
              primaryColor: GC.globalColor,
              colorScheme: ColorScheme.light(primary: GC.globalColor),
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary
              ),
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != now)
      setState(() {
        myController.text = formatter.format(picked);
        pickedDate = picked;
        claculate();
      });
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
      claculate();
    });
  }

  claculate(){
    if (selectedRadio == 0){
      outputString = formatter.format(DateTime(pickedDate.year + int.parse(dropdownValueYears), pickedDate.month + int.parse(dropdownValueMonths), pickedDate.day + int.parse(dropdownValueDays)));
    }
    else{
      print(outputString);
      outputString = formatter.format(DateTime(pickedDate.year - int.parse(dropdownValueYears), pickedDate.month - int.parse(dropdownValueMonths), pickedDate.day - int.parse(dropdownValueDays)));
      print(outputString);  
    }
  }

  void onChange(String value, String newValue){
    setState(() {
      if (value == 'dropdownValue0'){
        if (dropdownValue0 != newValue){
          dropdownValue0 = newValue;
          changeCalculators();
        }
      }
      else if (value == 'dropdownValueYears'){
        dropdownValueYears = newValue;
        claculate();
      }
      else if (value == 'dropdownValueMonths'){
        dropdownValueMonths = newValue;
        claculate();
      }
      else if (value == 'dropdownValueDays'){
        dropdownValueDays = newValue;
        claculate();
      }
    });
  }

  changeCalculators(){
    if (dropdownValue0 == 'Add or subtract days'){
      Navigator.pushReplacementNamed(context, Routes.addSubtractDaysCalculator);
    }
    else{
      Navigator.pushReplacementNamed(context, Routes.differenceBetweenDatesCalculator);
    }
  }

  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.bottom);
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text("Date Calculator", style: TextStyle(fontSize: displayHeight(context) * 0.025, color: Colors.white)),
        ),
      ),
    drawer: AppDrawer(),

    body:  Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(left: displayWidth(context) * 0.04, top: displayHeight(context) * 0.03),
                child: DropdownButton(
                  value: dropdownValue0,
                  underline: Opacity(opacity: 0),
                  style: TextStyle(color: GC.globalColor, fontWeight: FontWeight.w500, fontSize: displayHeight(context) * 0.023077),
                  elevation: 16,
                  onChanged: (newValue) => {onChange('dropdownValue0', newValue)},

                  items: ['Add or subtract days', 'Difference between dates'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),

            Padding(
                padding: EdgeInsets.only(left: displayWidth(context) * 0.04, top: displayHeight(context) * 0.04),
                child: Text('From', style: TextStyle(fontSize: displayHeight(context) * 0.0192307, fontWeight: FontWeight.w500)), 
            ),
            
            Row(
              children: [
                  Container(
                    width: displayWidth(context) * 0.55555555556,
                    child: Padding(
                      padding: EdgeInsets.only(left: displayWidth(context) * 0.04, top: displayHeight(context) * 0.01),
                      child: TextFormField(
                        controller: myController,
                        onTap: () => _selectDate(context),
                        readOnly: true,
                        showCursor: false,
                        style: TextStyle(fontSize: displayHeight(context) * 0.0256, fontWeight: FontWeight.w500, color: GC.globalColor), 
                        decoration: InputDecoration(
                        border: InputBorder.none, 
                        )
                      )
                    )
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: displayHeight(context) * 0.011),
                    child: IconTheme(
                      data: IconThemeData(color: GC.globalColor), 
                      child: Icon(MdiIcons.calendar, size: displayHeight(context) * 0.03204,)
                    ),
                  ),  
                ],
              ),

              Opacity(opacity: 0, child: Divider(height: displayHeight(context) * 0.03846)),

              Row(
                children: [
                  Expanded(
                    child: Transform.scale(
                      scale: displayHeight(context) * 0.0015384,
                      child: RadioListTile(
                        value: 0,
                        title: Text('Add', style: TextStyle(fontWeight: FontWeight.w500)),
                        groupValue: selectedRadio,
                        activeColor: GC.globalColor,
                        onChanged: (val) {setSelectedRadio(val);},
                      ),
                    ),
                  ),

                  Expanded(
                    child: Transform.scale(
                      scale: displayHeight(context) * 0.0015384,
                      child: RadioListTile(
                        value: 1,
                        title: Text('Subtract', style: TextStyle(fontWeight: FontWeight.w500)),
                        groupValue: selectedRadio,
                        activeColor: GC.globalColor,
                        onChanged: (val) {setSelectedRadio(val);},          
                      ),
                    ),
                  )
                ],
              ),

              Opacity(opacity: 0, child: Divider(height: displayHeight(context) * 0.06)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Years', style: TextStyle(fontSize: displayHeight(context) * 0.017948)),

                      DropdownButton(
                        value: dropdownValueYears,
                        underline: Opacity(opacity: 0),
                        style: TextStyle(color: GC.globalColor, fontWeight: FontWeight.w500, fontSize: displayHeight(context) * 0.03),
                        elevation: 16,
                        onChanged: (newValue) => {onChange('dropdownValueYears', newValue)},
                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Months', style: TextStyle(fontSize: displayHeight(context) * 0.017948)),

                      DropdownButton(
                        value: dropdownValueMonths,
                        underline: Opacity(opacity: 0),
                        style: TextStyle(color: GC.globalColor, fontWeight: FontWeight.w500, fontSize: displayHeight(context) * 0.03),
                        elevation: 16,
                        onChanged: (newValue) => {onChange('dropdownValueMonths', newValue)},
                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Days', style: TextStyle(fontSize: displayHeight(context) * 0.017948)),

                      DropdownButton(
                        value: dropdownValueDays,
                        underline: Opacity(opacity: 0),
                        style: TextStyle(color: GC.globalColor, fontWeight: FontWeight.w500, fontSize: displayHeight(context) * 0.03),
                        elevation: 16,
                        onChanged: (newValue) => {onChange('dropdownValueDays', newValue)},
                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                ],
              ),

              Opacity(opacity: 0, child: Divider(height: displayHeight(context) * 0.06)),

              Padding(
                padding: EdgeInsets.only(left: displayWidth(context) * 0.04),
                child: Text('Date', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              ),

              Opacity(opacity: 0, child: Divider(height: displayHeight(context) * 0.03)),

              Padding(
                padding: EdgeInsets.only(left: displayWidth(context) * 0.04),
                child: SelectableText(outputString, style: TextStyle(fontSize: displayHeight(context) * 0.0384615, fontWeight: FontWeight.w500, color: GC.globalColor),)
                )


          ],
        ),
      ),
    ));
  }
}