import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'eigenschaften_page.dart';
import 'calculation_page.dart';
import 'calculation_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalculationData(),
      child: MaterialApp(
        title: 'Immover',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/eigenschaften': (context) => EigenschaftenPage(),
          '/calculation': (context) => CalculationPage(),
        },
      ),
    );
  }
}
