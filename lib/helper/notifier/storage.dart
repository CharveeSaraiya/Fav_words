import 'package:flutter/material.dart';

class NotifierValueStorage {
  ValueNotifier<dynamic> storage = ValueNotifier<dynamic>("");

  NotifierValueStorage({dynamic data}) {
    storage.value = data;
  }

  void setValueStorage({required dynamic data}) {
    storage.value = data;
  }

  dynamic getValueStorage() {
    return storage.value;
  }

  void dispose() {
    storage.dispose();
  }
}
