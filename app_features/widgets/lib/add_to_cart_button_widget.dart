import 'package:flutter/material.dart';
import 'package:widget_library/buttons/icon_button.dart';
import 'package:widget_library/hex_text/hex_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _Constants {
  static const borderRadius = 5.0;
  static const buttonHeight = 32.0;
  static const nullErrorMessage = 'Both add and quantity cannot be null.';
}

class AddToCartButtonAttribute {
  final double borderRadius;
  final String? quanity;
  final TextUIDataModel? add;
  final TextUIDataModel? customize;

  final Function() onAdd;
  final Function() onRemove;
  final Function()? onCustomise;

  AddToCartButtonAttribute({
    this.borderRadius = _Constants.borderRadius,
    this.quanity,
    this.add,
    this.customize,
    required this.onAdd,
    required this.onRemove,
    this.onCustomise,
  }) : assert(add == null && quanity == null, _Constants.nullErrorMessage);
}

class AddToCartButtonWidget extends StatelessWidget {
  final AddToCartButtonAttribute attribute;

  const AddToCartButtonWidget({Key? key, required this.attribute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _Constants.buttonHeight.sp,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.green,
            blurRadius: 25.0,
            spreadRadius: -16.0,
            offset: Offset(0.0, 25.0),
          )
        ],
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildRemoveButton(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HexText(text: TextUIDataModel('ADD', styleVariant: HexTextStyleVariant.headline3)),
              HexText(text: TextUIDataModel('Customise', styleVariant: HexTextStyleVariant.subtitle2)),
            ],
          ),
          _buildAddButton(),
        ],
      ),
    );
  }

  Widget _buildRemoveButton() {
    if (attribute.quanity != null) {
      return IconButtonWidget(
        attribute: IconButtonAttribute.icon(
          icon: Icons.remove,
          onPressed: () => attribute.onRemove.call(),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildAddButton() {
    if (attribute.quanity != null) {
      return IconButtonWidget(
        attribute: IconButtonAttribute.icon(
          icon: Icons.add,
          onPressed: () => attribute.onAdd(),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
