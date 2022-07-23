import 'package:core/base_coordinator/base_coordinator.dart';
import 'package:shopping_poc/features/common/cart_service.dart';
import 'package:shopping_poc/features/common/product_model.dart';

part '../state/cart_state.dart';

class _Constants {
  static const cartCartKey = 'cart';
}

class CartCoordinator extends BaseCoordinator<CartState> {
  final CartService _cart;

  CartCoordinator(
    this._cart,
  ) : super(
          CartState(
            pageTitle: 'Cart',
          ),
        );

  void initialize() {
    _fetchCartItems();
    _addListener();
  }

  void _addListener() {
    _cart.addStreamController(_Constants.cartCartKey);
    final stream = _cart.getStream(_Constants.cartCartKey)!;
    stream.listen((event) {
      var product = state.products;
      state = state.copyWith(products: product);
    });
  }

  @override
  void dispose() {
    _cart.removeStreamCotroller(_Constants.cartCartKey);
    super.dispose();
  }

  void addProduct(ProductModel product) {
    _cart.addProduct(product);
  }

  void removeProduct(ProductModel product) {
    _cart.removeProduct(product);
  }

  void _fetchCartItems() {
    // TODO - fetch from server.

    state = state.copyWith(products: _cart.products);
  }
}
