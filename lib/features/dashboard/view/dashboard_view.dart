import 'package:flutter/material.dart';

import 'package:core/base_classes/base_view.dart';
import 'package:shopping_poc/features/common/models/product_model.dart';
import 'package:shopping_poc/features/dashboard/view/widgets/banner_widget.dart';
import 'package:shopping_poc/features/dashboard/view/widgets/trending_near_widget.dart';
import 'package:widget_library/buttons/icon_text_button.dart';
import 'package:widget_library/hex_text/hex_text.dart';
import 'package:widget_library/image/hex_image_widget.dart';
import 'package:widget_library/scaffold/hex_scaffold.dart';
import 'package:widget_library/sub_title/sub_title_widget.dart';

import 'package:shopping_poc/features/dashboard/coordinator/dashboard_coordinator.dart';
import 'package:shopping_poc/features/dashboard/view/widgets/categories_widget.dart';
import 'package:widgets/add_to_cart_button_widget.dart';
import 'package:widgets/tiles/trending_tile_widget.dart';
import 'package:widgets/app_search_bar.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DashboardCoordinator, DashboardState>(
      setupCoordinator: (coordinator) => coordinator.initialize(),
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, DashboardState state, DashboardCoordinator coordinator) {
    return HexScaffold(
      themeName: 'dashboard',
      builder: (context) => buildBody(context, state, coordinator),
    );
  }

  Widget buildBody(BuildContext context, DashboardState state, DashboardCoordinator coordinator) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
        return <Widget>[
          _appBar(context),
        ];
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            TrendingNearWidget(
              attribute: _createTrendingAttribute(context, state.trendingNearYou, coordinator),
            ),
            CategoriesWidget(
              categories: state.categories,
              onPressed: coordinator.navigateToCategory,
            ),
          ],
        ),
      ),
    );
  }

  TrendingNearAttribute _createTrendingAttribute(
    BuildContext context,
    TrendingNearYouState state,
    DashboardCoordinator coordinator,
  ) {
    return TrendingNearAttribute(
      title: SubTitleAttribute(
        title: TextUIDataModel(state.title, styleVariant: HexTextStyleVariant.headline2),
        action: IconTextButtonAttribute(
          icon: HexImageModel.icon(
            icon: Icons.arrow_circle_right,
            color: Theme.of(context).iconTheme.color,
            iconSize: 15,
          ),
          title: TextUIDataModel('See All', styleVariant: HexTextStyleVariant.headline4),
          onPressed: () {},
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18),
      ),
      trendingProducts: state.trendings.map((e) => _tile(e, coordinator)).toList(),
    );
  }

  TrendingTileAttribute _tile(
    ProductModel product,
    DashboardCoordinator coordinator,
  ) {
    return TrendingTileAttribute(
      image: HexImageModel.network(
        imagePath: product.image,
        boxFit: BoxFit.cover,
        width: double.infinity,
      ),
      name: TextUIDataModel(
        product.name,
        styleVariant: HexTextStyleVariant.headline6,
      ),
      quantity: TextUIDataModel('500 gm', styleVariant: HexTextStyleVariant.normal),
      price: TextUIDataModel(
        '₹ ${product.price}',
        styleVariant: HexTextStyleVariant.headline4,
      ),
      addTocart: AddToCartButtonAttribute(
        onAdd: () {},
        onRemove: () {},
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: AppSearchBar(
                attribute: AppSearchBarAtribute(
                    hintText: 'Search for fruits, vegetables,  and more',
                    backgroundColor: Theme.of(context).backgroundColor,
                    prefixIconPath: 'assets/icons/search-selected.svg'),
              ),
            ),
          ),
        ),
        pinned: true,
        floating: false,
        expandedHeight: MediaQuery.of(context).size.height * 0.37,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BannerWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
  trendingProducts: [
        TrendingTileAttribute(
          image: HexImageModel.network(
            imagePath: 'https://www.collinsdictionary.com/images/thumb/tomato_281240360_250.jpg?version=4.0.269',
            boxFit: BoxFit.cover,
          ),
          name: TextUIDataModel(
            'Tomato Local Tiruvananthapuram',
            styleVariant: HexTextStyleVariant.headline6,
          ),
          quantity: TextUIDataModel('500 gm', styleVariant: HexTextStyleVariant.normal),
          price: TextUIDataModel(
            '₹ 2000.00',
            styleVariant: HexTextStyleVariant.headline4,
          ),
          addTocart: AddToCartButtonAttribute(
            onAdd: () {},
            onRemove: () {},
          ),
        ),
        TrendingTileAttribute(
          image: HexImageModel.network(
            imagePath: 'https://www.collinsdictionary.com/images/thumb/tomato_281240360_250.jpg?version=4.0.269',
            boxFit: BoxFit.cover,
          ),
          name: TextUIDataModel(
            'Tomato Local Tiruvananthapuram',
            styleVariant: HexTextStyleVariant.headline6,
          ),
          quantity: TextUIDataModel('500 gm', styleVariant: HexTextStyleVariant.normal),
          price: TextUIDataModel(
            '₹ 2000.00',
            styleVariant: HexTextStyleVariant.headline4,
          ),
          addTocart: AddToCartButtonAttribute(
            onAdd: () {},
            onRemove: () {},
          ),
        ),
        TrendingTileAttribute(
          image: HexImageModel.network(
            imagePath: 'https://www.collinsdictionary.com/images/thumb/tomato_281240360_250.jpg?version=4.0.269',
            boxFit: BoxFit.cover,
          ),
          name: TextUIDataModel(
            'Tomato Local Tiruvananthapuram',
            styleVariant: HexTextStyleVariant.headline6,
          ),
          quantity: TextUIDataModel('500 gm', styleVariant: HexTextStyleVariant.normal),
          price: TextUIDataModel(
            '₹ 2000.00',
            styleVariant: HexTextStyleVariant.headline4,
          ),
          addTocart: AddToCartButtonAttribute(
            onAdd: () {},
            onRemove: () {},
          ),
        ),
      ],
    
*/