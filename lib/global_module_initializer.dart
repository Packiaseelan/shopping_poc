import 'package:core/ioc/di_container.dart';
import 'package:shopping_poc/features/dashboard/coordinator/dashboard_coordinator.dart';
import 'package:shopping_poc/features/splash/coordinator/splash_coordinator.dart';

class GlobalModule {
  static void registerDependencies() {
    DIContainer.container.registerFactory(
      (container) => SplashCoordinator(
        SplashNavigationHandler(),
        SplashViewModel(),
      ),
    );

    DIContainer.container.registerFactory(
      (container) => DashboardCoordinator(),
    );
  }
}
