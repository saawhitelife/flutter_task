import 'package:flutter/material.dart';
import '../../utilities/constants.dart';

///
class InboxAppBar extends StatelessWidget implements PreferredSizeWidget {
  ///
  final appBar = AppBar(
    actions: [
      Image.asset(
        'assets/images/ic_search_white.png',
        width: kIconSize,
        height: kIconSize,
      ),
      SizedBox(
        width: kLargePadding * 2,
      ),
      Image.asset(
        'assets/images/ic_check_circle_white.png',
        width: kIconSize,
        height: kIconSize,
      ),
      SizedBox(
        width: kLargePadding,
      ),
    ],
    leading: Container(),
    leadingWidth: kPictureSize,
    title: Text('Inbox'),
  );
  @override
  Widget build(BuildContext context) {
    return appBar;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => appBar.preferredSize;
}
