import 'package:flutter/material.dart';

import 'package:core/navigation/i_route_manager.dart';

import 'package:shopping_poc/features/landing/view/landing_view.dart';
import 'package:shopping_poc/features/product_details/view/product_details_view.dart';

part 'global_routes.dart';

class GlobalRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>;
    switch (settings.name) {
      case GlobalRoutes.landing:
        return const LandingView();

      case GlobalRoutes.productDetails:
        return ProductDetailsView(args: args);

      default:
        throw Exception('Route ${settings.name} not found');
    }
  }
}
