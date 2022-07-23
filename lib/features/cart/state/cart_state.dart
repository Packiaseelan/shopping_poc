part of '../coordinator/cart_coordinator.dart';

class CartState {
  final String pageTitle;
  final List<ProductModel> products;

  CartState({
    required this.pageTitle,
    this.products = const [],
  });

  CartState copyWith({
    String? pageTitle,
    List<ProductModel>? products,
  }) =>
      CartState(
        pageTitle: pageTitle ?? this.pageTitle,
        products: products ?? this.products,
      );
}
