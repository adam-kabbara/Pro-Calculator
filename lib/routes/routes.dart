import 'package:ProCalculator/calculators/BasicCalculator/BasicCalculator.dart';
import 'package:ProCalculator/calculators/TemperatureCalculator/TempCalculator.dart';
import 'package:ProCalculator/calculators/AngleCalculator/AngleCalculator.dart';
import 'package:ProCalculator/calculators/LengthCalculator/LengthCalculator.dart';
import 'package:ProCalculator/calculators/TimeCalculator/TimeCalculator.dart';
import 'package:ProCalculator/calculators/SpeedCalculator/SpeedCalculator.dart';
import 'package:ProCalculator/calculators/EnergyCalculator/EnergyCalculator.dart';
import 'package:ProCalculator/calculators/PowerCalculator/PowerCalculator.dart';
import 'package:ProCalculator/calculators/FrequencyCalculator/FrequencyCalculator.dart';
import 'package:ProCalculator/calculators/AreaCalculator/AreaCalculator.dart';
import 'package:ProCalculator/calculators/WeightCalculator/WeightCalculator.dart';
import 'package:ProCalculator/calculators/CalenderCalculator/AddSubtractDays.dart';
import 'package:ProCalculator/calculators/CalenderCalculator/DifferenceBetweenDatesCalculator.dart';
import 'package:ProCalculator/settings.dart';

class Routes{
  static const String basicCalculator = BasicCalculatorPage.routeName;
  static const String temperatureCalculator = TemperatureCalculatorPage.routeName;
  static const String angleCalculator = AngleCalculatorPage.routeName;
  static const String lengthCalculator = LengthCalculatorPage.routeName;
  static const String timeCalculator = TimeCalculatorPage.routeName;
  static const String speedCalculator = SpeedCalculatorPage.routeName;
  static const String energyCalculator = EnergyCalculatorPage.routeName;
  static const String powerCalculator = PowerCalculatorPage.routeName;
  static const String frequencyCalculator = FrequencyCalculatorPage.routeName;
  static const String areaCalculator = AreaCalculatorPage.routeName;
  static const String weightCalculator = WeightCalculatorPage.routeName;
  static const String addSubtractDaysCalculator = ASDaysCalculatorPage.routeName;
  static const String differenceBetweenDatesCalculator = DifferenceBetweenDatesPage.routeName;
  static const String settings = SettingsPage.routeName;

}