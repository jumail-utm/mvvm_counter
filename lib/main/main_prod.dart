import 'package:flutter/material.dart';

import 'main_common.dart';
import '../app/service_locator/register_dependencies_prod.dart';

void main() async {
  await mainCommon(initializeServiceLocator,
      appName: 'mvvm_counter_app',
      showBanner: false,
      primarySwatch: Colors.blue,
      appTitle: 'MVVM Counter App');
}
