import 'package:flutter/material.dart';

class NotifierRefresh {
  ValueNotifier<int> refresh = ValueNotifier<int>(0);

  void setRefresh() {
    int value = refresh.value;
    value++;
    refresh.value = value;
  }

  void dispose() {
    refresh.dispose();
  }
}
