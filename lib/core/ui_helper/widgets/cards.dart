import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';
import 'package:furnitur/features/home/domain/entities/product.dart';
import 'package:furnitur/screens/product_detail_screen/product_detail_screen.dart';
import 'package:transparent_image/transparent_image.dart';

class ReusableProductCard extends StatelessWidget {
  final Product product;

  const ReusableProductCard({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 300),
      closedBuilder: (BuildContext context, VoidCallback open) {
        return GestureDetector(
          onTap: () {
            open();
          },
          child: Container(
            height: sHeight(155.0),
            width: sWidth(135.0),
            decoration: BoxDecoration(
              color: kWhiteColor,
              boxShadow: [kCardShadow],
              borderRadius: BorderRadius.circular(sSp(4.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(sSp(4.0)),
                    topRight: Radius.circular(sSp(4.0)),
                  ),
                  child: FadeInImage.memoryNetwork(
                    fadeInDuration: Duration(milliseconds: 500),
                    placeholder: kTransparentImage,
                    image: product.imageUrl,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: sWidth(16.0),
                    bottom: sWidth(10.0),
                    right: sWidth(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: kCardTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: sWidth(3.0),
                      ),
                      Text(
                        product.mainCategory,
                        style: kCardSubtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      openBuilder: (BuildContext context, VoidCallback close) {
        return ProductDetailScreen(
          product: product,
        );
      },
    );
  }
}

class ReusableSearchCard extends StatelessWidget {
  final Product product;
  final Function onTap;

  const ReusableSearchCard({
    Key key,
    @required this.product,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //only one half star
    bool halfStar = true;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: sWidth(32.0)),
        height: sHeight(80.0),
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [kCardShadow],
          borderRadius: BorderRadius.circular(sSp(4.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(sSp(4.0)),
                bottomLeft: Radius.circular(sSp(4.0)),
              ),
              child: Image(
                image: NetworkImage(
                  product.imageUrl,
                ),
                fit: BoxFit.fitHeight,
                width: sWidth(100.0),
                height: sHeight(80.0),
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: sWidth(15.0),
                        top: sHeight(10.0),
                        right: sWidth(15.0),
                      ),
                      child: Text(
                        product.name,
                        style: kCardTitle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: sWidth(15.0), top: sHeight(3.0)),
                    child: Text(
                      product.mainCategory,
                      style: kCardSubtitle,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: sWidth(15.0), top: sHeight(10.0)),
                    child: Container(
                      width: 100.0,
                      //TODO: might be issue on larger devices
                      height: 0.0,
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
                              size: sSp(14.0),
                            );
                          }
                          if ((product.rating * 10) % 2 != 0 && halfStar) {
                            halfStar = false;
                            return Icon(
                              Icons.star_half,
                              color: kOrangeColor,
                              size: sSp(14.0),
                            );
                          }
                          return Icon(
                            Icons.star_border,
                            color: kOrangeColor,
                            size: sSp(14.0),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: sWidth(2.0),
                          );
                        },
                      ),
                    ),
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

class ReusableCategoryVerticalCard extends StatelessWidget {
  final String categoryName;
  final String imageURL;
  final double height;
  final Function onTap;

  const ReusableCategoryVerticalCard({
    Key key,
    @required this.categoryName,
    @required this.imageURL,
    @required this.height,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sWidth(143.0),
        height: sWidth(height),
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [kCardShadow],
          borderRadius: BorderRadius.circular(sSp(4.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(sSp(4.0)),
                  topRight: Radius.circular(sSp(4.0)),
                ),
                child: FadeInImage.memoryNetwork(
                  fadeInDuration: Duration(milliseconds: 300),
                  placeholder: kTransparentImage,
                  image: imageURL,
                  fit: BoxFit.fitWidth,
                )),
            Padding(
              padding: EdgeInsets.only(left: sWidth(15.0), top: sHeight(10.0)),
              child: Text(
                categoryName,
                style: kCardTitle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCategoryHorizontalCard extends StatelessWidget {
  final String categoryName;
  final String imageURL;
  final Function onTap;

  const ReusableCategoryHorizontalCard({
    Key key,
    @required this.categoryName,
    @required this.imageURL,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sWidth(250.0),
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [kCardShadow],
          borderRadius: BorderRadius.circular(sSp(4.0)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(sSp(4.0)),
          child: Stack(
            children: <Widget>[
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: imageURL,
                fit: BoxFit.cover,
                width: sWidth(250.0),
                height: sWidth(130.0),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: kCardOverlay,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.only(
                  left: sWidth(20.0),
                  bottom: sHeight(10.0),
                ),
                child: Text(
                  categoryName,
                  style: kRegularText.copyWith(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableOfferCard extends StatelessWidget {
  final String imageURL;
  final Function onTap;

  const ReusableOfferCard({
    Key key,
    @required this.imageURL,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: sWidth(250.0),
        decoration: BoxDecoration(
          color: kWhiteColor,
          boxShadow: [kCardShadow],
          borderRadius: BorderRadius.circular(sSp(4.0)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(sSp(4.0)),
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: imageURL,
            fit: BoxFit.cover,
            width: sWidth(250.0),
            height: sWidth(130.0),
          ),
        ),
      ),
    );
  }
}

class ReusableCartCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String imageURL;
  final String quantity;
  final String price;
  final Function increaseQuantity;
  final Function decreaseQuantity;
  final Function deleteItem;

  const ReusableCartCard({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.imageURL,
    @required this.quantity,
    @required this.increaseQuantity,
    @required this.decreaseQuantity,
    @required this.price,
    @required this.deleteItem,
  }) : super(key: key);

  @override
  _ReusableCartCardState createState() => _ReusableCartCardState();
}

class _ReusableCartCardState extends State<ReusableCartCard> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: sWidth(100.0),
      decoration: BoxDecoration(
        color: _isSelected ? const Color(0xFFFFE3D6) : kWhiteColor,
        boxShadow: [kCardShadow],
        borderRadius: BorderRadius.circular(sSp(4.0)),
      ),
      child: Stack(
        children: <Widget>[
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: kOrangeColor.withOpacity(0.2),
              highlightColor: kWhiteColor.withOpacity(0.3),
              onTap: () {},
              onLongPress: () {
                setState(() {
                  _isSelected = !_isSelected;
                });
              },
              child: Container(
                height: sWidth(100.0),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(sSp(4.0)),
                    bottomLeft: Radius.circular(sSp(4.0)),
                  ),
                  child: Image(
                    image: NetworkImage(
                      widget.imageURL,
                    ),
                    fit: BoxFit.fitHeight,
                    width: sWidth(100.0),
                    height: sWidth(100.0),
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: sWidth(15.0),
                          top: sHeight(10.0),
                          right: sWidth(10.0),
                        ),
                        child: Text(
                          widget.title,
                          style: kCardTitle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: sWidth(15.0), top: sHeight(3.0)),
                      child: Text(
                        widget.subtitle,
                        style: kCardSubtitle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: sWidth(15.0), top: sHeight(15.0)),
                      child: _isSelected
                          ? GestureDetector(
                              onTap: widget.deleteItem,
                              child: Icon(
                                Icons.delete,
                                size: sWidth(18.0),
                                color: kBrownColor,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: widget.decreaseQuantity,
                                  child: Container(
                                    width: sWidth(20.0),
                                    height: sWidth(20.0),
                                    decoration: BoxDecoration(
                                      color: kSkinColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(sSp(20.0)),
                                        bottomLeft: Radius.circular(sSp(20.0)),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.remove,
                                      size: 10.0,
                                      color: kBrownColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: sWidth(20.0),
                                  height: sWidth(20.0),
                                  decoration: BoxDecoration(
                                    color: kWhiteColor,
                                    border: Border.all(
                                        width: sSp(0.5), color: kSkinColor),
                                  ),
                                  child: Text(
                                    widget.quantity,
                                    style: TextStyle(
                                      color: kBrownColor,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: widget.increaseQuantity,
                                  child: Container(
                                    width: sWidth(20.0),
                                    height: sWidth(20.0),
                                    decoration: BoxDecoration(
                                      color: kSkinColor,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(sSp(20.0)),
                                        bottomRight: Radius.circular(sSp(20.0)),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.add,
                                      size: 10.0,
                                      color: kBrownColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding:
                EdgeInsets.only(right: sWidth(15.0), bottom: sHeight(10.0)),
            alignment: Alignment.bottomRight,
            child: Text(
              '₹ ${widget.price}',
              style: TextStyle(
                color: kBrownColor,
                fontSize: sSp(14.0),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
