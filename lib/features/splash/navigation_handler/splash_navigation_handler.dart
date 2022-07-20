part of '../coordinator/splash_coordinator.dart';

abstract class ISplashNavigationHandler {
  void navigateToDashboard();
  void navigateToLogin();
}

class SplashNavigationHandler extends ISplashNavigationHandler {
  @override
  void navigateToDashboard() {
    NavigationManager.navigateTo('app-dashboard', NavigationType.Replace);
  }
  
  @override
  void navigateToLogin() {
    NavigationManager.navigateTo('app-login', NavigationType.Replace);
  }
}
