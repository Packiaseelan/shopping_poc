part of '../coordinator/dashboard_coordinator.dart';

class DashboardState {
  final String pageTitle;
  final List<CategoryModel> categories;

  DashboardState({
    required this.pageTitle,
    this.categories = const [],
  });

  DashboardState copyWith({
    String? pageTitle,
    List<CategoryModel>? categories,
  }) =>
      DashboardState(
        pageTitle: pageTitle ?? this.pageTitle,
        categories: categories ?? this.categories,
      );
}
