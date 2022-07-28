import 'package:core/core.dart';
import 'package:core/navigation/i_navigation_handler.dart';
import 'package:shopping_poc/features/splash/view/splash_view.dart';
import 'package:shopping_poc/global/global_app_initializer.dart';

void main() async {
  final core = Core();
  final globalAppInitializer = GlobalAppInitializer();

  await core.registerMinimalDependencies(
    secretSalt: [],
    navigationHandler: DefaultNavigationHandler(),
    appInitializer: globalAppInitializer.appInitializer,
    homeWidget: const SplashView(),
    appTitle: 'Grocery POC App',
    packages: {},
  );
}
