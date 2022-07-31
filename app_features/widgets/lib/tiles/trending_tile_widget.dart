import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widget_library/hex_text/hex_text.dart';
import 'package:widget_library/image/hex_image_widget.dart';
import 'package:widget_library/theme/hex_theme.dart';
import 'package:widgets/add_to_cart_button_widget.dart';

class TrendingTileAttribute {
  final HexImageModel image;
  final TextUIDataModel name;
  final TextUIDataModel quantity;
  final TextUIDataModel price;
  final TrendingOfferAttribute? offer;
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

class TrendingOfferAttribute {
  final TextUIDataModel offerPercentage;
  final TextUIDataModel offerCaption;
  final TextUIDataModel offerPrice;

  TrendingOfferAttribute({
    required this.offerPercentage,
    required this.offerCaption,
    required this.offerPrice,
  });
}

class TrendingTileWidget extends StatelessWidget {
  const TrendingTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = HexTheme().themeFor('product_detail_tile');
    return ClipRect(
      child: Theme(
        data: theme,
        child: SizedBox(
          width: 130.w,
          child: AspectRatio(
            aspectRatio: 0.68,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: theme.scaffoldBackgroundColor),
                    color: theme.cardColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        HexImage(
                          HexImageModel.network(
                            imagePath:
                                'https://www.collinsdictionary.com/images/thumb/tomato_281240360_250.jpg?version=4.0.269',
                            boxFit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 2),
                        HexText(
                          text: TextUIDataModel(
                            'Tomato Local Tiruvananthapuram',
                            styleVariant: HexTextStyleVariant.headline6,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: HexText(
                              text: TextUIDataModel('₹18.00', styleVariant: HexTextStyleVariant.bodyText2),
                              decoration: TextDecoration.lineThrough,),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HexText(
                              text: TextUIDataModel(
                                '500 gm',
                                styleVariant: HexTextStyleVariant.normal,
                              ),
                            ),
                            HexText(
                              text: TextUIDataModel(
                                '₹ 2000.00',
                                styleVariant: HexTextStyleVariant.headline4,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        AddToCartButtonWidget(
                          attribute: AddToCartButtonAttribute(
                            onAdd: () {},
                            onRemove: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    width: 30.w,
                    height: 25.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: Colors.green,
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
