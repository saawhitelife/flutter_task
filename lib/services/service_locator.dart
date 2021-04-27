import 'package:get_it/get_it.dart';

import 'network/network_service_base.dart';
import 'network/network_service_implementation.dart';

///
final serviceLocator = GetIt.instance;

///
void setupServices() {
  serviceLocator
      .registerLazySingleton<NetworkService>(() => NetworkServiceImpl());
}
