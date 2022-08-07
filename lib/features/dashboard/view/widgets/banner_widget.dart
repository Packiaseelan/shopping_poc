import 'dart:math';

import 'package:flutter/material.dart';

import 'package:widget_library/carousel/carousel_widget.dart';

class BannerWidget extends StatelessWidget {
  BannerWidget({Key? key}) : super(key: key);

  final lst = [1, 2, 3];

  Color get randomColor => Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);

  @override
  Widget build(BuildContext context) {
    return CarouselWidget(
      attribute: CarouselAttribute(
        viewportFraction: 0.7,
        indicator: IndicatorAttribute(),
        children: lst
            .map(
              (e) => ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://images.unsplash.com/photo-1543168256-418811576931?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80',
                  fit: BoxFit.cover,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
