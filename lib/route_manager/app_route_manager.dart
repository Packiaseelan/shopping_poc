import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:shopping_poc/features/cart/view/cart_view.dart';
import 'package:shopping_poc/features/category/view/category_view.dart';
import 'package:shopping_poc/features/dashboard/view/dashboard_view.dart';
import 'package:shopping_poc/features/product_details/view/product_details_view.dart';

class AppRouteManager extends IRouteManager {
  static const dashboard = 'dashboard';
  static const cart = 'cart';
  static const category = 'category';
  static const productDetails = 'productDetails';

  @override
  Widget getView(RouteSettings settings) {
    final args = settings.arguments as Map<String, dynamic>;
    switch (settings.name) {
      case dashboard:
        return const DashboardView();

      case cart:
        return const CartView();

      case category:
        return CategoryView(
          args: args,
        );

      case productDetails:
        return ProductDetailsView(args: args);

      default:
        return super.getView(settings);
    }
  }

  @override
  Widget getDialog(String dialogName, arguments) {
    switch (dialogName) {
      default:
        return super.getDialog(dialogName, arguments);
    }
  }

  @override
  Widget getBottomSheet(String bottomSheetName, arguments) {
    switch (bottomSheetName) {
      default:
        return super.getBottomSheet(bottomSheetName, arguments);
    }
  }
}
