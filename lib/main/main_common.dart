import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'my_app.dart';

Future<void> mainCommon(initializeServiceLocator,
    {appName, showBanner, primarySwatch, appTitle}) async {
  final widgetBinding = WidgetsFlutterBinding.ensureInitialized();

  // Keep splash screen until initialization has completed
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  await initializeServiceLocator();

  // whenever your initialization is completed, remove the splash screen
  FlutterNativeSplash.remove();

  runApp(
    MyApp(
      appName: appName,
      appTitle: appTitle,
      showBanner: showBanner,
      primarySwatch: primarySwatch,
    ),
  );
}
