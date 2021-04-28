import 'package:flutter/material.dart';
import '../../utilities/constants.dart';

///
class InboxFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.cyanAccent,
      onPressed: () {},
      tooltip: 'Increment',
      child: Image.asset(
        'assets/images/ic_add_black.png',
        width: kIconSize,
        height: kIconSize,
      ),
    );
  }
}
