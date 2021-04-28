import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../models/message.dart';
import 'network_service_base.dart';

///
class NetworkServiceImpl implements NetworkService {
  Future<List<Message>> getMessages() async {
    final response = await http.get(
      Uri(
        scheme: 'https',
        host: 'raw.githubusercontent.com',
        path: 'vyatsykiv/Flutter-Task/main/users.json',
      ),
    );
    if (response.body.isNotEmpty) {
      return jsonDecode(response.body)
          .map<Message>((message) => Message.fromJson(message))
          .toList();
    } else {
      return [];
    }
  }
}
