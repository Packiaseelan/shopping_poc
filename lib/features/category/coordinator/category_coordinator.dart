import 'package:core/base_coordinator/base_coordinator.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:shopping_poc/features/common/product_model.dart';

part '../state/category_state.dart';
part '../data_provider/category_data_provider.dart';
part '../navigation_handler/category_navigation_handler.dart';

class CategoryCoordinator extends BaseCoordinator<CategoryState> {
  final ICategoryDataProvider _dataProvider;
  final ICategoryNavigationHandler _navigationHandler;

  CategoryCoordinator(
    this._dataProvider,
    this._navigationHandler,
  ) : super(
          CategoryState(pageTitle: 'Category'),
        );

  void initialize(Map<String, dynamic> args) {
    final id = args['category_id'];
    _fetchProducts(id);
  }

  void navigateToDetils(ProductModel product) {
    _navigationHandler.navigateToDetils(product);
  }

  void _fetchProducts(String id) {
    _dataProvider.getProducts(id).then((products) {
      state = state.copyWith(products: products);
    });
  }
}
