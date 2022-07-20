import 'dart:async';

import 'package:core/navigation/i_navigation_handler.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_poc/app.dart';
import 'package:shopping_poc/global_module_initializer.dart';
import 'package:shopping_poc/route_manager/app_route_manager.dart';

Future<Widget> _initialSetup(String appTitle, Widget homeWidget) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  _registerDependencies();
  _registerNavigation();
  return ShoppingPocApp(
    appTitle: appTitle,
    homeWidget: homeWidget,
  );
}

void runTheApp(String appTitle, Widget homeWidget) async {
  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      var app = await _initialSetup(appTitle, homeWidget);
      runApp(ProviderScope(child: app));
    },
    (error, stackTrace) {},
  );
}

void _registerNavigation() {
  NavigationManager.registerRouteManager('app', AppRouteManager());
}

void _registerDependencies() {
  NavigationManager(DefaultNavigationHandler());
  GlobalModule.registerDependencies();
}
