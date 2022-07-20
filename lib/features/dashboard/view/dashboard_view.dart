import 'package:core/base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shopping_poc/features/dashboard/coordinator/dashboard_coordinator.dart';

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
    return const Scaffold();
  }
}
