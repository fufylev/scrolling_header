import 'package:flutter/material.dart';

const double maxHeight = 100.0;
const double minHeight = 36.0;
const double delta = maxHeight - minHeight;

class HeaderProvider extends ChangeNotifier {
  double _headerHeight = maxHeight;
  double _offsetTab1 = 0;
  double _offsetTab2 = 0;
  double _offsetTab3 = 0;

  double get headerHeight => _headerHeight;
  double get offsetTab1 => _offsetTab1;
  double get offsetTab2 => _offsetTab2;
  double get offsetTab3 => _offsetTab3;

  void setHeaderHeight(double value) async {
    _headerHeight = value;
    notifyListeners();
  }

  void setOffsetTab1(double value) {
    if (_offsetTab1 + value < 0) {
      _offsetTab1 = 0;
    } else if (_offsetTab1 + value > maxHeight - minHeight) {
      _offsetTab1 = _offsetTab1;
    } else {
      _offsetTab1 = _offsetTab1 + value;
    }

    notifyListeners();
  }

  void setOffsetTab2(double value) {
    if (_offsetTab2 + value < 0) {
      _offsetTab2 = 0;
    } else if (_offsetTab2 + value > maxHeight - minHeight) {
      _offsetTab2 = _offsetTab2;
    } else {
      _offsetTab2 = _offsetTab2 + value;
    }

    notifyListeners();
  }

  void setOffsetTab3(double value) {
    if (_offsetTab3 + value < 0) {
      _offsetTab3 = 0;
    } else if (_offsetTab3 + value > maxHeight - minHeight) {
      _offsetTab3 = _offsetTab3;
    } else {
      _offsetTab3 = _offsetTab3 + value;
    }

    notifyListeners();
  }

  void updateHeaderHeight(double value) async {
    if (_headerHeight + value < minHeight) {
      _headerHeight = minHeight;
    } else if (_headerHeight + value > maxHeight) {
      _headerHeight = maxHeight;
    } else {
      _headerHeight = _headerHeight + value;
    }

    notifyListeners();
  }
}
