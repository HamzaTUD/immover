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
            Text('Große: ${calculationData.grosseM2}'),
            TextField(
              onChanged: (value) {
                calculationData.zinssatzProzent = double.parse(value);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Zinssatz in Prozent',
              ),
            ),
            TextField(
              onChanged: (value) {
                calculationData.tilgungProzent = double.parse(value);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tilgung in Prozent',
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
