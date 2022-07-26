abstract class BaseProductModel {
  final String id;
  final String categoryId;
  final String name;
  final String image;
  final double price;
  int quantity;

  BaseProductModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.image,
    required this.price,
    this.quantity = 0,
  });
}

class ProductModel extends BaseProductModel {
  ProductModel({
    required super.id,
    required super.categoryId,
    required super.name,
    required super.image,
    required super.price,
  });

  void addOne() {
    super.quantity += 1;
  }

  void minusOne() {
    if (super.quantity > 0) {
      super.quantity -= 1;
    }
  }
}
