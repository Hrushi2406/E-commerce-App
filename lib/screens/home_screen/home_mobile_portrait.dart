import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/blocs/bloc/product_bloc.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';
import 'package:furnitur/core/ui_helper/widgets/cards.dart';
import 'package:furnitur/core/ui_helper/widgets/shrimmers.dart';
import 'package:furnitur/core/utils/enums.dart';
import 'package:furnitur/core/utils/stringToEnum.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';
import 'package:furnitur/features/home/presentation/bloc/home_bloc.dart';

//! 5 to-do's in this screen

class HomeMobilePortrait extends StatefulWidget {
  //screen one is [ Home Screen ] and screen two is [ Category Screen ]
  final isScreenTwo;

  HomeMobilePortrait({
    Key key,
    @required this.isScreenTwo,
  }) : super(key: key);

  @override
  _HomeMobilePortraitState createState() => _HomeMobilePortraitState();
}

class _HomeMobilePortraitState extends State<HomeMobilePortrait> {
  final PageController _offersPageController = PageController(
    initialPage: 1,
    viewportFraction: 0.75,
  );

  final List<String> _offersUrl = [
    'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592883941/furnitur/offers/offer_1_kl2tuf.png',
    'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592883941/furnitur/offers/offer_2_capqrv.png',
    'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592883941/furnitur/offers/offer_3_hkbspb.png',
    'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592883942/furnitur/offers/offer_4_lkawoi.png',
  ];

  final List<List<String>> _categoriesUrl = [
    [
      'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592883776/furnitur/categories/c_tc_yfnrn3.png',
      'Table & Chairs',
    ],
    [
      'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592883775/furnitur/categories/c_wf_gauvf2.png',
      'Wooden Furniture',
    ],
    [
      'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592883774/furnitur/categories/c_ph_r7cgpi.png',
      'Pencil Holder',
    ],
    [
      'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592883774/furnitur/categories/c_lounge_irt2tm.png',
      'Lounge',
    ],
    [
      'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592883775/furnitur/categories/c_pv_bbbg1d.png',
      'Plant Vase',
    ],
    [
      'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592883774/furnitur/categories/c_lamp_lrqeeu.png',
      'Lamp',
    ],
  ];

  List<Product> forYouProducts = [];
  List<Product> featuredProducts = [];

  List<Product> _products = [
    Product(
      productId: 'ABCD',
      name: 'Round Duo',
      description: 'this is a lamp',
      price: 2999,
      imageUrl:
          'https://res.cloudinary.com/dveojo0f6/image/upload/v1592636543/Table%20chair/croissant_bread_besi_fLDJC_uculbs.jpg',
      colors: ['Red', 'Green', 'Blue'],
      categories: ['lamp', 'vase'],
      rating: 3,
      noOfReviews: 12,
      mainCategory: 'Table & Chair',
    ),
    Product(
      productId: 'ABCD',
      name: 'Panel Lamp',
      description: 'this is a lamp',
      price: 2999,
      imageUrl:
          'https://res.cloudinary.com/dveojo0f6/image/upload/v1592199247/Lamp/clear_bulb_beside_wh_WrEAk_qb3a8n.jpg',
      colors: ['Red', 'Green', 'Blue'],
      categories: ['lamp', 'vase'],
      rating: 3,
      noOfReviews: 12,
      mainCategory: 'lamp',
    ),
    Product(
      productId: 'ABCD',
      name: 'Panel Lamp',
      description: 'this is a lamp',
      price: 2999,
      imageUrl:
          'https://res.cloudinary.com/dveojo0f6/image/upload/v1592199247/Lamp/clear_bulb_beside_wh_WrEAk_qb3a8n.jpg',
      colors: ['yellow', 'orange', 'grey'],
      categories: ['lamp', 'vase'],
      rating: 3,
      noOfReviews: 12,
      mainCategory: 'lamp',
    ),
    Product(
      productId: 'ABCD',
      name: 'Round Duo',
      description: 'this is a lamp',
      price: 2999,
      imageUrl:
          'https://res.cloudinary.com/dveojo0f6/image/upload/v1592636543/Table%20chair/croissant_bread_besi_fLDJC_uculbs.jpg',
      colors: ['Red', 'Green', 'Blue'],
      categories: ['lamp', 'vase'],
      rating: 3,
      noOfReviews: 12,
      mainCategory: 'Table & Chair',
    ),
  ];

