import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider =
    ChangeNotifierProvider<HomeProvider>((ref) => HomeProvider());

class HomeProvider extends ChangeNotifier {
  int indexSelected = 0;
  List<Color> colorData = [Colors.blue, Colors.red, Colors.purple];
  String text = 'Hello World';
  TextEditingController controller = TextEditingController();
  void selectIndex(int val) {
    indexSelected = val;
    notifyListeners();
  }

  void changeValue(String val) {
    text = val;
    notifyListeners();
  }
}
