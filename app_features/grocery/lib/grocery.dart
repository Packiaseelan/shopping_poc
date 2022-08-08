library grocery;

import 'package:common/service/cart_service.dart';
import 'package:core/ioc/di_container.dart';
import 'package:grocery/features/category/coordinator/category_coordinator.dart';

import 'package:grocery/features/dashboard/coordinator/dashboard_coordinator.dart';

class GroceryModule {
  static void registerDependencies() {
    DIContainer.container.registerFactory(
      (container) => DashboardCoordinator(
        DashboardNavigationHandler(),
        DashboardDataProvider(),
        container.resolve<CartService>(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => CategoryCoordinator(
        CategoryDataProvider(),
        CategoryNavigationHandler(),
        container.resolve<CartService>(),
      ),
    );
  }
}
