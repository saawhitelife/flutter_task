import '../../models/message.dart';

///
// ignore: one_member_abstracts
abstract class NetworkService {
  ///
  Future<List<Message>> getMessages();
}
