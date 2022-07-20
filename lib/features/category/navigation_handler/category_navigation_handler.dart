part of '../coordinator/category_coordinator.dart';

abstract class ICategoryNavigationHandler {
  void navigateToDetils(ProductModel product);
}

class CategoryNavigationHandler extends ICategoryNavigationHandler {
  @override
  void navigateToDetils(ProductModel product) {
    NavigationManager.navigateTo(
      'app-productDetails',
      NavigationType.Push,
      arguments: {'product': product},
    );
  }
}
