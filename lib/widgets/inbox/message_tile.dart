import 'package:flutter/material.dart';

import '../../models/message.dart';
import '../../utilities/constants.dart';
import 'picture.dart';

///
class InboxMessageTile extends StatelessWidget {
  ///
  final Message message;

  ///
  const InboxMessageTile({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: kPadding,
            right: kPadding,
            top: kPadding,
            bottom: kLargePadding,
          ),
          child: InboxPicture(URL: message.picture, name: message.name),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(top: kPadding),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${message.name}',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          SizedBox(
                            height: kSmallPadding,
                          ),
                          Text(
                            '${message.title}',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: kLargePadding),
                      child: Icon(Icons.star_border),
                    ),
                  ],
                ),
                SizedBox(
                  height: kSmallPadding,
                ),
                Text(
                  '${message.text}',
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
