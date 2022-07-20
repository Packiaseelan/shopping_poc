part of '../coordinator/splash_coordinator.dart';

class SplashState {
  final String appName;

  SplashState({
    required this.appName,
  });

  SplashState copyWith({
    String? appName,
  }) =>
      SplashState(
        appName: appName ?? this.appName,
      );
}
