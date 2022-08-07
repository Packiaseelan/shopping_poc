import 'package:flutter/material.dart';

import 'package:core/base_classes/base_view.dart';
import 'package:widget_library/scaffold/hex_scaffold.dart';

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
    return HexScaffold(
      themeName: 'cart_screen',
      appBarBuilder: (context) => _buildAppBar(state),
      builder: (context) => _buildBody(context, state, coordinator),
    );
  }

  PreferredSizeWidget _buildAppBar(CartState state) {
    return AppBar(
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(state.pageTitle),
          Text(state.subTitile),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, CartState state, CartCoordinator coordinator) {
    return state.products.isEmpty ? _buildNoItem() : _buildCartItems(state, coordinator);
  }

  Widget _buildCartItems(CartState state, CartCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.circular(2)),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.network(
                          state.products[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Text(
                        '₹ ${state.products[index].price * state.products[index].quantity}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      PillShapeCounter(
                        value: state.products[index].quantity,
                        onUpdate: (v) => coordinator.crement(v, state.products[index]),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildNoItem() {
    return const Center(child: Text('No items in your cart'));
  }
}

class PillShapeCounter extends StatelessWidget {
  final int value;
  final Function(int) onUpdate;

  const PillShapeCounter({
    Key? key,
    required this.value,
    required this.onUpdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 70,
      decoration: BoxDecoration(
        color: const Color(0xFFA8D29F).withOpacity(0.25),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFA8D29F)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconButton(Icons.remove, -1),
          Text(
            '$value',
            style: const TextStyle(fontSize: 12, color: Colors.green),
          ),
          _iconButton(Icons.add, 1, isLeft: false),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, int crement, {bool isLeft = true}) {
    return ClipRRect(
      borderRadius: BorderRadius.horizontal(
        left: isLeft ? const Radius.circular(15) : Radius.zero,
        right: !isLeft ? const Radius.circular(15) : Radius.zero,
      ),
      child: InkWell(
        onTap: () => onUpdate(crement),
        child: Container(
          height: 22,
          decoration: const BoxDecoration(color: Colors.green),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Icon(
              icon,
              size: 12,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
