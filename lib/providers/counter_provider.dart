import 'package:flutter/cupertino.dart';

class CounterProvider with ChangeNotifier {
  CounterProvider(String base) {
    if (int.tryParse(base) != null) {
      _contador = int.parse(base);
    }
  }
  int _contador = 15;
  int get contador => _contador;

  void increment() {
    _contador++;
    notifyListeners();
  }

  void decrement() {
    _contador--;
    notifyListeners();
  }
}
