import 'package:flutter/material.dart';

import '../models/message.dart';
import '../services/network/network_service_base.dart';
import '../services/service_locator.dart';
import '../utilities/constants.dart';

///
class InboxScreen extends StatelessWidget {
  final _networkService = serviceLocator<NetworkService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: SafeArea(
        child: FutureBuilder<List<Message>>(
            future: _networkService.getMessages(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final data = snapshot.data!;
                  return ListView.separated(
                    itemCount: data.length,
                    separatorBuilder: (_, __) => Padding(
                      padding: const EdgeInsets.only(
                          left: kPictureSize + 2 * kPadding),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                      ),
                    ),
                    itemBuilder: (context, index) {
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
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  shape: BoxShape.circle),
                              width: kPictureSize,
                              height: kPictureSize,
                              child: ClipOval(
                                child: Image.network(
                                  data[index].picture,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, exception, stackTrace) {
                                    return Center(
                                      child: Text(
                                        data[index].name[0],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(color: Colors.white),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: kPadding),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${data[index].name}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1,
                                            ),
                                            SizedBox(
                                              height: kSmallPadding,
                                            ),
                                            Text(
                                              '${data[index].title}',
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: kLargePadding),
                                        child: Icon(Icons.star_border),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: kSmallPadding,
                                  ),
                                  Text(
                                    '${data[index].text}',
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('No messages yet.'),
                  );
                }
              }
              return Center(
                child: Text('Something went wrong.'),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent,
        onPressed: () {},
        tooltip: 'Increment',
        child: Image.asset(
          'assets/images/ic_add_black.png',
          width: kIconSize,
          height: kIconSize,
        ),
      ),
    );
  }
}
