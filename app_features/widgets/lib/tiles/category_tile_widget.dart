import 'package:flutter/material.dart';
import 'package:widget_library/hex_text/hex_text.dart';
import 'package:widget_library/image/hex_image_widget.dart';

class CategoryTileAttribute {
  final HexImageModel image;
  final TextUIDataModel title;

  CategoryTileAttribute({required this.image, required this.title});
}

class CategoryTileWidget extends StatelessWidget {
  const CategoryTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
