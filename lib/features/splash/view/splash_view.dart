import 'package:core/base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shopping_poc/features/splash/coordinator/splash_coordinator.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashCoordinator, SplashState>(
      setupCoordinator: (coordinator) => coordinator.initialize(),
      builder: _builder,
    );
  }

  Widget _builder(
    BuildContext context,
    SplashState state,
    SplashCoordinator coordinator,
  ) {
    return Scaffold(
      body: Center(
        child: Text(state.appName),
      ),
    );
  }
}
