library common;

import 'package:core/ioc/di_container.dart';

import 'package:common/service/cart_service.dart';

class CommonModule {
  static void registerDependencies() {
    DIContainer.container.registerSingleton((container) => CartService());
  }
}
