import 'package:flutter/material.dart';

import 'package:cart/cart.dart';
import 'package:cart/route_manager/cart_route_manager.dart';
import 'package:common/common.dart';
import 'package:common/service/cart_service.dart';
import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/storage/i_storage_service.dart';
import 'package:grocery/grocery.dart';
import 'package:grocery/route_manager/grocery_route_manager.dart';
import 'package:network_manager/network_manager.dart';
import 'package:shared_dependencies/shared_dependencies.dart';
import 'package:task_manager/task_manager_module.dart';
import 'package:widget_library/theme/hex_theme.dart';

import 'package:shopping_poc/features/landing/coordinator/landing_coordinator.dart';
import 'package:shopping_poc/features/product_details/coordinator/product_details_coordinator.dart';
import 'package:shopping_poc/features/splash/coordinator/splash_coordinator.dart';
import 'package:shopping_poc/global/route_manager/global_route_manager.dart';

class GlobalAppInitializer {
  Future<ThemeData> appInitializer() async {
    final theme = HexTheme();
    await theme.initialize();

    NavigationManager.registerRouteManager(ModuleIdentifiers.global, GlobalRouteManager());
    NavigationManager.registerRouteManager(ModuleIdentifiers.grocery, GroceryRouteManager());
    NavigationManager.registerRouteManager(ModuleIdentifiers.cart, CartRouteManager());

    final storageService = DIContainer.container.resolve<IStorageService>();

    TaskManagerModule.registerDependencies(
      secureStorageService: storageService,
    );

    _initializeFeatureModules();
    _initializeEnvironmentBasedDependencies();

    CommonModule.registerDependencies();
    CartModule.registerDependencies();
    GroceryModule.registerDependencies();

    return Future.value(theme.defaultTheme);
  }

  void _initializeFeatureModules() {
    DIContainer.container.registerFactory(
      (container) => SplashCoordinator(
        SplashNavigationHandler(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => ProductDetailsCoordinator(
        container.resolve<CartService>(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => LandingCoordinator(
        LandingNavigationHandler(),
      ),
    );
  }

  void _initializeEnvironmentBasedDependencies() async {
    final storageService = DIContainer.container.resolve<IStorageService>();
    await NetworkManager.registerDependencies(secureStorage: storageService, accessTokenKey: '');
  }
}
