import 'package:eabd/models/counter_model.dart';
import 'package:flutter/material.dart';

class CounterViewModel with ChangeNotifier{
  final CounterModel _counterModel = CounterModel(counter: 0);
  int get counter => _counterModel.counter;
  void incrementCounter(){
    _counterModel.counter++;
    notifyListeners();
  }
}