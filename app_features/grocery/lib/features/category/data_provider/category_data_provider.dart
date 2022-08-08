part of '../coordinator/category_coordinator.dart';

abstract class ICategoryDataProvider {
  Future<List<ProductModel>> getProducts(String id);
}

class CategoryDataProvider extends ICategoryDataProvider {
  @override
  Future<List<ProductModel>> getProducts(String id) async {
    // TODO: fetch data from API

    switch (id) {
      case 'cat_1':
        return fruits;
      case 'cat_2':
        return vegs;
      default:
        return [];
    }
  }
}
