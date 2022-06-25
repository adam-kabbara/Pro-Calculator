import 'package:flutter/material.dart';
import 'ad_manager.dart';
import 'sizes_helpers.dart';
import 'package:ProCalculator/widgets/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Settings()
    );
  }
}

class GC{
  static Color globalColor;
}

class Settings extends StatefulWidget{
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String dropdownValue = 'Blue';
  Map colorsMap = {'Red': Colors.red[700], 'Blue': Colors.blue, 'Green': Colors.green, 'Black': Colors.black, 'Yellow': Colors.yellow, 'Purple': Colors.purple, 'Pink': Colors.pink[400], 'Brown': Colors.brown, 'Grey': Colors.grey[700], 'Orange': Colors.orange};
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _readColor('GC'));
  }

  onChange(newValue){
    Map reverseColorsMap = colorsMap.map((key, value) => MapEntry(value, key));
    setState(() {
      dropdownValue = newValue;
      GC.globalColor = colorsMap[dropdownValue];
      _saveColor('GC', reverseColorsMap[GC.globalColor]);
    });
  }

  _readColor(final key) async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getString(key);
    var value = v;
    value ??= 'Blue';
    GC.globalColor = colorsMap[value];
    dropdownValue = value;
    print(value);
    setState(() {});
  }

  _saveColor(final key, final value) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {prefs.remove(key);}
    prefs.setString(key, value);
    print('saved $value');
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
        title: Text("Settings", style: TextStyle(fontSize: displayHeight(context) * 0.025, color: Colors.white)),
        ),
      ),
    drawer: AppDrawer(),

      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: EdgeInsets.only(top: 10, left: displayWidth(context) * 0.03),
              child: Text(
                'Customize Color', 
                style: TextStyle(color: GC.globalColor, fontWeight: FontWeight.w500, fontSize: displayHeight(context) * 0.03)),
            ),

            Padding(
              padding: EdgeInsets.only(left: displayWidth(context) * 0.03),
              child: DropdownButton(
                value: dropdownValue,
                underline: Opacity(opacity: 0),
                style: TextStyle(color: GC.globalColor, fontWeight: FontWeight.w500, fontSize: displayHeight(context) * 0.023),
                elevation: 16,
                onChanged: (newValue) => {onChange(newValue)},

                items: ['Black', 'Blue', 'Brown', 'Purple', 'Green', 'Grey', 'Orange', 'Pink', 'Red', 'Yellow'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: colorsMap[value], fontWeight: FontWeight.w500, fontSize: displayHeight(context) * 0.023)),
                  );
                }).toList(),
              ),
            ),

            Opacity(opacity: 0, child: Divider()),
            Padding(padding: EdgeInsets.only(left: displayWidth(context) * 0.03), child: Text('Dark mode comming soon', style: TextStyle(fontSize: displayHeight(context) * 0.02),)),
            Expanded(child:(Opacity(opacity: 0, child: Divider()))),                    

            Container(
              height: 230,
              child: NativeAdmob(
                adUnitID: AdManager.bannerAdUnitId,
                loading: Center(child: CircularProgressIndicator()),
                error: Container(),
                type: NativeAdmobType.full,
              ),
            ),

            Container(
              height: 230,
              child: NativeAdmob(
                adUnitID: AdManager.bannerAdUnitId,
                loading: Center(child: CircularProgressIndicator()),
                error: Container(),
                type: NativeAdmobType.full,
              ),
            ),

            Expanded(child:(Opacity(opacity: 0, child: Divider()))),            
            Align(alignment: Alignment.center, child: Text('Developed by Adam.K', style: TextStyle(fontSize: 30, color: GC.globalColor)))
                
            
          ]
        )
      )
    );
  }
}