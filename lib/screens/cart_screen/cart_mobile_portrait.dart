import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';
import 'package:furnitur/core/ui_helper/widgets/app_bar.dart';
import 'package:furnitur/core/ui_helper/widgets/buttons.dart';
import 'package:furnitur/core/ui_helper/widgets/cards.dart';
import 'package:furnitur/core/ui_helper/widgets/shrimmers.dart';
import 'package:furnitur/features/cart/domain/entities/cart_item.dart';
import 'package:furnitur/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:furnitur/screens/checking_out/checking_out_screen.dart';

//! 3 to-do's in this screen

class CartMobilePortrait extends StatefulWidget {
  @override
  _CartMobilePortraitState createState() => _CartMobilePortraitState();
}

class _CartMobilePortraitState extends State<CartMobilePortrait> {
  List<CartItem> _itemsInCart = [];

  int total = 0;

  void _increaseQuantityOfItem(int itemIndex) {
    _itemsInCart[itemIndex].quantity += 1;
    setState(() {});
  }

  void _decreaseQuantityOfItem(int itemIndex) {
    if (_itemsInCart[itemIndex].quantity > 1) {
      _itemsInCart[itemIndex].quantity -= 1;
    }
    setState(() {});
  }

  void _deleteItem(index) {
    BlocProvider.of<CartBloc>(context)
        .add(DeleteItemToCart(cartItem: _itemsInCart[index]));
  }

  void _checkOut(BuildContext context) {
    total = 0;
    _itemsInCart.forEach((item) {
      total = total + (item.price * item.quantity);
    });

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => CheckingOutScreen(totalAmount: total)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        title: 'Cart',
        appBar: AppBar(),
        leading: IconButton(
          color: kIconColor,
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        trailing: [],
      ),
      body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        if (state is CartLoading) {
          return DummyHorizontalCards();
        } else if (state is CartFailure) {
          return Center(
            child: Text(
              state.errorHandler.errorMessage,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          );
        } else if (state is CartLoaded) {
          _itemsInCart = state.cartItems;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: sHeight(30.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sWidth(32.0)),
                child: Text(
                  'Items: ${_itemsInCart.length}',
                  style: kSectionHeading,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.only(
                    left: sWidth(32.0),
                    top: sHeight(15.0),
                    right: sWidth(32.0),
                  ),
                  itemCount: _itemsInCart.length,
                  itemBuilder: (context, index) {
                    if (index == _itemsInCart.length - 1) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ReusableCartCard(
                            title: _itemsInCart[index].name,
                            subtitle: _itemsInCart[index].mainCategory,
                            imageURL: _itemsInCart[index].imageUrl,
                            quantity: _itemsInCart[index].quantity.toString(),
                            price: (_itemsInCart[index].quantity *
                                    _itemsInCart[index].price)
                                .toString(),
                            increaseQuantity: () {
                              _increaseQuantityOfItem(index);
                            },
                            decreaseQuantity: () {
                              _decreaseQuantityOfItem(index);
                            },
                            deleteItem: () {
                              _deleteItem(index);
                            },
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(top: sHeight(10.0)),
                            child: ReusableRegularButton(
                              text: 'CHECKOUT',
                              onPressed: () {
                                _checkOut(context);
                              },
                            ),
                          ),
                          SizedBox(
                            height: sHeight(30.0),
                          ),
                        ],
                      );
                    }

                    return ReusableCartCard(
                      title: _itemsInCart[index].name,
                      subtitle: _itemsInCart[index].mainCategory,
                      imageURL: _itemsInCart[index].imageUrl,
                      quantity: _itemsInCart[index].quantity.toString(),
                      price: (_itemsInCart[index].quantity *
                              _itemsInCart[index].price)
                          .toString(),
                      increaseQuantity: () {
                        _increaseQuantityOfItem(index);
                      },
                      decreaseQuantity: () {
                        _decreaseQuantityOfItem(index);
                      },
                      deleteItem: () {
                        _deleteItem(index);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: sHeight(15.0),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return Center(child: Text("Something went wrong"));
        }
      }),
    );
  }
}
