import 'dart:async';

import 'package:common/models/product_model.dart';

class CartService {
  final _streamControllers = <String, StreamController<ProductModel?>>{};

  List<ProductModel> products = [];

  double cartAmount = 0;

  int get cartItemsCount {
    return products.length;
  }
  
  bool get hasItems {
    return products.isNotEmpty;
  }

  void clearCart() {
    products = [];
    cartAmount = 0;
    // clear all screens
    for (var element in _streamControllers.values) {
      element.add(null);
    }
  }

  Stream<ProductModel?> addStreamController(String key) {
    final streamController = StreamController<ProductModel?>.broadcast();
    _streamControllers[key] = streamController;
    return streamController.stream;
  }

  Stream<ProductModel?>? getStream(String key) {
    if (_streamControllers.containsKey(key)) {
      return _streamControllers[key]!.stream;
    }
    return null;
  }

  void removeStreamCotroller(String key) {
    if (_streamControllers.containsKey(key)) {
      final controller = _streamControllers[key];
      controller?.close();
      _streamControllers.remove(key);
    }
  }

  void addProduct(ProductModel product) {
    if (products.isEmpty) {
      product.addOne();
      products.add(product);
    } else {
      final existing = products.where((p) => p.id == product.id).toList();
      if (existing.isNotEmpty) {
        existing.first.addOne();
      } else {
        product.addOne();
        products.add(product);
      }
    }
    _update(product);
    _updateCartAmount();
  }

  void removeProduct(ProductModel product) {
    if (products.isNotEmpty) {
      final existing = products.firstWhere((p) => p.id == product.id);
      existing.minusOne();
      if (existing.quantity == 0) {
        products.remove(existing);
      }
      _update(existing);
    }
    _updateCartAmount();
  }

  void _update(ProductModel product) {
    for (var element in _streamControllers.values) {
      element.add(product);
    }
  }

  void _updateCartAmount() {
    double total = 0;
    for (var prod in products) {
      var amount = prod.price * prod.quantity;
      total += amount;
    }
    cartAmount = total;
  }
}