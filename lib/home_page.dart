import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculation_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Immover'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                Provider.of<CalculationData>(context, listen: false).preis = double.parse(value);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Preis',
              ),
            ),
            TextField(
              onChanged: (value) {
                Provider.of<CalculationData>(context, listen: false).grosse = double.parse(value);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Große',
              ),
            ),
            TextField(
              onChanged: (value) {
                Provider.of<CalculationData>(context, listen: false).miete = double.parse(value);
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Miete',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/eigenschaften');
              },
              child: Text('Eigenschaften'),
            ),
          ],
        ),
      ),
    );
  }
}
