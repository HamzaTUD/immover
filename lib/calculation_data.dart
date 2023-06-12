import 'package:flutter/foundation.dart';

class CalculationData extends ChangeNotifier {
  double _preis = 0;
  double _grosse = 0;
  double _miete = 0;
  double _value1 = 0;
  double _value2 = 0;

  double get preis => _preis;
  double get grosse => _grosse;
  double get miete => _miete;
  double get value1 => _value1;
  double get value2 => _value2;

  set preis(double value) {
    _preis = value;
    notifyListeners();
  }

  set grosse(double value) {
    _grosse = value;
    notifyListeners();
  }

  set miete(double value) {
    _miete = value;
    notifyListeners();
  }

  set value1(double value) {
    _value1 = value;
    notifyListeners();
  }

  set value2(double value) {
    _value2 = value;
    notifyListeners();
  }

  // You can define your calculations here based on the values provided.
  // Example calculation method:
  double calculateResult() {
    // Replace with your calculation logic
    return preis * grosse / miete;
  }
}
