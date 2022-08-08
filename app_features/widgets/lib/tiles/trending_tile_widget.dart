import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widget_library/hex_text/hex_text.dart';
import 'package:widget_library/image/hex_image_widget.dart';
import 'package:widget_library/theme/builder/theme_builder.dart';
import 'package:widgets/add_to_cart_button_widget.dart';

class TrendingTileAttribute {
  final HexImageModel image;
  final TextUIDataModel name;
  final TextUIDataModel quantity;
  final TextUIDataModel price;
  final OfferAttribute? offer;
  final AddToCartButtonAttribute addTocart;

  TrendingTileAttribute({
    required this.image,
    required this.name,
    required this.quantity,
    required this.price,
    required this.addTocart,
    this.offer,
  });
}

class OfferAttribute {
  final TextUIDataModel offerPercentage;
  final TextUIDataModel offerCaption;
  final TextUIDataModel offerPrice;

  OfferAttribute({
    required this.offerPercentage,
    required this.offerCaption,
    required this.offerPrice,
  });
}

class TrendingTileWidget extends StatelessWidget {
  final TrendingTileAttribute attribute;
  const TrendingTileWidget({Key? key, required this.attribute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themeName: 'product_detail_tile',
      builder: (context){
      return ClipRect(
      child: SizedBox(
        width: 130.w,
        child: AspectRatio(
          aspectRatio: 0.68,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Theme.of(context).scaffoldBackgroundColor),
                  color: Theme.of(context).cardColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child: HexImage(attribute.image)),
                      const SizedBox(height: 5),
                      HexText(text: attribute.name),
                      Align(
                        alignment: Alignment.centerRight,
                        child: HexText(
                          text: TextUIDataModel('₹18.00', styleVariant: HexTextStyleVariant.bodyText2),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HexText(text: attribute.quantity),
                          HexText(text: attribute.price),
                        ],
                      ),
                      const SizedBox(height: 4),
                      AddToCartButtonWidget(attribute: attribute.addTocart)
                    ],
                  ),
                ),
              ),
              if (attribute.offer != null)
                Positioned(
                  top: 0,
                  left: 0,
                  child: OfferWidget(attribute: attribute.offer!),
                ),
            ],
          ),
        ),
      ),
    );
    });
  }
}

class OfferWidget extends StatelessWidget {
  final OfferAttribute attribute;

  const OfferWidget({Key? key, required this.attribute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30.w,
      height: 25.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Theme.of(context).splashColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HexText(
            text: TextUIDataModel('20%', styleVariant: HexTextStyleVariant.subtitle1),
          ),
          HexText(
            text: TextUIDataModel('OFF', styleVariant: HexTextStyleVariant.caption),
          ),
        ],
      ),
    );
  }
}
