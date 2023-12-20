import 'package:flutter/material.dart';

import '../app/app.dart';

class MyApp extends StatelessWidget {
  final String appName;
  final String appTitle;
  final bool showBanner;
  final MaterialColor primarySwatch;

  const MyApp({
    this.appName = 'mvvm_counter',
    this.appTitle = 'MVVM Counter App',
    this.showBanner = false,
    this.primarySwatch = Colors.blue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: showBanner,
      theme: ThemeData(
        primarySwatch: primarySwatch,
      ),
      initialRoute: Routes.main,
      // initialRoute: Routes.home,
      onGenerateRoute: Routes.createRoute,
      // onGenerateInitialRoutes: (route) =>
      //     [if (route == Routes.home) HomeScreen.route(appTitle)],
    );
  }
}
