import 'package:flutter/material.dart';

import 'package:core/base_classes/base_view.dart';
import 'package:widget_library/app_bar/hex_app_bar.dart';
import 'package:widget_library/scaffold/hex_scaffold.dart';

import 'package:shopping_poc/features/dashboard/coordinator/dashboard_coordinator.dart';
import 'package:shopping_poc/features/dashboard/view/widgets/categories_widget.dart';
import 'package:widgets/tiles/trending_tile_widget.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardCoordinator, DashboardState>(
      setupCoordinator: (coordinator) => coordinator.initialize(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, DashboardState state, DashboardCoordinator coordinator) {
    return HexScaffold(
      appBarAttributes: HexAppBarAttributes(
        title: state.pageTitle,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TrendingTileWidget(),
            CategoriesWidget(
              categories: state.categories,
              onPressed: coordinator.navigateToCategory,
            ),
          ],
        ),
      ),
    );
  }
}
