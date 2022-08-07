part of '../coordinator/cart_coordinator.dart';

class CartState {
  final String pageTitle;
  final String subTitile;
  final List<ProductModel> products;

  CartState({
    required this.pageTitle,
    required this.subTitile,
    this.products = const [],
  });

  CartState copyWith({
    String? pageTitle,
    String? subTitile,
    List<ProductModel>? products,
  }) =>
      CartState(
        pageTitle: pageTitle ?? this.pageTitle,
        subTitile: subTitile ?? this.subTitile,
        products: products ?? this.products,
      );
}
