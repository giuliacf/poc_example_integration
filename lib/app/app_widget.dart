import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poc_example_integration/utils/colors.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:intl/intl.dart';

final numberFormatter = NumberFormat.currency(symbol: "", decimalDigits: 0);
final currencyFormatter = NumberFormat.currency(symbol: "", decimalDigits: 2);

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: white,
        accentColor: aqua,
        primaryColor: lead,
        fontFamily: 'ItauDisplay',
      ),
      title: 'POC Example Integration',
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        defaultScale: true,
        minWidth: 450,
        defaultName: MOBILE,
        breakpoints: [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.resize(700, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
        ],
      ),
      initialRoute: '/splash',
    ).modular();
  }
}
