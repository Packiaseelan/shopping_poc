import 'package:core/base_classes/base_coordinator.dart';
import 'package:shopping_poc/features/common/cart_service.dart';
import 'package:shopping_poc/features/common/models/product_model.dart';

part '../state/product_details_state.dart';

class _Constants {
  static const productDetails = 'productDetails';
}

class ProductDetailsCoordinator extends BaseCoordinator<ProductDetailsState> {
  final CartService _cart;

  ProductDetailsCoordinator(
    this._cart,
  ) : super(
          ProductDetailsState(
            pageTitle: 'Product Details',
          ),
        );

  void initialize(Map<String, dynamic> args) {
    final product = args['product'] as ProductModel;
    state = state.copyWith(product: product);
    _addListener();
  }

  void _addListener() {
    _cart.addStreamController(_Constants.productDetails);
    final stream = _cart.getStream(_Constants.productDetails)!;
    stream.listen((event) {
      var product = state.product;
      state = state.copyWith(product: product);
    });
  }

  @override
  void dispose() {
    _cart.removeStreamCotroller(_Constants.productDetails);
    super.dispose();
  }

  void addProduct() {
    _cart.addProduct(state.product!);
  }

  void removeProduct() {
    _cart.removeProduct(state.product!);
  }
}
