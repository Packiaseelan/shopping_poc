import 'package:core/base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shopping_poc/config/app_theme.dart';
import 'package:shopping_poc/features/category/coordinator/category_coordinator.dart';
import 'package:shopping_poc/features/common/product_model.dart';

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
      body: state.products.isEmpty ? _buildEmpty(state) : _buildList(state),
    );
  }

  Widget _buildList(CategoryState state) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10,
      children: List.generate(state.products.length, (index) {
        return ProductTileWidget(product: state.products[index]);
      }),
    );
  }

  Widget _buildEmpty(CategoryState state) {
    return Center(
      child: Text('No Product availale for ${state.pageTitle}'),
    );
  }
}

class ProductTileWidget extends StatelessWidget {
  final ProductModel product;
  const ProductTileWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: AppTheme.primaryColor)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.name, style: Theme.of(context).textTheme.displayMedium),
                Text('₹ ${product.price}', style: Theme.of(context).textTheme.displayLarge),
              ],
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  child: Text('Add'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
