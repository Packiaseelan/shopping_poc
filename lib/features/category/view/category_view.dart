import 'package:core/base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shopping_poc/features/category/coordinator/category_coordinator.dart';
import 'package:shopping_poc/features/widgets/product_tile_widget.dart';

class CategoryView extends StatelessWidget {
  final Map<String, dynamic> args;
  const CategoryView({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CategoryCoordinator, CategoryState>(
      setupCoordinator: (coordinator) => coordinator.initialize(args),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, CategoryState state, CategoryCoordinator coordinator) {
    return Scaffold(
      appBar: AppBar(
        title: Text(state.pageTitle),
      ),
      body: state.products.isEmpty ? _buildEmpty(state) : _buildList(context, state, coordinator),
    );
  }

  Widget _buildList(BuildContext context, CategoryState state, CategoryCoordinator coordinator) {
    double cardWidth = MediaQuery.of(context).size.width * 0.3;
    double cardHeight = MediaQuery.of(context).size.height * 0.17;
    return GridView.count(
      childAspectRatio: cardWidth / cardHeight,
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10,
      children: List.generate(state.products.length, (index) {
        return InkWell(
          onTap: () => coordinator.navigateToDetils(state.products[index]),
          child: ProductTileWidget(
            product: state.products[index],
            add: coordinator.addProduct,
            remove: coordinator.removeProduct,
          ),
        );
      }),
    );
  }

  Widget _buildEmpty(CategoryState state) {
    return Center(
      child: Text('No Product availale for ${state.pageTitle}'),
    );
  }
}
