import 'package:flutter/material.dart';
import 'package:shopping_poc/config/app_theme.dart';
import 'package:shopping_poc/features/common/product_model.dart';
import 'package:shopping_poc/features/widgets/add_to_cart_button.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductModel product;
  final Function(ProductModel) add;
  final Function(ProductModel) remove;

  const ProductTileWidget({
    Key? key,
    required this.product,
    required this.add,
    required this.remove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppTheme.primaryColor),
      ),
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
            const SizedBox(height: 0),
            Text(product.name, style: Theme.of(context).textTheme.displayMedium),
            Text('₹ ${product.price}', style: Theme.of(context).textTheme.displayLarge),
            const Spacer(),
            AddToCartButtonWidget(
              value: product.quantity,
              onAdd: () => add(product),
              onRemove: () => remove(product),
            )
          ],
        ),
      ),
    );
  }
}
