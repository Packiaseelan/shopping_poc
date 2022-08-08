import 'package:flutter/material.dart';
import 'package:widget_library/hex_text/hex_text.dart';
import 'package:widget_library/image/hex_image_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.78,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      HexImage(HexImageModel.asset(imagePath: 'assets/icons/home-selected.svg')),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Ramachandran Textiles',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xFF3A3A3A),),
                            ),
                            Text(
                              'Bypass Road, Attakulangara - Enchakkal Rd,Enchakkal Rd, Rd,Enchakkal Rd, Rd,Enchakkal Rd, ',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w400,
                                fontSize: 8,
                                color: Color(0xFF3A3A3A),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              HexImage(HexImageModel.asset(imagePath: 'assets/icons/home-selected.svg')),
            ],
          ),
        ),
      ),
    );
  }
}
