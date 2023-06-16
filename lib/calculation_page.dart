import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'calculation_data.dart';

class CalculationPage extends StatelessWidget {
  final TextEditingController kaufpreisReduzierungController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CalculationData calculationData = Provider.of<CalculationData>(context);

    // Perform calculations based on the values from CalculationData
    double faktor = calculationData.calculateFaktor();
    double annuitatJahr = calculationData.calculateAnnuitatJahr();
    double annuitatMonat = calculationData.calculateAnnuitatMonat();
    double differenzMonat = calculationData.calculateDifferenzMonat();
    double differenzJahr = calculationData.calculateDifferenzJahr();

    return Scaffold(
      appBar: AppBar(
        title: Text('Calculation'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResultBox(name: 'Faktor', result: faktor),
              ResultBox(name: 'Annuität pro Jahr', result: annuitatJahr),
              ResultBox(name: 'Annuität pro Monat', result: annuitatMonat),
              ResultBox(
                name: 'Differenz von Mietzins pro Monat zu Annuität Pro Monat',
                result: differenzMonat,
              ),
              ResultBox(
                name: 'Differenz von Mietzins pro Jahr zu Annuität pro Jahr',
                result: differenzJahr,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: kaufpreisReduzierungController,
                  onChanged: (value) {
                    double kaufpreisReduzierung = double.tryParse(value) ?? 0;
                    calculationData.updatePreisWithReduzierung(kaufpreisReduzierung);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Kaufpreis-Reduzierung',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultBox extends StatelessWidget {
  final String name;
  final double result;

  const ResultBox({required this.name, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Result: $result',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
