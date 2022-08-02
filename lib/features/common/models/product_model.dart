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
  }) : quantity = 0;

  void addOne() {
    quantity += 1;
  }

  void minusOne() {
    if (quantity > 0) {
      quantity -= 1;
    }
  }
}

class ProductModel extends BaseProductModel {
  ProductModel({
    required super.id,
    required super.categoryId,
    required super.name,
    required super.image,
    required super.price,
  });
}

enum CustomiseUnitType { none, kg, piece, liter, dozen }

enum KgUnits { gm100, gm200, gm500, kg1 }

enum LiterUnits { ml100, ml200, ml500, l1 }

extension KgUnitsEx on KgUnits {
  String get description {
    switch (this) {
      case KgUnits.gm100:
        return '100 gm';
      case KgUnits.gm200:
        return '200 gm';
      case KgUnits.gm500:
        return '500 gm';
      case KgUnits.kg1:
        return '1 kg';
    }
  }
}

extension LiterUnitsEx on LiterUnits {
  String get description {
    switch (this) {
      case LiterUnits.ml100:
        return '100 ml';
      case LiterUnits.ml200:
        return '200 ml';
      case LiterUnits.ml500:
        return '500 ml';
      case LiterUnits.l1:
        return '1 ltr';
    }
  }
}

class CustomiseUnit {
  final CustomiseUnitType type;

  CustomiseUnit({
    required this.type,
  });

  List<String> get values {
    switch (type) {
      case CustomiseUnitType.kg:
        return KgUnits.values.map((e) => e.description).toList();

      case CustomiseUnitType.liter:
        return LiterUnits.values.map((e) => e.description).toList();

      default:
        return [];
    }
  }
}
