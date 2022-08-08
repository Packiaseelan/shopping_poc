import 'package:common/models/product_model.dart';
import 'package:common/service/cart_service.dart';
import 'package:core/base_classes/base_coordinator.dart';

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
            subTitile : 'Review Cart'
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

  void crement(int value, ProductModel product) {
    if (value > 0) {
      addProduct(product);
    } else {
      removeProduct(product);
    }
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
