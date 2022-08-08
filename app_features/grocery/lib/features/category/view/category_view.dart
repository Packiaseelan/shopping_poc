import 'package:cart/mixins/bottom_cart_mixin.dart';
import 'package:flutter/material.dart';

import 'package:core/base_classes/base_view.dart';
import 'package:widget_library/app_bar/hex_app_bar.dart';
import 'package:widget_library/hex_text/hex_text.dart';
import 'package:widget_library/image/hex_image_widget.dart';
import 'package:widget_library/scaffold/hex_scaffold.dart';
import 'package:widgets/add_to_cart_button_widget.dart';
import 'package:widgets/tiles/trending_tile_widget.dart';

import 'package:grocery/features/category/coordinator/category_coordinator.dart';

class CategoryView extends StatelessWidget with BottomCart {
  final Map<String, dynamic> args;
  CategoryView({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<CategoryCoordinator, CategoryState>(
      setupCoordinator: (coordinator) => coordinator.initialize(args),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, CategoryState state, CategoryCoordinator coordinator) {
    return HexScaffold(
      appBarAttributes: HexAppBarAttributes(
        title: state.pageTitle,
        left: [HexAppBarButtonAttributes(type: HexAppBarButtons.back)]
      ),
      builder: (context) => state.products.isEmpty ? _buildEmpty(state) : _buildList(context, state, coordinator),
      bottomChild: bottom(),
    );
  }

  Widget _buildList(BuildContext context, CategoryState state, CategoryCoordinator coordinator) {
    double cardWidth = MediaQuery.of(context).size.width * 0.3;
    double cardHeight = MediaQuery.of(context).size.height * 0.17;
    return GridView.count(
      padding: const EdgeInsets.all(10),
      childAspectRatio: cardWidth / cardHeight,
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      mainAxisSpacing: 10,
      children: List.generate(state.products.length, (index) {
        return InkWell(
          onTap: () => coordinator.navigateToDetils(state.products[index]),
          child: TrendingTileWidget(
            attribute: TrendingTileAttribute(
              image: HexImageModel.network(
                imagePath: state.products[index].image,
                boxFit: BoxFit.cover,
                width: double.infinity,
              ),
              name: TextUIDataModel(state.products[index].name),
              quantity: TextUIDataModel('500 gm', styleVariant: HexTextStyleVariant.normal),
              price: TextUIDataModel('${state.products[index].price}'),
              addTocart: AddToCartButtonAttribute(
                quanity: state.products[index].quantity > 0 ? state.products[index].quantity.toString() : null,
                onAdd: () => coordinator.addProduct(state.products[index]),
                onRemove: () => coordinator.removeProduct(state.products[index]),
              ),
            ),
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
