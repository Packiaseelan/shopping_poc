import 'dart:async';

import 'package:core/base_coordinator/base_coordinator.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';

part '../navigation_handler/splash_navigation_handler.dart';
part '../state/splash_state.dart';
part '../view_model/splash_view_model.dart';

class _Constants {
  static const appName = 'Shopping App';
}

class SplashCoordinator extends BaseCoordinator<SplashState> {
  final ISplashNavigationHandler _navigationHandler;
  final SplashViewModel _viewModel;

  SplashCoordinator(
    this._navigationHandler,
    this._viewModel,
  ) : super(
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
