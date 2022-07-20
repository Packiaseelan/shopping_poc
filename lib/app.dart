import 'package:core/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shopping_poc/config/app_theme.dart';

class ShoppingPocApp extends StatelessWidget {
  final String appTitle;
  final Widget homeWidget;

  const ShoppingPocApp({
    Key? key,
    required this.appTitle,
    required this.homeWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appTitle,
      theme: AppTheme.of(context),
      home: homeWidget,
      onGenerateRoute: NavigationManager.getRoute,
    );
  }
}
