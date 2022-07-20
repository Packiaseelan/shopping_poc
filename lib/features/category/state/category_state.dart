part of '../coordinator/category_coordinator.dart';

class CategoryState {
  final String pageTitle;
  final List<ProductModel> products;

  CategoryState({
    required this.pageTitle,
    this.products = const [],
  });

  CategoryState copyWith({
    String? pageTitle,
    List<ProductModel>? products,
  }) =>
      CategoryState(
        pageTitle: pageTitle ?? this.pageTitle,
        products: products ?? this.products,
      );
}
