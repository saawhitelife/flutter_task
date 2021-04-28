import 'package:flutter/material.dart';

import '../models/message.dart';
import '../services/network/network_service_base.dart';
import '../services/service_locator.dart';
import '../widgets/inbox/app_bar.dart';
import '../widgets/inbox/fab.dart';
import '../widgets/inbox/message_tile.dart';
import '../widgets/inbox/separator.dart';

///
class InboxScreen extends StatelessWidget {
  final _networkService = serviceLocator<NetworkService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InboxAppBar(),
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
                    separatorBuilder: (_, __) => InboxSeparator(),
                    itemBuilder: (context, index) {
                      return InboxMessageTile(message: data[index]);
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
      floatingActionButton: InboxFAB(),
    );
  }
}
