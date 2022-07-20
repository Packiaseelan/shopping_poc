part of '../coordinator/category_coordinator.dart';

abstract class ICategoryDataProvider {
  Future<List<ProductModel>> getProducts(String id);
}

class CategoryDataProvider extends ICategoryDataProvider {
  @override
  Future<List<ProductModel>> getProducts(String id) async {
    // TODO: fetch data from API
    
    var vegs = [
      ProductModel(id: 'id_1', categoryId: 'cat_2', name: 'Tomato', image: 'https://img.freepik.com/premium-photo/red-tomatoes-vegetables-are-stacked-top-each-other_91660-288.jpg?w=2000', price: 10.0),
      ProductModel(id: 'id_2', categoryId: 'cat_2', name: 'Potato', image: 'https://img.freepik.com/free-vector/realistic-clipart-with-raw-peeled-potato-whole-vegetable-with-brown-spiral-peel-slices_1441-2435.jpg?t=st=1658346071~exp=1658346671~hmac=d2237f33ab99ac0d709d2485f15ae5236b13d9a100b144eb5c33ec1a541b2798&w=2000', price: 10.0),
      ProductModel(id: 'id_3', categoryId: 'cat_2', name: 'Carrot', image: 'https://img.freepik.com/free-photo/carrots-fresh-organic-carrots-fresh-garden-carrots-bunch-fresh-organic-carrots-market_1391-238.jpg?t=st=1658345966~exp=1658346566~hmac=27fac975204079d37b8801c74b3d71093ec96cb7a9942127c008ce341bb02534&w=2000', price: 10.0),
      ProductModel(id: 'id_4', categoryId: 'cat_2', name: 'Brinjal', image: 'https://img.freepik.com/premium-photo/pile-purple-eggplant-crate-close-up-top-view_150101-3113.jpg?w=2000', price: 10.0),
    ];

    switch (id) {
      case 'cat_2':
        return vegs;
      default:
        return [];
    }
  }
}
