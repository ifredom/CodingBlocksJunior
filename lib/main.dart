import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:coding_blocks_junior/app/locator.dart';
import 'package:coding_blocks_junior/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding Blocks Junior',
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator.builder(
        router: Router(),
        navigatorKey: locator<NavigationService>().navigatorKey,
        builder: (context, extendedNav) => Theme(
          data: ThemeData(
            fontFamily: 'Gilroy',
            primaryColor: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          child: SafeArea(child: extendedNav),
        ),
      ),
    );
  }
}
