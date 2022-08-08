library cart;

import 'package:common/service/cart_service.dart';
import 'package:core/ioc/di_container.dart';

import 'package:cart/features/cart/coordinator/cart_coordinator.dart';

class CartModule {
  static void registerDependencies() {
    DIContainer.container.registerFactory(
      (container) => CartCoordinator(
        container.resolve<CartService>(),
      ),
    );
  }
}
