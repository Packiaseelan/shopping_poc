import 'package:core/base_classes/base_coordinator.dart';
import 'package:core/navigation/navigation_manager.dart';

part '../state/landing_state.dart';
part '../navigation_handler/landing_navigation_handler.dart';

enum TabItem { home, category, search, cart, profile }

extension TabItemEx on TabItem {
  String get name {
    switch (this) {
      case TabItem.home:
        return 'Home';
      case TabItem.category:
        return 'Category';
      case TabItem.search:
        return 'Search';
      case TabItem.cart:
        return 'Cart';
      case TabItem.profile:
        return 'Profile';
    }
  }

  String get iconPath {
    switch (this) {
      case TabItem.home:
        return 'assets/icons/home.svg';
      case TabItem.category:
        return 'assets/icons/category.svg';
      case TabItem.search:
        return 'assets/icons/search.svg';
      case TabItem.cart:
        return 'assets/icons/shopping-bag.svg';
      case TabItem.profile:
        return 'assets/icons/user.svg';
    }
  }

  String get selectedIconPath {
    switch (this) {
      case TabItem.home:
        return 'assets/icons/home-selected.svg';
      case TabItem.category:
        return 'assets/icons/category-selected.svg';
      case TabItem.search:
        return 'assets/icons/search-selected.svg';
      case TabItem.cart:
        return 'assets/icons/shopping-bag-selected.svg';
      case TabItem.profile:
        return 'assets/icons/user-selected.svg';
    }
  }
}

class LandingCoordinator extends BaseCoordinator<LandingState> {
  final ILandingNavigationHandler _navigationHandler;

  LandingCoordinator(this._navigationHandler)
      : super(
          LandingState(
            currentTab: TabItem.home,
          ),
        );

  void initialize() {}

  void onSelectTab(TabItem tab) {
    if (tab == TabItem.cart) {
      _navigationHandler.navigateToCart();
    } else {
      state = state.copyWith(currentTab: tab);
    }
  }
}
