part of '../coordinator/cart_coordinator.dart';

class CartState {
  final String pageTitle;

  CartState({
    required this.pageTitle,
  });

  CartState copyWith({
    String? pageTitle,
  }) =>
      CartState(
        pageTitle: pageTitle ?? this.pageTitle,
      );
}
