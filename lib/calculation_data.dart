import 'package:flutter/foundation.dart';

class CalculationData extends ChangeNotifier {
  double _preis = 0;
  double _grosseM2 = 0;
  double _mietzinsProQM = 0;
  double _zinssatzProzent = 0;
  double _tilgungProzent = 0;

  double get preis => _preis;
  double get grosseM2 => _grosseM2;
  double get mietzinsProQM => _mietzinsProQM;
  double get zinssatzProzent => _zinssatzProzent;
  double get tilgungProzent => _tilgungProzent;

  set preis(double value) {
    _preis = value;
    notifyListeners();
  }

  set grosseM2(double value) {
    _grosseM2 = value;
    notifyListeners();
  }

  set mietzinsProQM(double value) {
    _mietzinsProQM = value;
    notifyListeners();
  }

  set zinssatzProzent(double value) {
    _zinssatzProzent = value;
    notifyListeners();
  }

  set tilgungProzent(double value) {
    _tilgungProzent = value;
    notifyListeners();
  }

  void updatePreisWithReduzierung(double kaufpreisReduzierung) {
    _preis -= kaufpreisReduzierung;
    notifyListeners();
  }

  // Calculation methods

  double calculateFaktor() {
    return preis / mietzinsProQM;
  }

  double calculateAnnuitatJahr() {
    double zinssatz = zinssatzProzent / 100;
    double tilgung = tilgungProzent / 100;
    return zinssatz * preis + tilgung * preis;
  }

  double calculateAnnuitatMo nat() {
    return calculateAnnuitatJahr() / 12;
  }

  double calculateDifferenzMonat() {
    return mietzinsProQM - calculateAnnuitatMonat();
  }

  double calculateDifferenzJahr() {
    return (mietzinsProQM * 12) - calculateAnnuitatJahr();
  }
}
