import 'package:mvvm_counter/services/authentication/authentication_service_mock.dart';

import 'service_locator.dart';

Future<void> initializeServiceLocator() async {
  locator.registerLazySingleton<ServiceInitializer>(() => ServiceInitializer());

  final serviceInitializer = locator<ServiceInitializer>();
  await serviceInitializer.init();

  // Register Services
  locator.registerLazySingleton<CounterService>(() => CounterServiceMock());

  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceMock());

  registerCommonDependencies();
}
