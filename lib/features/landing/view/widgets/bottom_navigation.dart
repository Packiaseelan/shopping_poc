import 'package:flutter/material.dart';
import 'package:shopping_poc/features/landing/coordinator/landing_coordinator.dart';
import 'package:widget_library/image/hex_image_widget.dart';

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
