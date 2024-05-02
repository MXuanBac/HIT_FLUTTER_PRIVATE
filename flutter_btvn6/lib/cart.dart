import 'package:flutter_btvn6/data.dart';
import 'package:flutter/foundation.dart';

class cart with ChangeNotifier, DiagnosticableTreeMixin {
  int total = 0;
  int totalMoney = 0;
  final List<int> selectFood = List.generate(FoodData.listFoods.length, (index) => 0);

  void add(int id) {
    selectFood[id] ++;
    total++;
    totalMoney += FoodData.listFoods.elementAt(id).cost;
    notifyListeners();
  }

  void minus(int id) {
    selectFood[id] --;
    total--;
    totalMoney -= FoodData.listFoods.elementAt(id).cost;
    notifyListeners();
  }

  void reset() {
    for(int i=0; i<selectFood.length; i++) {
      if(selectFood[i]>0) {
        total -= selectFood[i];
        totalMoney -= total * FoodData.listFoods.elementAt(i).cost;
        selectFood[i] = 0;
      }
    }
    notifyListeners();
  }
}