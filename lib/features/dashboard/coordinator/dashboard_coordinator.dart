import 'package:core/base_coordinator/base_coordinator.dart';

part '../state/dashboard_state.dart';

class DashboardCoordinator extends BaseCoordinator<DashboardState> {
  DashboardCoordinator(): super(DashboardState());
  void initialize() {}
}