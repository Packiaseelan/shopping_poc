import 'package:common/models/product_model.dart';
import 'package:common/models/category_model.dart';

var categories = [
  CategoryModel(
      id: 'cat_1',
      name: 'Fruits',
      image: 'https://img.freepik.com/premium-photo/fresh-fruits-vegetables_8595-135.jpg?w=2000'),
  CategoryModel(
      id: 'cat_2',
      name: 'Vegetables',
      image:
          'https://img.freepik.com/free-photo/top-view-assortment-vegetables-paper-bag_23-2148853335.jpg?t=st=1658345064~exp=1658345664~hmac=8d45a87a6cfa9752d6ab0a8f65c20d1748b6cefa29d5c25c142a1431e8e615f3&w=2000'),
  CategoryModel(
      id: 'cat_3',
      name: 'Rice',
      image:
          'https://images.unsplash.com/photo-1644377949116-c4a6b529241c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1996&q=80'),
  CategoryModel(
      id: 'cat_4',
      name: 'Dal',
      image: 'https://img.freepik.com/premium-photo/close-up-seeds-husked-brown-gram-pulse_57665-10167.jpg?w=1800'),
  CategoryModel(
      id: 'cat_5',
      name: 'Diary',
      image:
          'https://img.freepik.com/free-photo/dairy-products_114579-8773.jpg?t=st=1658345281~exp=1658345881~hmac=34b522d0d54bd7286380827475983f628358f45cebf242c04bae58404edc880d&w=2000'),
];

var vegs = [
  ProductModel(
    id: 'id_1',
    categoryId: 'cat_2',
    name: 'Tomato',
    image:
        'https://img.freepik.com/premium-photo/red-tomatoes-vegetables-are-stacked-top-each-other_91660-288.jpg?w=2000',
    price: 10.0,
    customise: CustomiseUnit(type: CustomiseUnitType.kg),
  ),
  ProductModel(
      id: 'id_2',
      categoryId: 'cat_2',
      name: 'Potato',
      image:
          'https://img.freepik.com/free-vector/realistic-clipart-with-raw-peeled-potato-whole-vegetable-with-brown-spiral-peel-slices_1441-2435.jpg?t=st=1658346071~exp=1658346671~hmac=d2237f33ab99ac0d709d2485f15ae5236b13d9a100b144eb5c33ec1a541b2798&w=2000',
      price: 10.0),
  ProductModel(
      id: 'id_3',
      categoryId: 'cat_2',
      name: 'Carrot',
      image:
          'https://img.freepik.com/free-photo/carrots-fresh-organic-carrots-fresh-garden-carrots-bunch-fresh-organic-carrots-market_1391-238.jpg?t=st=1658345966~exp=1658346566~hmac=27fac975204079d37b8801c74b3d71093ec96cb7a9942127c008ce341bb02534&w=2000',
      price: 10.0),
  ProductModel(
      id: 'id_4',
      categoryId: 'cat_2',
      name: 'Brinjal',
      image:
          'https://img.freepik.com/premium-photo/pile-purple-eggplant-crate-close-up-top-view_150101-3113.jpg?w=2000',
      price: 10.0),
];

var fruits = [
  ProductModel(
      id: 'id_5',
      categoryId: 'cat_1',
      name: 'Apple',
      image:
          'https://img.freepik.com/free-photo/red-fresh-apples-as-background_78492-3922.jpg?t=st=1658348295~exp=1658348895~hmac=2f9e3fbba27429d8252b300fd3c3c3fec72a9fcfc80ce946fe65370c2a0532bc&w=2000',
      price: 100.0),
  ProductModel(
      id: 'id_6',
      categoryId: 'cat_1',
      name: 'Pine Apple',
      image: 'https://img.freepik.com/premium-photo/pineapple-slices-isolated-white-background_253984-5715.jpg?w=1800',
      price: 80.0),
  ProductModel(
      id: 'id_7',
      categoryId: 'cat_1',
      name: 'Fig',
      image:
          'https://img.freepik.com/premium-photo/purple-figs-open-purple-figs-being-sprayed-with-water_309761-847.jpg?w=2000',
      price: 160.0),
  ProductModel(
      id: 'id_8',
      categoryId: 'cat_1',
      name: 'Papaya',
      image:
          'https://img.freepik.com/free-photo/composition-delicious-exotic-papaya_23-2149090912.jpg?t=st=1658348509~exp=1658349109~hmac=90f534f9bd71c977eb6016abe1a6c763d32758643087806eaa271d9876e3ddec&w=2000',
      price: 100.0),
  ProductModel(
      id: 'id_9',
      categoryId: 'cat_1',
      name: 'Orange',
      image:
          'https://img.freepik.com/free-photo/concept-citrus-with-red-orange-orange-background_185193-80911.jpg?t=st=1658348651~exp=1658349251~hmac=a8e7d15b77faf502ed690a6ce0830b7a215bfa20a9ce5b61fe343a0406bbab77&w=2000',
      price: 100.0),
  ProductModel(
      id: 'id_10',
      categoryId: 'cat_1',
      name: 'Mango',
      image:
          'https://img.freepik.com/premium-photo/ripe-mango-fruit-yellow-background-close-up_185193-45206.jpg?w=2000',
      price: 100.0),
  ProductModel(
      id: 'id_11',
      categoryId: 'cat_1',
      name: 'Kiwi',
      image:
          'https://img.freepik.com/free-photo/composition-delicious-exotic-kiwis_23-2149090925.jpg?t=st=1658348651~exp=1658349251~hmac=654fd215ef8fa955a13dd78517ad1cd6c2a91a468be5108d5e2aec90ad91fadc&w=900',
      price: 100.0),
];
