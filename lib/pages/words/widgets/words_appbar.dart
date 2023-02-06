import 'package:flutter/material.dart';

class UIWordsAppBar extends AppBar {
  UIWordsAppBar({Key? key}) : super(key: key);

  @override
  State<UIWordsAppBar> createState() => _UIWordsAppBarState();
}

class _UIWordsAppBarState extends State<UIWordsAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Startup Name Generator"),
    );
  }
}
