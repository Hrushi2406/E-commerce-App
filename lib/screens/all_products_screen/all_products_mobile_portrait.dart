import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/blocs/bloc/product_bloc.dart';
import 'package:furnitur/core/ui_helper/custom_icons/custom_icons_icons.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';
import 'package:furnitur/core/ui_helper/widgets/app_bar.dart';
import 'package:furnitur/core/ui_helper/widgets/cards.dart';
import 'package:furnitur/core/ui_helper/widgets/filter_chip.dart';
import 'package:furnitur/core/ui_helper/widgets/shrimmers.dart';
import 'package:furnitur/core/utils/enums.dart';
import 'package:furnitur/features/home/data/models/product_model.dart';

//! 1 to-do on this screen

class AllProductsMobilePortrait extends StatefulWidget {
  @override
  _AllProductsMobilePortraitState createState() =>
      _AllProductsMobilePortraitState();
}

class _AllProductsMobilePortraitState extends State<AllProductsMobilePortrait> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  //TODO: show appropriate title
  String _title = 'Table & Chairs';

  //status of price filter chips
  bool _lowChip = false;
  bool _mediumChip = true;
  bool _highChip = true;
  bool _veryHighChip = false;

  //status of filter chips
  bool _lampChip = true;
  bool _loungeChip = true;
  bool _pencilHolderChip = true;
  bool _flowerVaseChip = true;
  bool _woodenFurnitureChip = true;
  bool _tableAndChairChip = true;

  List<ProductModel> _products = [
    ProductModel(
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
    ProductModel(
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
    ProductModel(
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
    ProductModel(
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

  filterByTags() {
    final lamp = _lampChip ? 'lamp' : '';
    final lounge = _loungeChip ? 'lounge' : '';
    final woodenFurniture = _woodenFurnitureChip ? 'wooden_furniture' : '';
    final pencilHolder = _pencilHolderChip ? 'pencil_holder' : '';
    final flowerVase = _flowerVaseChip ? 'flower_vase' : '';
    final tableChair = _tableAndChairChip ? 'table_chair' : '';

    _products = _products.where((product) {
      return product.categories.contains(woodenFurniture) ||
          product.categories.contains(pencilHolder) ||
          product.categories.contains(lounge) ||
          product.categories.contains(lamp) ||
          product.categories.contains(flowerVase) ||
          product.categories.contains(tableChair);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: ReusableAppBar(
        title: '',
        appBar: AppBar(),
        leading: IconButton(
          color: kIconColor,
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        trailing: [
          IconButton(
            color: kOrangeColor,
            icon: Icon(CustomIcons.shopping_bag),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          ),
          IconButton(
            color: kIconColor,
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed('/search');
            },
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: sHeight(70.0),
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(
                bottom: sHeight(15.0),
                left: sWidth(40.0),
              ),
              child: Text(
                'Filters',
                style: kTitle,
              ),
            ),
            Divider(
              color: kBrownColor,
              thickness: sSp(0.5),
            ),
            Padding(
              padding: EdgeInsets.only(left: sWidth(20.0), right: sWidth(20.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: sHeight(25.0),
                  ),
                  Text(
                    'Price (₹):',
                    style: kRegularText.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: sHeight(15.0),
                  ),
                  Wrap(
                    spacing: sWidth(8.0),
                    children: <Widget>[
                      ReusableFilterChip(
                        title: '0 - 2,000',
                        value: _lowChip,
                        onSelected: (newValue) {
                          setState(() {
                            _lowChip = newValue;
                          });
                        },
                      ),
                      ReusableFilterChip(
                        title: '2,000 - 5,000',
                        value: _mediumChip,
                        onSelected: (newValue) {
                          setState(() {
                            _mediumChip = newValue;
                          });
                        },
                      ),
                      ReusableFilterChip(
                        title: '5,000 - 10,000',
                        value: _highChip,
                        onSelected: (newValue) {
                          setState(() {
                            _highChip = newValue;
                          });
                        },
                      ),
                      ReusableFilterChip(
                        title: '10,000 & more',
                        value: _veryHighChip,
                        onSelected: (newValue) {
                          setState(() {
                            _veryHighChip = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sHeight(30.0),
                  ),
                  BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                    if (state is ProductLoaded) {
                      return state.type == ProductTypeEnum.CategoryProducts
                          ? Container()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Tags:',
                                  style: kRegularText.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: sHeight(10.0),
                                ),
                                Wrap(
                                  spacing: sWidth(8.0),
                                  children: <Widget>[
                                    ReusableFilterChip(
                                      title: 'Lamp',
                                      value: _lampChip,
                                      onSelected: (newValue) {
                                        setState(() {
                                          print(newValue);
                                          _lampChip = newValue;
                                          filterByTags();
                                        });
                                      },
                                    ),
                                    ReusableFilterChip(
                                      title: 'Lounge',
                                      value: _loungeChip,
                                      onSelected: (newValue) {
                                        setState(() {
                                          _loungeChip = newValue;
                                        });
                                      },
                                    ),
                                    ReusableFilterChip(
                                      title: 'Pencil Holder',
                                      value: _pencilHolderChip,
                                      onSelected: (newValue) {
                                        setState(() {
                                          _pencilHolderChip = newValue;
                                        });
                                      },
                                    ),
                                    ReusableFilterChip(
                                      title: 'Flower Vase',
                                      value: _flowerVaseChip,
                                      onSelected: (newValue) {
                                        setState(() {
                                          _flowerVaseChip = newValue;
                                        });
                                      },
                                    ),
                                    ReusableFilterChip(
                                      title: 'Wooden Furniture',
                                      value: _woodenFurnitureChip,
                                      onSelected: (newValue) {
                                        setState(() {
                                          _woodenFurnitureChip = newValue;
                                        });
                                      },
                                    ),
                                    ReusableFilterChip(
                                      title: 'Table & Chairs',
                                      value: _tableAndChairChip,
                                      onSelected: (newValue) {
                                        setState(() {
                                          _tableAndChairChip = newValue;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            );
                    } else {
                      return Container();
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        print(state);
        if (state is ProductLoading) {
          return DummyVerticalCards();
        } else if (state is ProductFailure) {
          return Center(
            child: Text(
              state.errorHandler.errorMessage,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          );
        } else if (state is ProductLoaded) {
          _products = state.products;
          if (state.type == ProductTypeEnum.AllProducts) {
            filterByTags();
          }

          _title = state.type == ProductTypeEnum.AllProducts
              ? "Products"
              : state.products[0].mainCategory;
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
                      _title,
                      style: kSectionHeading,
                    ),
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState.openEndDrawer();
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            width: sSp(18.0),
                            height: sSp(18.0),
                            color: kIconColor,
                          ),
                          Icon(
                            CustomIcons.filter_1,
                            size: sSp(20.0),
                            color: kWhiteColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sHeight(20.0),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: sWidth(32.0)),
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
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Center(child: Text("Something went Wrong"));
        }
      }),
    );
  }
}
