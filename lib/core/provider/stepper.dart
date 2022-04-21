import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class StepperState extends ChangeNotifier {
  int selectedIndex = 0;
  bool goNext = false;
  bool goPrevious = false;

  changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  previous(int index) {
    print(index);
    print("Previous clicke==");
    if (index >= 0) {
      index--;
      goPrevious = true;
      goNext = false;
    }
  }

  next(int index) {
    if (index <= 1) {
      index++;
      goPrevious = false;
      goNext = true;
    }
  }
}
