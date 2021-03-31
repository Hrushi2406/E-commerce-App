import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';
import 'package:furnitur/core/ui_helper/widgets/cards.dart';
import 'package:furnitur/core/ui_helper/widgets/shrimmers.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';
import 'package:furnitur/features/search/presentation/bloc/search_bloc.dart';
import 'package:furnitur/screens/product_detail_screen/product_detail_screen.dart';

//! 2 to-do's in this screen

class SearchMobilePortrait extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

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

  void _search(BuildContext context, String enteredText) {
    FocusScope.of(context).requestFocus(FocusNode());
    BlocProvider.of<SearchBloc>(context).add(
      GetSearchResults(query: enteredText),
    );
  }

  void _onItemSelected(BuildContext context, int index) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProductDetailScreen(
        product: _products[index],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        title: TextField(
          controller: _searchController,
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search here',
            hintStyle:
                kRegularText.copyWith(color: kBrownColor.withOpacity(0.5)),
          ),
          textInputAction: TextInputAction.search,
          cursorColor: kOrangeColor,
          style: kRegularText,
          onChanged: (newValue) {
            BlocProvider.of<SearchBloc>(context).add(
              GetSearchResults(query: newValue),
            );
          },
          onSubmitted: (newValue) {
            _search(context, newValue);
          },
        ),
        leading: IconButton(
          color: kIconColor,
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: kOrangeColor,
            ),
            onPressed: () {
              _search(context, _searchController.text);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.close,
              color: kIconColor,
            ),
            onPressed: () {
              _searchController.clear();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          //disable keyboard when tapped outside
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
          if (state is SearchLoading) {
            return DummyHorizontalCards();
          } else if (state is SearchFailure) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    state.errorHandler.errorMessage ?? "",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            );
          } else if (state is SearchInitial) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    'You can search with Name, Categories, Color',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            );
          } else if (state is SearchResults) {
            _products = state.searchResults;

            return Container(
              color: Colors.transparent,
              child: ListView.separated(
                padding: EdgeInsets.only(
                  top: sHeight(15.0),
                  bottom: sHeight(20.0),
                ),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  return ReusableSearchCard(
                    onTap: () {
                      _onItemSelected(context, index);
                    },
                    product: _products[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: sHeight(15.0),
                  );
                },
              ),
            );
          } else {
            return Center(child: Text("Something went wrong"));
          }
        }),
      ),
    );
  }
}
