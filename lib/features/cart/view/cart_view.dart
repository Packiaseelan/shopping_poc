import 'package:core/base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shopping_poc/features/cart/coordinator/cart_coordinator.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CartCoordinator, CartState>(
      setupCoordinator: (coordinator) => coordinator.initialize(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, CartState state, CartCoordinator coordinator) {
    return  Scaffold(
      appBar: AppBar(title: Text(state.pageTitle)),
      body: const Center(child: Text('No items in your cart')),
    );
  }
}
