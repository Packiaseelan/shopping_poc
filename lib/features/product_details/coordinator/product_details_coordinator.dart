import 'package:core/base_coordinator/base_coordinator.dart';

part '../state/product_details_state.dart';

class ProductDetailsCoordinator extends BaseCoordinator<ProductDetailsState> {
  ProductDetailsCoordinator()
      : super(
          ProductDetailsState(
            pageTitle: 'Product Details',
          ),
        );

  void initialize(Map<String, dynamic> args) {}
}
