part of '../coordinator/dashboard_coordinator.dart';

abstract class IDashboardDataProvider {
  Future<List<CategoryModel>> fetchCategories();
}

class DashboardDataProvider extends IDashboardDataProvider {
  @override
  Future<List<CategoryModel>> fetchCategories() async {
    // TODO: fetch data from BE

    return [
      CategoryModel(id: 'cat_1', name: 'Fruits', image: 'https://img.freepik.com/premium-photo/fresh-fruits-vegetables_8595-135.jpg?w=2000'),
      CategoryModel(id: 'cat_2', name: 'Vegetables', image: 'https://img.freepik.com/free-photo/top-view-assortment-vegetables-paper-bag_23-2148853335.jpg?t=st=1658345064~exp=1658345664~hmac=8d45a87a6cfa9752d6ab0a8f65c20d1748b6cefa29d5c25c142a1431e8e615f3&w=2000'),
      CategoryModel(id: 'cat_3', name: 'Rice', image: 'https://images.unsplash.com/photo-1644377949116-c4a6b529241c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1996&q=80'),
      CategoryModel(id: 'cat_4', name: 'Dal', image: 'https://img.freepik.com/premium-photo/close-up-seeds-husked-brown-gram-pulse_57665-10167.jpg?w=1800'),
      CategoryModel(id: 'cat_5', name: 'Diary', image: 'https://img.freepik.com/free-photo/dairy-products_114579-8773.jpg?t=st=1658345281~exp=1658345881~hmac=34b522d0d54bd7286380827475983f628358f45cebf242c04bae58404edc880d&w=2000'),
    ];
  }
}
