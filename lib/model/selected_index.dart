import 'package:flutter/widgets.dart';

class SelectedIndex with ChangeNotifier {
  var _index = 0;

  get index => _index;

  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
