import 'package:flutter/material.dart';

// for staging, the code is exactly the same. only the backend is different.
//  We do that with flavor. staging uses differerent google-service.json file

import 'main_common.dart';
import '../app/service_locator/register_dependencies_prod.dart';

void main() async {
  await mainCommon(initializeServiceLocator,
      appName: 'mvvm_counter_staging',
      showBanner: true,
      primarySwatch: Colors.pink,
      appTitle: 'MVVM Counter App [STAGING Version]');
}
