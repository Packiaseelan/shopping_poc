part of '../coordinator/landing_coordinator.dart';

class LandingState {
  final TabItem currentTab;

  LandingState({
    required this.currentTab,
  });

  LandingState copyWith({
    TabItem? currentTab,
  }) =>
      LandingState(
        currentTab: currentTab ?? this.currentTab,
      );
}