  void _seeAllCategories(BuildContext context) {
    //TODO: see all categories
    Navigator.of(context).pushNamed('/all_categories');
  }

  void _seeAllForYou(BuildContext context) {
    //Call Event of Product Bloc
    BlocProvider.of<ProductBloc>(context).add(FetchAllProducts());

    Navigator.of(context).pushNamed('/all_products');
  }

  void _seeAllFeatured(BuildContext context) {
    //Call Event of Product Bloc
    BlocProvider.of<ProductBloc>(context).add(FetchAllProducts());

    Navigator.of(context).pushNamed('/all_products');
  }

  void _seeAllOfferProducts(BuildContext context) {
    //Call Event of Product Bloc
    BlocProvider.of<ProductBloc>(context).add(FetchAllProducts());

    Navigator.of(context).pushNamed('/all_products');
  }

  void _seeAllCategoryProducts(BuildContext context, String categoryName) {
    //Convert String to enum
    CategoryEnum categoryEnum = convertStringToEnum(categoryName);

    BlocProvider.of<ProductBloc>(context)
        .add(FetchProductOfCategoryEvent(categoryEnum: categoryEnum));

    Navigator.of(context).pushNamed('/all_products');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: sHeight(30.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sWidth(32.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                widget.isScreenTwo ? 'Popular Categories' : 'Special Offers',
                style: kSectionHeading,
              ),
              widget.isScreenTwo
                  ? GestureDetector(
                      onTap: () {
                        _seeAllCategories(context);
                      },
                      child: Text(
                        'see all',
                        style: kRegularSub,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        SizedBox(
          height: sHeight(15.0),
        ),
        Container(
          height: sWidth(130.0),
          child: PageView.builder(
            controller: _offersPageController,
            itemCount:
                widget.isScreenTwo ? _categoriesUrl.length : _offersUrl.length,
            pageSnapping: true,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.centerLeft,
                child: widget.isScreenTwo
                    ? ReusableCategoryHorizontalCard(
                        onTap: () {
                          _seeAllCategoryProducts(
                            context,
                            _categoriesUrl[index][1],
                          );
                        },
                        categoryName: _categoriesUrl[index][1],
                        imageURL: _categoriesUrl[index][0],
                      )
                    : ReusableOfferCard(
                        onTap: () {
                          _seeAllOfferProducts(context);
                        },
                        imageURL: _offersUrl[index],
                      ),
              );
            },
          ),
        ),
        SizedBox(
          height: sHeight(25.0),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sWidth(32.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                widget.isScreenTwo ? 'Featured' : 'For You',
                style: kSectionHeading,
              ),
              GestureDetector(
                onTap: () {
                  widget.isScreenTwo
                      ? _seeAllFeatured(context)
                      : _seeAllForYou(context);
                },
                child: Text(
                  'see all',
                  style: kRegularSub,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: sHeight(15.0),
        ),
        BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeLoading) {
            return Expanded(
              child: DummyVerticalCards(),
            );
          } else if (state is HomeFailure) {
            return Center(
              child: Text(
                state.errorHandler.errorMessage,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            );
          } else if (state is HomeLoaded) {
            _products = state.forYouProducts;
            _products.shuffle(Random());
            return Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(
                  left: sWidth(32.0),
                  right: sWidth(32.0),
                  bottom: sHeight(20.0),
                ),
                itemCount: _products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: sHeight(20.0),
                ),
                itemBuilder: (context, index) {
                  return Container(
                      alignment: index.isEven
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: ReusableProductCard(
                        product: _products[index],
                      ));
                },
              ),
            );
          } else {
            return Center(
              child: Text(
                "Something went wrong",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            );
          }
        }),
      ],
    );
  }
}
