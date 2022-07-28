import 'package:core/base_classes/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shopping_poc/features/landing/coordinator/landing_coordinator.dart';
import 'package:widget_library/scaffold/hex_scaffold.dart';

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
    return HexScaffold(body: Container());
  }
}
