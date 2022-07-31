import 'package:flutter/material.dart';

import 'package:core/base_classes/base_view.dart';
import 'package:shopping_poc/features/dashboard/view/dashboard_view.dart';
import 'package:widget_library/image/hex_image_widget.dart';
import 'package:widget_library/scaffold/hex_scaffold.dart';

import 'package:shopping_poc/features/landing/coordinator/landing_coordinator.dart';

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
      themeName: 'landing_screen',
      body: _buildBody(state),
      bottomNavigationBar: BottomNavigation(
        currentTab: state.currentTab,
        onSelectTab: coordinator.onSelectTab,
      ),
    );
  }

  Widget _buildBody(LandingState state) {
    switch (state.currentTab) {
      case TabItem.home:
        return const DashboardView();
      case TabItem.category:
        return const Center(child: Text('Category'));
      case TabItem.search:
        return const Center(child: Text('Search'));
      case TabItem.cart:
        return const Center(child: Text('Cart'));
      case TabItem.profile:
        return const Center(child: Text('Profile'));
    }
  }
}

class BottomNavigation extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  const BottomNavigation({
    Key? key,
    required this.currentTab,
    required this.onSelectTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentTab.index,
      selectedLabelStyle: Theme.of(context).textTheme.subtitle1,
      unselectedLabelStyle: Theme.of(context).textTheme.subtitle2,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: Theme.of(context).textTheme.subtitle1?.color,
      unselectedItemColor: Theme.of(context).textTheme.subtitle2?.color,
      type: BottomNavigationBarType.fixed,
      items: TabItem.values.map((e) => _buildItem(e)).toList(),
      onTap: (index) => onSelectTab(TabItem.values[index]),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tab) {
    return BottomNavigationBarItem(
      icon: HexImage(
        HexImageModel.asset(
          imagePath: currentTab == tab ? tab.selectedIconPath : tab.iconPath,
        ),
      ),
      label: tab.name,
    );
  }
}
