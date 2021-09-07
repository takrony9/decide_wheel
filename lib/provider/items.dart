import 'package:flutter/cupertino.dart';

class Items with ChangeNotifier {
  List _choices = [];
  List _firstEntry = [];
  List _index = List<int>.generate(50, (i) => i + 1);
  int _count;

  List get choices {
    return [..._choices];
  }

  int get count {
    return _count;
  }

  List get index {
    return [..._index];
  }

  List get firstChoices {
    return [..._firstEntry];
  }

  void addChoice(var choice) {
    _choices.add(choice);
    notifyListeners();
  }

  void addFirstChoice(var choice) {
    _firstEntry.add(choice);
    notifyListeners();
  }

  void setCount(int value) {
    _count = value;
    notifyListeners();
  }

  void resetSettings() {
    _count = 2;
    _firstEntry.clear();
    _choices.clear();
    notifyListeners();
  }
}
