import 'package:flutter/material.dart';
import 'package:ProCalculator/routes/routes.dart';
import 'package:ProCalculator/sizes_helpers.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ProCalculator/settings.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'dart:async';


class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final _nativeAdController1 = NativeAdmobController();
  static const _adUnitID1 = 'ca-app-pub-3940256099942544/2247696110'; 
  double _height1 = 0;
  StreamSubscription _subscription1;

  final _nativeAdController2 = NativeAdmobController();
  static const _adUnitID2 = 'ca-app-pub-3940256099942544/2247696110'; 
  double _height2 = 0;
  StreamSubscription _subscription2;

  final _nativeAdController3 = NativeAdmobController();
  static const _adUnitID3 = 'ca-app-pub-3940256099942544/2247696110';
  double _height3 = 0;
  StreamSubscription _subscription3;

  final _nativeAdController4 = NativeAdmobController();
  static const _adUnitID4 = 'ca-app-pub-3940256099942544/2247696110';
  double _height4 = 0;
  StreamSubscription _subscription4;

  @override
  void initState() {
    _subscription1 = _nativeAdController1.stateChanged.listen(_onStateChanged1);
    _subscription2 = _nativeAdController2.stateChanged.listen(_onStateChanged2);
    _subscription3 = _nativeAdController3.stateChanged.listen(_onStateChanged3);
    _subscription4 = _nativeAdController4.stateChanged.listen(_onStateChanged4);
    super.initState();
  }

  @override
  void dispose() {
    _subscription1.cancel();
    _nativeAdController1.dispose();

    _subscription2.cancel();
    _nativeAdController2.dispose();

    _subscription3.cancel();
    _nativeAdController3.dispose();

    _subscription4.cancel();
    _nativeAdController4.dispose();
    super.dispose();
  }

  void _onStateChanged1(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          _height1 = 0;
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          _height1 = displayHeight(context) * 0.423;
        });
        break;

      default:
        break;
    }
  }

  void _onStateChanged2(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          _height2 = 0;
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          _height2 = displayHeight(context) * 0.095;
        });
        break;

      default:
        break;
    }
  }

  void _onStateChanged3(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          _height3 = 0;
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          _height3 = displayHeight(context) * 0.095;
        });
        break;

      default:
        break;
    }
  }

  void _onStateChanged4(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          _height4 = 0;
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          _height4 = displayHeight(context) * 0.095;
        });
        break;

      default:
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    print(displaySize(context));
    return Container(
        width: displayWidth(context) * 0.78,
        child: Drawer(
          child: ListView(
            children: [
              Container(

                height: displayHeight(context) * 0.1328,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: GC.globalColor,
                    ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Pro Calculator', style: TextStyle(fontSize: displayHeight(context) * 0.03, color: Colors.white)),
                    Expanded(child: Opacity(opacity: 0, child: Divider())),
                    Row(
                      children:[
                        Container(
                          height: displayHeight(context) * 0.0384615,
                          child: FlatButton(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(fontSize: displayHeight(context) * 0.024, color: Colors.white, fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(text:('Settings ')), 
                                  WidgetSpan(child: IconTheme(data: IconThemeData(color: Colors.white), child: Icon(Icons.settings)))
                                ]
                                )
                              ),
                            onPressed: () => Navigator.pushReplacementNamed(context, Routes.settings)),
                          ),
                        ]
                      )
                    ]
                  )
                ),
              ),
              
              Padding(
                padding: EdgeInsets.only(top: displayHeight(context) * 0.01923, left: displayWidth(context) * 0.05),
                child: Text('Calculators',
                 style: TextStyle(
                    fontSize: displayHeight(context) * 0.0235,
                    fontWeight: FontWeight.bold, 
                    color: GC.globalColor))
                ),

              _createDrawerItem(
                screenHieght: displayHeight(context),
                screenWidth: displayWidth(context),
                icon: MdiIcons.angleAcute,
                text: 'Angle Calculator',
                onTap: () => Navigator.pushReplacementNamed(context, Routes.angleCalculator)),

              _createDrawerItem(
                screenHieght: displayHeight(context),
                screenWidth: displayWidth(context),
                icon: MdiIcons.grid,
                text: 'Area Calculator',
                onTap: () => Navigator.pushReplacementNamed(context, Routes.areaCalculator)),

              _createDrawerItem(
                screenHieght: displayHeight(context),
                screenWidth: displayWidth(context),
                icon: MdiIcons.calculator,
                text: 'Basic Calculator', 
                onTap: () => Navigator.pushReplacementNamed(context, Routes.basicCalculator)),

              Container(
                height: _height2,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 20.0),
                child: NativeAdmob(
                  // Your ad unit id
                  adUnitID: _adUnitID2,
                  controller: _nativeAdController2,
                  type: NativeAdmobType.banner,

                // Don't show loading widget when in loading state
                loading: Container(),
              ),
            ),

              _createDrawerItem(
                screenHieght: displayHeight(context),
                screenWidth: displayWidth(context),
                icon: MdiIcons.calendar,
                text: 'Date Calculators',
                onTap: () => Navigator.pushReplacementNamed(context, Routes.differenceBetweenDatesCalculator)),

              _createDrawerItem(
                screenHieght: displayHeight(context),
                screenWidth: displayWidth(context),
                icon: MdiIcons.atomVariant,
                text: 'Energy Calculator',
                onTap: () => Navigator.pushReplacementNamed(context, Routes.energyCalculator)),

              _createDrawerItem(
                screenHieght: displayHeight(context),
                screenWidth: displayWidth(context),
                icon: MdiIcons.waveform,
                text: 'Frequency Calculator',
                onTap: () => Navigator.pushReplacementNamed(context, Routes.frequencyCalculator)), 

              Container(
                height: _height3,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 20.0),
                child: NativeAdmob(
                  // Your ad unit id
                  adUnitID: _adUnitID3,
                  controller: _nativeAdController3,
                  type: NativeAdmobType.banner,

                // Don't show loading widget when in loading state
                loading: Container(),
              ),
            ),

              _createDrawerItem(
                screenHieght: displayHeight(context),
                screenWidth: displayWidth(context),
                icon: MdiIcons.ruler,
                text: 'Length Calculator',
                onTap: () => Navigator.pushReplacementNamed(context, Routes.lengthCalculator)),

              _createDrawerItem(
                screenHieght: displayHeight(context),
                screenWidth: displayWidth(context),
                icon: MdiIcons.batteryCharging,
                text: 'Power Calculator',
                onTap: () => Navigator.pushReplacementNamed(context, Routes.powerCalculator)),

              _createDrawerItem(
                screenHieght: displayHeight(context),
                screenWidth: displayWidth(context),
                icon: MdiIcons.weight,
                text: 'Weight Calculator',
                onTap: () => Navigator.pushReplacementNamed(context, Routes.weightCalculator)), 

              Container(
                height: _height4,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 20.0),
                child: NativeAdmob(
                  // Your ad unit id
                  adUnitID: _adUnitID4,
                  controller: _nativeAdController4,
                  type: NativeAdmobType.banner,

                // Don't show loading widget when in loading state
                loading: Container(),
              ),
            ),

              _createDrawerItem(
                screenHieght: displayHeight(context),
                screenWidth: displayWidth(context),
                icon: MdiIcons.speedometer,
                text: 'Speed Calculator',
                onTap: () => Navigator.pushReplacementNamed(context, Routes.speedCalculator)),

              _createDrawerItem(
                screenHieght: displayHeight(context),
                screenWidth: displayWidth(context),
                icon: MdiIcons.thermometer,
                text: 'Tempurature Calculator',
                onTap: () => Navigator.pushReplacementNamed(context, Routes.temperatureCalculator)),
              
              _createDrawerItem(
                screenHieght: displayHeight(context),
                screenWidth: displayWidth(context),
                icon: MdiIcons.clock,
                text: 'Time Calculator',
                onTap: () => Navigator.pushReplacementNamed(context, Routes.timeCalculator)),

              Container(
                height: _height1,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 20.0),
                child: NativeAdmob(
                  // Your ad unit id
                  adUnitID: _adUnitID1,
                  controller: _nativeAdController1,

                // Don't show loading widget when in loading state
                loading: Container(),
              ),
            ),
            ],
          ),
        ),
    );
  }



  Widget _createDrawerItem(
    {double screenWidth, double screenHieght, IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Align(
        child: Row( 
          children: <Widget>[
            IconTheme(
              data: IconThemeData(color: GC.globalColor), 
              child: Icon(icon, size: screenHieght * 0.03205)
              ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Text(text, style: TextStyle(fontSize: screenHieght * 0.02)), //0.0176
            )
          ],
        ),
      ),
      onTap: onTap,
      );
  }
}