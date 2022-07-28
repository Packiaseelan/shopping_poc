import 'dart:async';

import 'package:core/base_classes/base_coordinator.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:shopping_poc/features/common/cart_service.dart';
import 'package:shopping_poc/features/common/product_model.dart';

part '../state/category_state.dart';
part '../data_provider/category_data_provider.dart';
part '../navigation_handler/category_navigation_handler.dart';

class _Constants {
  static const cartCategoryKey = 'category';
}

class CategoryCoordinator extends BaseCoordinator<CategoryState> {
  final ICategoryDataProvider _dataProvider;
  final ICategoryNavigationHandler _navigationHandler;
  final CartService _cart;

  final StreamController<ProductModel> streamController = StreamController.broadcast();

  CategoryCoordinator(
    this._dataProvider,
    this._navigationHandler,
    this._cart,
  ) : super(
          CategoryState(pageTitle: 'Category'),
        );

  void initialize(Map<String, dynamic> args) {
    final id = args['category_id'];
    _fetchProducts(id);
    _addListener();
  }

  void _addListener() {
    _cart.addStreamController(_Constants.cartCategoryKey);
    final stream = _cart.getStream(_Constants.cartCategoryKey)!;
    stream.listen((event) {
      final products = state.products;
      final product  = products.firstWhere((e) => e.id == event.id);
      product.quantity = event.quantity;
      state = state.copyWith(products: products);
     });
  }

  @override
  void dispose() {
    _cart.removeStreamCotroller(_Constants.cartCategoryKey);
    super.dispose();
  }

  void navigateToDetils(ProductModel product) {
    _navigationHandler.navigateToDetils(product);
  }

  void addProduct(ProductModel product) {
    _cart.addProduct(product);
  }

  void removeProduct(ProductModel product) {
    _cart.removeProduct(product);
  }

  void _fetchProducts(String id) {
    _dataProvider.getProducts(id).then((products) {
      _updateQuantity(products);
    });
  }

  void _updateQuantity(List<ProductModel> products) {
    for (var p in _cart.products) {
      var catProds = products.where((e) => e.id == p.id);
      if (catProds.isNotEmpty) {
        var a = catProds.first;
        a.quantity = p.quantity;
      }
    }
    state = state.copyWith(products: products);
  }
}
