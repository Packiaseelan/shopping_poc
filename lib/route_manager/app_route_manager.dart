import 'package:core/navigation/i_route_manager.dart';
import 'package:flutter/material.dart';
import 'package:shopping_poc/features/dashboard/view/dashboard_view.dart';

class AppRouteManager extends IRouteManager {
  static const dashboard = 'dashboard';

  @override
  Widget getView(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return const DashboardView();
        
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
