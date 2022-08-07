import 'package:flutter/material.dart';
import 'package:widget_library/hex_text/hex_text.dart';

class BottomCartAttribute {
  final TextUIDataModel itemCount;
  final TextUIDataModel nextCTA;
  final TextUIDataModel caption;
  final TextUIDataModel totalPrice;
  final Function() onClear;
  final Function() navigateToCart;

  BottomCartAttribute({
    required this.caption,
    required this.nextCTA,
    required this.itemCount,
    required this.totalPrice,
    required this.onClear,
    required this.navigateToCart,
  });
}

class BottomCartWidget extends StatelessWidget {
  final BottomCartAttribute attribute;
  const BottomCartWidget({Key? key, required this.attribute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.withOpacity(0.1),
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                HexText(text: attribute.caption),
                HexText(text: attribute.itemCount),
                const Spacer(),
                HexText(text: attribute.totalPrice),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green,
                    ),
                    child: InkWell(
                      onTap: attribute.navigateToCart,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                        child: HexText(text: attribute.nextCTA),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: attribute.onClear,
                  child: const Icon(Icons.clear, size: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
