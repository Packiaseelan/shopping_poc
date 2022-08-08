part of '../coordinator/dashboard_coordinator.dart';

abstract class IDashboardNavigationHandler {
  void navigateToCart();
  void navigateToCategory(String categoryId);
}

class DashboardNavigationHandler extends IDashboardNavigationHandler {
  @override
  void navigateToCart() {
    NavigationManager.navigateTo('${ModuleIdentifiers.global}-${CartRoutes.cart}', NavigationType.Push);
  }

  @override
  void navigateToCategory(String categoryId) {
    NavigationManager.navigateTo(
      '${ModuleIdentifiers.grocery}-${GroceryRoutes.category}',
      NavigationType.Push,
      arguments: {'category_id': categoryId},
    );
  }
}
