import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UIFavAppBar extends AppBar {
  UIFavAppBar({Key? key})
      : super(
          key: key,
        );

  @override
  State<UIFavAppBar> createState() => _UIFavAppBarState();
}

class _UIFavAppBarState extends State<UIFavAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Favourite Words'),
      systemOverlayStyle: SystemUiOverlayStyle.dark, // Status bar color
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Padding(
          padding: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            'assets/images/ic_left_arrow.svg',
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
