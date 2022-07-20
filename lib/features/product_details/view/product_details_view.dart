import 'package:core/base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shopping_poc/features/product_details/coordinator/product_details_coordinator.dart';

class ProductDetailsView extends StatelessWidget {
  final Map<String, dynamic> args;
  const ProductDetailsView({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailsCoordinator, ProductDetailsState>(
      setupCoordinator: (coordinator) => coordinator.initialize(args),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, ProductDetailsState state, ProductDetailsCoordinator coordinator) {
    return Scaffold(
      appBar: AppBar(title: Text(state.pageTitle)),
    );
  }
}
