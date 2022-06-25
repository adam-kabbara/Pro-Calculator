import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';
import 'package:ProCalculator/sizes_helpers.dart';
import 'package:ProCalculator/widgets/drawer.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ProCalculator/routes/routes.dart';
import 'package:ProCalculator/settings.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:ProCalculator/ad_manager.dart';


class DifferenceBetweenDatesPage extends StatelessWidget {
  static const String routeName = '/differenceBetweenDatesCalculator';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DifferenceBetweenDates()
    );
  }
}


class DifferenceBetweenDates extends StatefulWidget {
  @override
  _DifferenceBetweenDatesState createState() => _DifferenceBetweenDatesState();
}

class _DifferenceBetweenDatesState extends State<DifferenceBetweenDates> {
  String dropdownValue0 = 'Difference between dates';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  BannerAd _bannerAd;


  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('MMMM d, yyyy');
  static final String currentdate = formatter.format(now);

  var myControllerFrom = TextEditingController(text: currentdate);
  var myControllerTo = TextEditingController(text: currentdate);
  var list = [for(var i=0; i<1000; i+=1) i.toString()];
  var outputString = 'Same dates';
  dynamic outputInDays = '';
  var pickedDateFrom = now;
  var pickedDateTo = now;

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

  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.bottom);
  }

  _selectDate(BuildContext context, id) async {
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
        if (id == 'pickedDateFrom'){
          myControllerFrom.text = formatter.format(picked);
          pickedDateFrom = picked;
        }
        else{
          myControllerTo.text = formatter.format(picked);
          pickedDateTo = picked;
        }
        claculate();
      });
  }

  claculate(){
    print('from $pickedDateFrom To $pickedDateTo');
    if (pickedDateFrom.year == pickedDateTo.year && pickedDateFrom.month == pickedDateTo.month && pickedDateFrom.day == pickedDateTo.day){
      outputString = 'Same dates';
      outputInDays = '';
    }
    else{
      outputInDays = pickedDateTo.difference(pickedDateFrom).inDays.abs() + 1;
      var outputyears = int.parse((Decimal.parse(outputInDays.toString()) / Decimal.parse('365')).floor().toString());
      var outputmonths = int.parse(((Decimal.parse(outputInDays.toString()) / Decimal.parse('365') - Decimal.parse(outputyears.toString())) * Decimal.parse('12')).floor().toString());
      var outputdays = (pickedDateFrom.day - pickedDateTo.day).abs();
      var outputweeks = int.parse(((Decimal.parse(outputdays.toString()) / Decimal.parse('7')).floor()).toString()); 
      outputdays = int.parse(((Decimal.parse(outputdays.toString()) / Decimal.parse('7') - Decimal.parse(outputweeks.toString())) * Decimal.parse('7')).toString());
      
      var dict1 = {'outputyears': outputyears, 'outputmonths': outputmonths, 'outputweeks': outputweeks, 'outputdays': outputdays};
      var dict2 = {};
      dict1.forEach((key, value) {if (value != 0){dict2[key] = value;}});   

      outputString = '';
      dict2.forEach((key, value) {outputString += '$value $key ';});
      outputString = outputString.replaceAll('output', '');
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
                        controller: myControllerFrom,
                        onTap: () => _selectDate(context, 'pickedDateFrom'),
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

              Opacity(opacity: 0, child: Divider(height: displayHeight(context) * 0.06)),

            Padding(
                padding: EdgeInsets.only(left: displayWidth(context) * 0.04, top: displayHeight(context) * 0.04),
                child: Text('To', style: TextStyle(fontSize: displayHeight(context) * 0.0192307, fontWeight: FontWeight.w500)), 
            ),
            
            Row(
              children: [
                  Container(
                    width: displayWidth(context) * 0.55555555556,
                    child: Padding(
                      padding: EdgeInsets.only(left: displayWidth(context) * 0.04, top: displayHeight(context) * 0.01),
                      child: TextFormField(
                        controller: myControllerTo,
                        onTap: () => _selectDate(context, 'pickedDateTo'),
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

              Padding(
                padding: EdgeInsets.only(left: displayWidth(context) * 0.04),
                child: Text('Diffrence', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
              ),

              Opacity(opacity: 0, child: Divider(height: displayHeight(context) * 0.03)),

              Padding(
                padding: EdgeInsets.only(left: displayWidth(context) * 0.04),
                child: SelectableText(outputString, style: TextStyle(fontSize: displayHeight(context) * 0.0384615, fontWeight: FontWeight.w500, color: GC.globalColor),)
                ),

              Padding(
                padding: EdgeInsets.only(left: displayWidth(context) * 0.04, top:displayHeight(context) * 0.025),
                child: SelectableText(
                  outputInDays == '' || outputString.contains(RegExp(r'^\d+ days $')) ? '':outputInDays.toString() + ' days',
                  style: TextStyle(fontSize: displayHeight(context) * 0.01923, color: Colors.grey[800]),
                  ),
              )


          ],
        ),
      ),
    ));
  }
}