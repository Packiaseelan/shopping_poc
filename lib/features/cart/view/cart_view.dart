import 'package:core/base_classes/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shopping_poc/features/cart/coordinator/cart_coordinator.dart';
import 'package:shopping_poc/features/widgets/add_to_cart_button.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text(state.pageTitle)),
      body: _buildBody(context, state, coordinator),
    );
  }

  Widget _buildBody(BuildContext context, CartState state, CartCoordinator coordinator) {
    return state.products.isEmpty ? _buildNoItem() : _buildCartItems(state, coordinator);
  }

  Widget _buildCartItems(CartState state, CartCoordinator coordinator) {
    return ListView.builder(
      itemCount: state.products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(
                state.products[index].image,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(state.products[index].name),
                      Text('${state.products[index].price}'),
                    ],
                  ),
                  Text('₹ ${state.products[index].price * state.products[index].quantity}', style: Theme.of(context).textTheme.headline6,),
                  AddToCartButtonWidget(
                    value: state.products[index].quantity,
                    onAdd: () => coordinator.addProduct(state.products[index]),
                    onRemove: () => coordinator.removeProduct(state.products[index]),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNoItem() {
    return const Center(child: Text('No items in your cart'));
  }
}
