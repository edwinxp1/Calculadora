import 'package:flutter/material.dart';
import '../screens/calculator_screen.dart';
import '../screens/developer_info_screen.dart';

class Routes {
  static const String calculator = '/';
  static const String developerInfo = '/developer-info';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      calculator: (context) => const CalculatorScreen(),
      developerInfo: (context) => const DeveloperInfoScreen(),
    };
  }
}
