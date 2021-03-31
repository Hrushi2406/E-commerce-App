import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/blocs/bloc/product_bloc.dart';
import 'package:furnitur/core/ui_helper/custom_icons/custom_icons_icons.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';
import 'package:furnitur/core/ui_helper/widgets/app_bar.dart';
import 'package:furnitur/core/ui_helper/widgets/cards.dart';
import 'package:furnitur/core/utils/enums.dart';

//! 6 to-do's on this screen

class AllCategoriesMobilePortrait extends StatelessWidget {
  void _showProductsOfCategory(BuildContext context, CategoryEnum category) {
    //Trigger event
    BlocProvider.of<ProductBloc>(context)
        .add(FetchProductOfCategoryEvent(categoryEnum: category));

    Navigator.of(context).pushNamed('/all_products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        title: 'Categories',
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
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: sWidth(32.0)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: sHeight(30.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ReusableCategoryVerticalCard(
                        categoryName: 'Lamp',
                        //!responsiveness is handled in the card
                        height: 147.0,
                        imageURL:
                            'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592721784/furnitur/lamp_drc9p2.png',
                        onTap: () {
                          _showProductsOfCategory(context, CategoryEnum.Lamp);
                        },
                      ),
                      SizedBox(
                        height: sHeight(15.0),
                      ),
                      ReusableCategoryVerticalCard(
                        categoryName: 'Lounge',
                        //!responsiveness is handled in the card
                        height: 193.0,
                        imageURL:
                            'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592721790/furnitur/lounge_kwgyul.png',
                        onTap: () {
                          _showProductsOfCategory(context, CategoryEnum.Lounge);
                        },
                      ),
                      SizedBox(
                        height: sHeight(15.0),
                      ),
                      ReusableCategoryVerticalCard(
                        categoryName: 'Wooden Furniture',
                        //!responsiveness is handled in the card
                        height: 147.0,
                        imageURL:
                            'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592721792/furnitur/wooden_wm8rp0.png',
                        onTap: () {
                          _showProductsOfCategory(
                              context, CategoryEnum.WoodenFurniture);
                        },
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ReusableCategoryVerticalCard(
                        categoryName: 'Flower Vase',
                        //!responsiveness is handled in the card
                        height: 201.0,
                        imageURL:
                            'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592721786/furnitur/vase_oq9wgc.png',
                        onTap: () {
                          _showProductsOfCategory(
                              context, CategoryEnum.PlantVase);
                        },
                      ),
                      SizedBox(
                        height: sHeight(15.0),
                      ),
                      ReusableCategoryVerticalCard(
                        categoryName: 'Pencil Holder',
                        //!responsiveness is handled in the card
                        height: 147.0,
                        imageURL:
                            'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592721791/furnitur/pencil_fgzhha.png',
                        onTap: () {
                          _showProductsOfCategory(
                              context, CategoryEnum.PencilHolder);
                        },
                      ),
                      SizedBox(
                        height: sHeight(15.0),
                      ),
                      ReusableCategoryVerticalCard(
                        categoryName: 'Table & Chair',
                        //!responsiveness is handled in the card
                        height: 147.0,
                        imageURL:
                            'https://res.cloudinary.com/dbbkmv1rs/image/upload/v1592721798/furnitur/table_cx6jjh.png',
                        onTap: () {
                          _showProductsOfCategory(
                              context, CategoryEnum.TableAndChair);
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: sHeight(20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
