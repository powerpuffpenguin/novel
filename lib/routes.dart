import 'package:flutter/material.dart';

class MyRoutes {
  MyRoutes._();
  static const String dev = "/dev";
  static const String home = "/home";

  static const String settings = "/settings";
  static const String settingsLanguage = "/settings/language";
  static const String settingsTheme = "/settings/theme";

  static const String help = "/help";
  static const String logs = "/logs";

  static bool clearRoutes(Route<dynamic> route) => false;
}
