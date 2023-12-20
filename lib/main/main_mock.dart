import 'package:flutter/material.dart';

import 'main_common.dart';
import '../app/service_locator/register_dependencies_mock.dart';

void main() async {
  await mainCommon(initializeServiceLocator,
      appName: 'mvvm_counter_devapp',
      showBanner: true,
      primarySwatch: Colors.red,
      appTitle: 'MVVM Counter App [MOCK Version]');
}
