import 'package:flutter/material.dart';

import 'package:core/navigation/i_route_manager.dart';

import 'package:cart/features/cart/view/cart_view.dart';

part 'cart_routes.dart';

class CartRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case CartRoutes.cart:
        return const CartView();

      default:
        throw Exception('Route ${settings.name} not found');
    }
  }
}