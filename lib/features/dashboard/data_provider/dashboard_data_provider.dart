part of '../coordinator/dashboard_coordinator.dart';

abstract class IDashboardDataProvider {
  Future<List<CategoryModel>> fetchCategories();
  Future<List<ProductModel>> fetchTrendingNearYou();
}

class DashboardDataProvider extends IDashboardDataProvider {
  @override
  Future<List<CategoryModel>> fetchCategories() async {
    // TODO: fetch data from BE

    return categories;
  }

  @override
  Future<List<ProductModel>> fetchTrendingNearYou() async {
    // TODO: fetch data from BE
    
    return [fruits.first, fruits.last, vegs.first, vegs.last];
  }
}
