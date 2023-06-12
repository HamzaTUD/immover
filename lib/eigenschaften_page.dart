import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculation_data.dart';

class EigenschaftenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CalculationData calculationData = Provider.of<CalculationData>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Eigenschaften'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Preis: ${calculationData.preis}'),
            Text('Große: ${calculationData.grosse}'),
            TextField(
              onChanged: (value) {
                calculationData.value1 = double.parse(value);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Value 1',
              ),
            ),
            TextField(
              onChanged: (value) {
                calculationData.value2 = double.parse(value);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Value 2',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/calculation');
              },
              child: Text('Calculate'),
            ),
          ],
        ),
      ),
    );
  }}
