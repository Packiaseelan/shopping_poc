import 'package:core/base_classes/base_coordinator.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:shared_dependencies/module_identifiers.dart';
import 'package:shopping_poc/features/common/cart_service.dart';
import 'package:shopping_poc/features/common/category_model.dart';
import 'package:shopping_poc/global/route_manager/global_route_manager.dart';

part '../state/dashboard_state.dart';
part '../navigation_handler/dashboard_navigation_handler.dart';
part '../data_provider/dashboard_data_provider.dart';

class _Constants {
  static const pageTitle = 'Shopping App';
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
          ),
        );

  void initialize() {
    _updateBanner();
    _updateCategories();
  }

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
}
