import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/ui_helper/responsive/responsive.dart';
import 'package:furnitur/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:furnitur/screens/cart_screen/cart_mobile_portrait.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(GetCartItems());

    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: CartMobilePortrait(),
      ),
    );
  }
}
