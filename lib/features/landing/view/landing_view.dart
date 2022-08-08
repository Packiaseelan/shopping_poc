import 'package:flutter/material.dart';

import 'package:core/base_classes/base_view.dart';
import 'package:cart/features/cart/view/cart_view.dart';
import 'package:shopping_poc/features/dashboard/view/dashboard_view.dart';
import 'package:widget_library/scaffold/hex_scaffold.dart';

import 'package:shopping_poc/features/landing/coordinator/landing_coordinator.dart';
import 'package:shopping_poc/features/landing/view/widgets/bottom_navigation.dart';

class _Constants {
  static const themeName = 'landing_screen';
}

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LandingCoordinator, LandingState>(
      setupCoordinator: (coordinator) => coordinator.initialize(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, LandingState state, LandingCoordinator coordinator) {
    return HexScaffold(
      themeName: _Constants.themeName,
      builder: (context) => _buildBody(state),
      bottomNavigationBar: BottomNavigation(
        currentTab: state.currentTab,
        onSelectTab: coordinator.onSelectTab,
      ),
    );
  }

  Widget _buildBody(LandingState state) {
    switch (state.currentTab) {
      case TabItem.home:
        return DashboardView();
      case TabItem.category:
        return const Center(child: Text('Category'));
      case TabItem.search:
        return const Center(child: Text('Search'));
      case TabItem.cart:
        return const CartView();
      case TabItem.profile:
        return const Center(child: Text('Profile'));
    }
  }
}

