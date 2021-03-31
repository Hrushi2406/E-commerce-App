import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/ui_helper/custom_icons/custom_icons_icons.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';
import 'package:furnitur/core/ui_helper/widgets/app_bar.dart';
import 'package:furnitur/core/ui_helper/widgets/buttons.dart';
import 'package:furnitur/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';
import 'package:transparent_image/transparent_image.dart';

//! 2 to-do's on this screen

class ProductDetailMobilePortrait extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Product product;

  ProductDetailMobilePortrait({
    Key key,
    @required this.product,
  }) : super(key: key);

  Color getColor(String color) {
    final colorArray = color.toLowerCase().split(" ");
    switch (colorArray.length > 1 ? colorArray[1] : colorArray[0]) {
      case 'red':
        return Colors.red;
        break;
      case 'yellow':
        return Colors.yellow;
        break;
      case 'blue':
        return Colors.blue;
        break;
      case 'green':
        return Colors.green;
        break;
      case 'orange':
        return Colors.orange;
        break;
      case 'white':
        return Colors.grey[100];
        break;
      case 'brown':
        return Colors.brown;
        break;
      default:
        return Colors.black54;
    }
  }

  void _addToCart(BuildContext context) {
// ignore: close_sinks
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);

    cartBloc.add(AddItemToCart(cartItem: product));
  }

  @override
  Widget build(BuildContext context) {
    bool halfStar = true;
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
        ],
      ),
      floatingActionButton: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          _scaffoldKey.currentState.hideCurrentSnackBar();
          if (state is CartSuccess) {
            //show snackBar if (cartBloc.state is CartSuccess) {
            SnackBar snackBar = SnackBar(
              content: Text('Item added to cart'),
              backgroundColor: kBrownColor,
            );
            _scaffoldKey.currentState.showSnackBar(snackBar);
          }
          if (state is CartFailure) {
            //show SnackBar if (cartBloc.state is CartSuccess) {
            SnackBar snackBar = SnackBar(
              content: Text('Item already present in cart'),
              backgroundColor: kBrownColor,
            );
            _scaffoldKey.currentState.showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: sHeight(20.0),
              right: sWidth(20.0),
            ),
            child: ReusableRegularButton(
              text: 'ADD TO CART',
              onPressed: () => _addToCart(context),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeInImage.memoryNetwork(
              fadeInDuration: Duration(milliseconds: 500),
              placeholder: kTransparentImage,
              image: product.imageUrl,
              fit: BoxFit.fitWidth,
              width: double.infinity,
            ),
            SizedBox(
              height: sHeight(20.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sWidth(32.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.name,
                    style: TextStyle(
                      color: kBrownColor,
                      fontSize: sSp(18.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: sHeight(5.0),
                  ),
                  Container(
                    height: sHeight(10.0),
                    child: ListView.separated(
                      padding: EdgeInsets.all(0.0),
                      scrollDirection: Axis.horizontal,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        if (index < product.rating.toInt()) {
                          return Icon(
                            Icons.star,
                            color: kOrangeColor,
                            size: sSp(16.0),
                          );
                        }
                        if ((product.rating * 10) % 2 != 0 && halfStar) {
                          halfStar = false;
                          return Icon(
                            Icons.star_half,
                            color: kOrangeColor,
                            size: sSp(16.0),
                          );
                        }
                        return Icon(
                          Icons.star_border,
                          color: kOrangeColor,
                          size: sSp(16.0),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: sWidth(2.0),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: sHeight(20.0),
                  ),
                  Text(
                    'Price: ₹${product.price}',
                    style: TextStyle(
                      color: kBrownColor,
                      fontSize: sSp(14.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: sHeight(2.0),
                  ),
                  Text(
                    'category: ${product.mainCategory}',
                    style: TextStyle(
                      color: kBrownColor,
                      fontSize: sSp(12.0),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: sHeight(20.0),
                  ),
                  Text(
                    'Description:',
                    style: TextStyle(
                      color: kBrownColor,
                      fontSize: sSp(14.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: sHeight(8.0),
                  ),
                  Text(
                    product.description,
                    style: TextStyle(
                      color: kBrownColor,
                      fontSize: sSp(12.0),
                      fontWeight: FontWeight.normal,
                      height: sHeight(1.6),
                    ),
                  ),
                  SizedBox(
                    height: sHeight(20.0),
                  ),
                  Text(
                    'Choose color:',
                    style: TextStyle(
                      color: kBrownColor,
                      fontSize: sSp(14.0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: sHeight(8.0),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    buildWhen: (previousState, currentState) {
                      return currentState is ItemColorChanged;
                    },
                    builder: (context, state) {
                      int _selectedColorIndex = 0;
                      if (state is ItemColorChanged) {
                        _selectedColorIndex = state.newIndex;
                      }
                      return Container(
                        height: sHeight(25.0),
                        child: ListView.separated(
                          padding: EdgeInsets.all(0.0),
                          scrollDirection: Axis.horizontal,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: product.colors.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<CartBloc>(context).add(
                                  ChangeItemColor(colorIndex: index),
                                );
                              },
                              child: Container(
                                height: sWidth(25.0),
                                width: sWidth(25.0),
                                decoration: BoxDecoration(
                                  border: _selectedColorIndex == index
                                      ? Border.all(
                                          color: Colors.black,
                                          width: sWidth(2.0))
                                      : null,
                                  color: getColor(product.colors[index]),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: sWidth(10.0),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: sHeight(20.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
