part of '../coordinator/product_details_coordinator.dart';

class ProductDetailsState {
  final String pageTitle;

  ProductDetailsState({
    required this.pageTitle,
  });

  ProductDetailsState copyWith({
    String? pageTitle,
  }) =>
      ProductDetailsState(
        pageTitle: pageTitle ?? this.pageTitle,
      );
}
