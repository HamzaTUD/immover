import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculation_data.dart';

class CalculationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CalculationData calculationData = Provider.of<CalculationData>(context);

    // Perform calculations based on the values from CalculationData
    double result = calculationData.preis * calculationData.grosse / calculationData.miete;

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Preis: ${calculationData.preis}'),
            Text('Große: ${calculationData.grosse}'),
            Text('Miete: ${calculationData.miete}'),
            SizedBox(height: 20),
            Text('Calculation Result: $result'),
          ],
        ),
      ),
    );
  }
}
