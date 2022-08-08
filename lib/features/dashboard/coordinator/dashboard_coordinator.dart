import 'package:common/models/category_model.dart';
import 'package:common/models/product_model.dart';
import 'package:common/service/cart_service.dart';
import 'package:core/base_classes/base_coordinator.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:shared_dependencies/module_identifiers.dart';

import 'package:shopping_poc/features/common/mock_data/mock_data.dart';
import 'package:shopping_poc/global/route_manager/global_route_manager.dart';

part '../state/dashboard_state.dart';
part '../navigation_handler/dashboard_navigation_handler.dart';
part '../data_provider/dashboard_data_provider.dart';

class _Constants {
  static const pageTitle = 'Shopping App';
  static const dashboardKey = 'dashboard';
}

class DashboardCoordinator extends BaseCoordinator<DashboardState> {
  final IDashboardNavigationHandler _navigationHandler;
  final IDashboardDataProvider _dataProvider;
  final CartService _cart;

  DashboardCoordinator(
    this._navigationHandler,
    this._dataProvider,
    this._cart,
  ) : super(
          DashboardState(
            pageTitle: _Constants.pageTitle,
            trendingNearYou: TrendingNearYouState(title: 'Trending Near You'),
          ),
        );

  void initialize() {
    _addListener();
    _updateBanner();
    _updateCategories();
    _getTrendings();
  }

  void _addListener() {
    _cart.addStreamController(_Constants.dashboardKey);
    final stream = _cart.getStream(_Constants.dashboardKey)!;
    stream.listen((event) {
      final products = state.trendingNearYou.trendings;

      if (event != null) {
        final index = products.indexWhere((p) => p.id == event.id);
        if (index > 0) {
          products[index].quantity = event.quantity;
        }
      } else {
        for (var prod in products) {
          prod.quantity = 0;
        }
      }

      state = state.copyWith(
        trendingNearYou: state.trendingNearYou.copyWith(trendings: products),
      );
    });
  }

  @override
  void dispose() {
    _cart.removeStreamCotroller(_Constants.dashboardKey);
    super.dispose();
  }

  void addProduct(ProductModel product) {
    _cart.addProduct(product);
  }

  void removeProduct(ProductModel product) {
    _cart.removeProduct(product);
  }

  void clearCart() => _cart.clearCart();

  void navigateToCart() {
    _navigationHandler.navigateToCart();
  }

  void navigateToCategory(String id) {
    _navigationHandler.navigateToCategory(id);
  }

  void _updateBanner() {}

  void _updateCategories() {
    _dataProvider.fetchCategories().then((categories) {
      state = state.copyWith(categories: categories);
    });
  }

  void _getTrendings() {
    state = state.copyWith(
      trendingNearYou: state.trendingNearYou.copyWith(
        isLoading: true,
      ),
    );
    _dataProvider.fetchTrendingNearYou().then((value) {
      for (var p in _cart.products) {
        var catProds = value.where((e) => e.id == p.id);
        if (catProds.isNotEmpty) {
          var a = catProds.first;
          a.quantity = p.quantity;
        }
      }

      state = state.copyWith(
        trendingNearYou: state.trendingNearYou.copyWith(
          isLoading: false,
          trendings: value,
        ),
      );
    });
  }
}
