import 'package:core/base_coordinator/base_coordinator.dart';

part '../state/cart_state.dart';

class CartCoordinator extends BaseCoordinator<CartState> {
  CartCoordinator()
      : super(
          CartState(
            pageTitle: 'Cart',
          ),
        );

  void initialize() {}
}
