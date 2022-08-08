import 'package:flutter/material.dart';

import 'package:core/base_classes/base_view.dart';
import 'package:cart/mixins/bottom_cart_mixin.dart';
import 'package:widget_library/scaffold/hex_scaffold.dart';

import 'package:shopping_poc/features/product_details/coordinator/product_details_coordinator.dart';
import 'package:shopping_poc/features/widgets/add_to_cart_button.dart';

class ProductDetailsView extends StatelessWidget with BottomCart {
  final Map<String, dynamic> args;
  ProductDetailsView({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProductDetailsCoordinator, ProductDetailsState>(
      setupCoordinator: (coordinator) => coordinator.initialize(args),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, ProductDetailsState state, ProductDetailsCoordinator coordinator) {
    return HexScaffold(
      appBarBuilder: (context) => _buildAppBar(state),
      builder: (context) => _buildBody(context, state, coordinator),
      // bottomChild: const BottomCartView(),
      bottomChild: bottom(),
    );
  }

  PreferredSizeWidget _buildAppBar(ProductDetailsState state) {
    return AppBar(
      elevation: 0,
      title: Text(state.pageTitle),
    );
  }

  Widget _buildBody(BuildContext context, ProductDetailsState state, ProductDetailsCoordinator coordinator) {
    if (state.product == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(state.product!.image),
          Text(state.product!.name, style: Theme.of(context).textTheme.displayMedium),
          Text('₹ ${state.product!.price}', style: Theme.of(context).textTheme.displayLarge),
          const Text(
              'description description description description description description description description description description description description description description description description description description description description description description description description description '),
          AddToCartButtonWidget(
            value: state.product!.quantity,
            onAdd: () => coordinator.addProduct(),
            onRemove: () => coordinator.removeProduct(),
          )
        ],
      ),
    );
  }
}
