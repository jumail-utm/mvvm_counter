export '../../../services/services.dart';

import 'package:map_mvvm/service_locator.dart';

import '../../../ui/screens/main/main_viewmodel.dart';
import '../../../ui/screens/home/home_viewmodel.dart';
import '../../ui/screens/login/login_viewmodel.dart';

final locator = ServiceLocator.locator;

void registerCommonDependencies() {
// Register Viewmodels
  locator.registerLazySingleton<MainViewmodel>(() => MainViewmodel());
  locator.registerLazySingleton<HomeViewmodel>(() => HomeViewmodel());
  locator.registerLazySingleton<LoginViewmodel>(() => LoginViewmodel());
}
