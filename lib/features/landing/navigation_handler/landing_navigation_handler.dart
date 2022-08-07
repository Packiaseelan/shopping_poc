part of '../coordinator/landing_coordinator.dart';

abstract class ILandingNavigationHandler {
  void navigateToCart();
}

class LandingNavigationHandler extends ILandingNavigationHandler {
  @override
  void navigateToCart() {
    NavigationManager.navigateTo('global-cart', NavigationType.Push);
  }
}