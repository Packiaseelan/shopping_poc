import 'package:flutter/material.dart';
import 'package:widget_library/image/hex_image_widget.dart';

class AppSearchBarAtribute {
  final String? hintText;
  final Color? backgroundColor;
  final String? prefixIconPath;
  final Function(String)? onChange;
  final Function(String)? onSubmit;

  AppSearchBarAtribute({
    this.hintText,
    this.backgroundColor,
    this.prefixIconPath,
    this.onChange,
    this.onSubmit,
  });
}

class AppSearchBar extends StatelessWidget {
  final AppSearchBarAtribute attribute;
  const AppSearchBar({Key? key, required this.attribute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: attribute.hintText,
        hintStyle: Theme.of(context).textTheme.caption,
        filled: true,
        fillColor: attribute.backgroundColor,
        suffixIcon: HexImage(
          HexImageModel.asset(
            imagePath: attribute.prefixIconPath!,
            padding: const EdgeInsets.all(10),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
