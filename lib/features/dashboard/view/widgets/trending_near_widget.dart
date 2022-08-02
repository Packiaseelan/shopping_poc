import 'package:flutter/material.dart';
import 'package:widget_library/sub_title/sub_title_widget.dart';
import 'package:widget_library/theme/builder/theme_builder.dart';
import 'package:widgets/tiles/trending_tile_widget.dart';

class TrendingNearAttribute {
  final SubTitleAttribute title;
  final List<TrendingTileAttribute> trendingProducts;

  TrendingNearAttribute({
    required this.title,
    this.trendingProducts = const [],
  });
}

class TrendingNearWidget extends StatelessWidget {
  final TrendingNearAttribute attribute;

  const TrendingNearWidget({Key? key, required this.attribute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themeName: 'product_detail_tile',
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            height: 280,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SubTitleWidget(attribute: attribute.title),
                Expanded(
                  child: ListView.separated(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: attribute.trendingProducts.length,
                    itemBuilder: (context, index) {
                      return TrendingTileWidget(
                        attribute: attribute.trendingProducts[index],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

