import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:grocery/features/category/view/category_view.dart';
import 'package:grocery/features/dashboard/view/dashboard_view.dart';

part 'grocery_routes.dart';

class GroceryRouteManager extends IRouteManager {
  @override
  Widget getView(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>;
    switch (settings.name) {
      case GroceryRoutes.dashboard:
        return DashboardView();

      case GroceryRoutes.category:
        return CategoryView(args: args);

      // case GroceryRoutes.productDetails:
      //   return ProductDetailsView(args: args);

      default:
        throw Exception('Route ${settings.name} not found');
    }
  }
}
