part of '../coordinator/dashboard_coordinator.dart';

class DashboardState {
  final String pageTitle;
  final List<CategoryModel> categories;
  final TrendingNearYouState trendingNearYou;

  DashboardState({
    required this.pageTitle,
    this.categories = const [],
    required this.trendingNearYou,
  });

  DashboardState copyWith({
    String? pageTitle,
    List<CategoryModel>? categories,
    TrendingNearYouState? trendingNearYou,
  }) =>
      DashboardState(
        pageTitle: pageTitle ?? this.pageTitle,
        categories: categories ?? this.categories,
        trendingNearYou: trendingNearYou ?? this.trendingNearYou,
      );
}

class TrendingNearYouState {
  final String title;
  final bool isLoading;
  final String? errorMessagae;
  final List<ProductModel> trendings;

  TrendingNearYouState({
    required this.title,
    this.isLoading = false,
    this.errorMessagae,
    this.trendings = const [],
  });

  TrendingNearYouState copyWith({
    String? title,
    bool? isLoading,
    String? errorMessagae,
    List<ProductModel>? trendings,
  }) =>
      TrendingNearYouState(
        title: title ?? this.title,
        isLoading: isLoading ?? this.isLoading,
        errorMessagae: errorMessagae ?? this.errorMessagae,
        trendings: trendings ?? this.trendings,
      );
}
