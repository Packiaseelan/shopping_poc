import 'package:flutter/material.dart';

import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:shared_dependencies/shared_dependencies.dart';
import 'package:widget_library/hex_text/hex_text.dart';
import 'package:widgets/bottom_cart_widget.dart';

import 'package:shopping_poc/features/common/cart_service.dart';
import 'package:shopping_poc/global/route_manager/global_route_manager.dart';

class _Constants {
  static const caption = 'Items in your cart: ';
  static const nextCTA = 'Next';
}

mixin BottomCart {
  final cart = DIContainer.container.resolve<CartService>();

  Widget bottom() {
    return Visibility(
      visible: cart.hasItems,
      child: BottomCartWidget(
        attribute: BottomCartAttribute(
          caption: TextUIDataModel(_Constants.caption),
          nextCTA: TextUIDataModel(_Constants.nextCTA),
          totalPrice: TextUIDataModel('${cart.cartAmount}'),
          itemCount: TextUIDataModel('${cart.cartItemsCount}'),
          navigateToCart: _navigateToCart,
          onClear: () => cart.clearCart(),
        ),
      ),
    );
  }

  void _navigateToCart() {
    NavigationManager.navigateTo(
      '${ModuleIdentifiers.global}-${GlobalRoutes.cart}',
      NavigationType.Push,
    );
  }
}
