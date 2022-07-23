part of '../coordinator/product_details_coordinator.dart';

class ProductDetailsState {
  final String pageTitle;
  final ProductModel? product;

  ProductDetailsState({
    required this.pageTitle,
    this.product,
  });

  ProductDetailsState copyWith({
    String? pageTitle,
    ProductModel? product,
  }) =>
      ProductDetailsState(
        pageTitle: pageTitle ?? this.pageTitle,
        product: product ?? this.product,
      );
}
