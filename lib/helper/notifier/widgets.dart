import 'package:flutter/material.dart';

class NotifierWidgets {
  ValueNotifier<Widget> widgets = ValueNotifier<Widget>(Container());

  void setWidgets({Widget? child}) {
    widgets.value = child ??
        const SizedBox(
          width: 0,
          height: 0,
        );
  }

  void dispose() {
    widgets.dispose();
  }
}
