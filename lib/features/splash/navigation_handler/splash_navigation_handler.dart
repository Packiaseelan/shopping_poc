part of '../coordinator/splash_coordinator.dart';

abstract class ISplashNavigationHandler {
  void navigateToDashboard();
  void navigateToLogin();
}

class SplashNavigationHandler extends ISplashNavigationHandler {
  @override
  void navigateToDashboard() {
    NavigationManager.navigateTo(
      '${ModuleIdentifiers.global}-${GlobalRoutes.dashboard}',
      NavigationType.Replace,
    );
  }

  @override
  void navigateToLogin() {
    NavigationManager.navigateTo(
      '${ModuleIdentifiers.global}-${GlobalRoutes.login}',
      NavigationType.Replace,
    );
  }
}
