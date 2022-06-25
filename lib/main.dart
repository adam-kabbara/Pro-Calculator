import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:ProCalculator/routes/routes.dart';
import 'package:ProCalculator/calculators/BasicCalculator/BasicCalculator.dart';
import 'package:ProCalculator/calculators/AngleCalculator/AngleCalculator.dart';
import 'package:ProCalculator/calculators/LengthCalculator/LengthCalculator.dart';
import 'package:ProCalculator/calculators/TemperatureCalculator/TempCalculator.dart';
import 'package:ProCalculator/calculators/TimeCalculator/TimeCalculator.dart';
import 'package:ProCalculator/calculators/SpeedCalculator/SpeedCalculator.dart';
import 'package:ProCalculator/calculators/EnergyCalculator/EnergyCalculator.dart';
import 'package:ProCalculator/calculators/PowerCalculator/PowerCalculator.dart';
import 'package:ProCalculator/calculators/FrequencyCalculator/FrequencyCalculator.dart';
import 'package:ProCalculator/calculators/AreaCalculator/AreaCalculator.dart';
import 'package:ProCalculator/calculators/WeightCalculator/WeightCalculator.dart';
import 'package:ProCalculator/calculators/CalenderCalculator/AddSubtractDays.dart';
import 'package:ProCalculator/calculators/CalenderCalculator/DifferenceBetweenDatesCalculator.dart';
import 'settings.dart';
import 'package:ProCalculator/ad_manager.dart';
import 'package:firebase_admob/firebase_admob.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  Future<void> _initAdMob() {
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

  @override
  void initState() {
    _initAdMob();
    print('initalizing ads');
    super.initState();
  }

  @override
  Widget build(BuildContext context){    
  
    SystemChrome.setPreferredOrientations([  // disable orientation
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    return MaterialApp(
      title: 'Pro Calculator',
      theme: ThemeData(
        primaryColor: GC.globalColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BasicCalculatorPage(),
      routes: {
        Routes.basicCalculator: (context) => BasicCalculatorPage(),
        Routes.temperatureCalculator: (context) => TemperatureCalculatorPage(),
        Routes.angleCalculator: (context) => AngleCalculatorPage(),
        Routes.lengthCalculator: (context) => LengthCalculatorPage(),
        Routes.timeCalculator: (context) => TimeCalculatorPage(),
        Routes.speedCalculator: (context) => SpeedCalculatorPage(),
        Routes.energyCalculator: (context) => EnergyCalculatorPage(),
        Routes.powerCalculator: (context) => PowerCalculatorPage(),
        Routes.frequencyCalculator: (context) => FrequencyCalculatorPage(),
        Routes.areaCalculator: (context) => AreaCalculatorPage(),
        Routes.weightCalculator: (context) => WeightCalculatorPage(),
        Routes.addSubtractDaysCalculator: (context) => ASDaysCalculatorPage(),
        Routes.differenceBetweenDatesCalculator: (context) => DifferenceBetweenDatesPage(),
        Routes.settings: (context) => SettingsPage()
      },
    );
  }
}
