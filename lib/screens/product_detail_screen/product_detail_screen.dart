import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/responsive/responsive.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';
import 'package:furnitur/screens/product_detail_screen/product_detail_mobile_portrait.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({
    Key key,
    @required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: ProductDetailMobilePortrait(
          product: product,
        ),
      ),
    );
  }
}
