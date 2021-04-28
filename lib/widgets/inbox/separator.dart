import 'package:flutter/material.dart';
import '../../utilities/constants.dart';

///
class InboxSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kPictureSize + 2 * kPadding),
      child: Divider(
        color: Colors.grey,
        thickness: 1.5,
      ),
    );
  }
}
