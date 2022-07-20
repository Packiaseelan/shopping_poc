import 'package:core/base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shopping_poc/features/dashboard/coordinator/dashboard_coordinator.dart';
import 'package:shopping_poc/features/dashboard/view/widgets/categories_widget.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(state.pageTitle),
        actions: [
          IconButton(
            onPressed: () => coordinator.navigateToCart(),
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
