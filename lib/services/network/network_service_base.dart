import '../../models/message.dart';

///
abstract class NetworkService {
  ///
  Future<List<Message>> getMessages();
}
