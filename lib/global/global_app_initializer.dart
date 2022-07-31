import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/storage/i_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:network_manager/network_manager.dart';
import 'package:shared_dependencies/shared_dependencies.dart';
import 'package:shopping_poc/features/cart/coordinator/cart_coordinator.dart';
import 'package:shopping_poc/features/category/coordinator/category_coordinator.dart';
import 'package:shopping_poc/features/common/cart_service.dart';
import 'package:shopping_poc/features/dashboard/coordinator/dashboard_coordinator.dart';
import 'package:shopping_poc/features/landing/coordinator/landing_coordinator.dart';
import 'package:shopping_poc/features/product_details/coordinator/product_details_coordinator.dart';
import 'package:shopping_poc/features/splash/coordinator/splash_coordinator.dart';
import 'package:shopping_poc/global/route_manager/global_route_manager.dart';
import 'package:task_manager/task_manager_module.dart';
import 'package:widget_library/theme/hex_theme.dart';

class GlobalAppInitializer {
  Future<ThemeData> appInitializer() async {
    final theme = HexTheme();
    await theme.initialize();

    NavigationManager.registerRouteManager(
      ModuleIdentifiers.global,
      GlobalRouteManager(),
    );

    final storageService = DIContainer.container.resolve<IStorageService>();

    TaskManagerModule.registerDependencies(
      secureStorageService: storageService,
    );

    _initializeFeatureModules();
    _initializeEnvironmentBasedDependencies();

    return Future.value(theme.defaultTheme);
  }

  void _initializeFeatureModules() {
    DIContainer.container.registerSingleton((container) => CartService());

    DIContainer.container.registerFactory(
      (container) => SplashCoordinator(
        SplashNavigationHandler(),
        SplashViewModel(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => DashboardCoordinator(
        DashboardNavigationHandler(),
        DashboardDataProvider(),
        container.resolve<CartService>(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => CartCoordinator(
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

    DIContainer.container.registerFactory(
      (container) => ProductDetailsCoordinator(
        container.resolve<CartService>(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => LandingCoordinator(),
    );
  }

  void _initializeEnvironmentBasedDependencies() async {
    final storageService = DIContainer.container.resolve<IStorageService>();
    await NetworkManager.registerDependencies(secureStorage: storageService, accessTokenKey: '');
  }
}
