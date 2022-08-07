import 'dart:async';

import 'package:core/base_classes/base_coordinator.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:shared_dependencies/module_identifiers.dart';
import 'package:shopping_poc/global/route_manager/global_route_manager.dart';

part '../navigation_handler/splash_navigation_handler.dart';
part '../state/splash_state.dart';

class _Constants {
  static const appName = 'Shopping App';
}

class SplashCoordinator extends BaseCoordinator<SplashState> {
  final ISplashNavigationHandler _navigationHandler;

  SplashCoordinator(this._navigationHandler)
      : super(
          SplashState(
            appName: _Constants.appName,
          ),
        );

  void initialize() {
    Timer(const Duration(seconds: 1), () {
      _navigationHandler.navigateToDashboard();
    });
  }
}
