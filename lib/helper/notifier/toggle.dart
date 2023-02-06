import 'package:flutter/material.dart';

class NotifierToggle {
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  NotifierToggle({bool? isCheck}) {
    toggle.value = isCheck ?? false;
  }

  void setToggle({bool? isCheck}) {
    if (isCheck != null) {
      toggle.value = isCheck;
    } else {
      toggle.value = !toggle.value;
    }
  }

  bool getToggle() {
    return toggle.value;
  }

  void dispose() {
    toggle.dispose();
  }
}
