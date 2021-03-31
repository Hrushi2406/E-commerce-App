import 'package:flutter/material.dart';
import 'package:furnitur/core/ui_helper/ui_helper.dart';
import 'package:furnitur/core/ui_helper/widgets/app_bar.dart';
import 'package:furnitur/core/ui_helper/widgets/buttons.dart';
import 'package:furnitur/core/ui_helper/widgets/text_field.dart';

//! 12 to-do's in this file

enum DeliveryOptions {
  PayPal,
  COD,
}

class CheckingOutMobilePortrait extends StatefulWidget {
  final int totalAmount;

  const CheckingOutMobilePortrait({Key key, this.totalAmount})
      : super(key: key);
  @override
  _CheckingOutMobilePortraitState createState() =>
      _CheckingOutMobilePortraitState();
}

class _CheckingOutMobilePortraitState extends State<CheckingOutMobilePortrait> {
  final GlobalKey<FormState> _addressFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _cardFormKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cardCVVController = TextEditingController();
  final TextEditingController _cardYearController = TextEditingController();

  final TextEditingController _upiIDController = TextEditingController();

  DeliveryOptions _deliveryOptions = DeliveryOptions.COD;

  //textFormField validators

  String _fullNameValidator(String fullName) {
    //TODO: validate full name
    return null;
  }

  String _addressValidator(String address) {
    //TODO: validate address
    return null;
  }

  String _stateValidator(String state) {
    //TODO: validate state
    return null;
  }

  String _cityValidator(String city) {
    //TODO: validate city
    return null;
  }

  String _pincodeValidator(String pincode) {
    //TODO: validate pincode
    return null;
  }

  String _mobileValidator(String mobile) {
    //TODO: validate mobile number
    return null;
  }

  String _cardNameValidator(String cardName) {
    //TODO: validate card name
    return null;
  }

  String _cardNumberValidator(String cardNumber) {
    //TODO: validate card number
    return null;
  }

  String _cardCVVValidator(String cardCVV) {
    //TODO: validate card CVV
    return null;
  }

  String _cardYearValidator(String cardYear) {
    //TODO: validate card year
    return null;
  }

  String _upiValidator(String cardCVV) {
    //TODO: validate UPI ID
    return null;
  }

  void _reviewOrder(BuildContext context) {
    //TODO: review order
    Navigator.of(context).pushNamed('/review_order');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableAppBar(
        title: 'Checking Out',
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
      body: GestureDetector(
        onTap: () {
          //disable keyboard when pressed outside
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: sWidth(32.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: sHeight(30.0),
                        ),
                        Text(
                          'Delivery address:',
                          style: kSectionHeading,
                        ),
                        SizedBox(
                          height: sHeight(12.0),
                        ),
                        Container(
                          width: double.infinity,
                          padding:
                              EdgeInsets.symmetric(horizontal: sWidth(15.0)),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(sSp(4.0)),
                            boxShadow: [kCardShadow],
                          ),
                          child: Form(
                            key: _addressFormKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: sHeight(15.0),
                                ),
                                ReusableSmallTextFormField(
                                  controller: _fullNameController,
                                  labelText: 'Full Name',
                                  isMultiline: false,
                                  validator: (value) {
                                    return _fullNameValidator(value);
                                  },
                                ),
                                SizedBox(
                                  height: sHeight(12.0),
                                ),
                                ReusableSmallTextFormField(
                                  controller: _addressController,
                                  labelText: 'Address 1',
                                  isMultiline: true,
                                  validator: (value) {
                                    return _addressValidator(value);
                                  },
                                ),
                                SizedBox(
                                  height: sHeight(12.0),
                                ),
                                Container(
                                  width: sWidth(220.0),
                                  child: ReusableSmallTextFormField(
                                    controller: _stateController,
                                    labelText: 'State',
                                    isMultiline: false,
                                    validator: (value) {
                                      return _stateValidator(value);
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: sHeight(12.0),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 4,
                                      child: ReusableSmallTextFormField(
                                        controller: _cityController,
                                        labelText: 'City',
                                        isMultiline: false,
                                        validator: (value) {
                                          return _cityValidator(value);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: sWidth(6.0),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ReusableSmallTextFormField(
                                        controller: _pincodeController,
                                        labelText: 'Pincode',
                                        isMultiline: false,
                                        validator: (value) {
                                          return _pincodeValidator(value);
                                        },
                                        type: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: sHeight(12.0),
                                ),
                                ReusableSmallTextFormField(
                                  controller: _mobileController,
                                  labelText: 'Mobile',
                                  isMultiline: false,
                                  validator: (value) {
                                    return _mobileValidator(value);
                                  },
                                  type: TextInputType.number,
                                ),
                                SizedBox(
                                  height: sHeight(20.0),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: sHeight(35.0),
                        ),
                        Text(
                          'Payment method:',
                          style: kSectionHeading,
                        ),
                        SizedBox(
                          height: sHeight(12.0),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: sWidth(15.0),
                            vertical: sHeight(20.0),
                          ),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(sSp(4.0)),
                            boxShadow: [kCardShadow],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Form(
                                key: _cardFormKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Card',
                                      style: TextStyle(
                                          color: kBrownColor,
                                          fontSize: sSp(14.0),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: sHeight(12.0),
                                    ),
                                    ReusableSmallTextFormField(
                                      controller: _cardNameController,
                                      labelText: 'Full Name',
                                      isMultiline: false,
                                      validator: (value) {
                                        return _cardNameValidator(value);
                                      },
                                    ),
                                    SizedBox(
                                      height: sHeight(12.0),
                                    ),
                                    ReusableSmallTextFormField(
                                      controller: _cardNumberController,
                                      labelText: 'Card Number',
                                      isMultiline: false,
                                      validator: (value) {
                                        return _cardNumberValidator(value);
                                      },
                                      type: TextInputType.number,
                                    ),
                                    SizedBox(
                                      height: sHeight(12.0),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: ReusableSmallTextFormField(
                                            controller: _cardCVVController,
                                            labelText: 'CVV',
                                            isMultiline: false,
                                            validator: (value) {
                                              return _cardCVVValidator(value);
                                            },
                                            type: TextInputType.number,
                                          ),
                                        ),
                                        SizedBox(
                                          width: sWidth(6.0),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: ReusableSmallTextFormField(
                                            controller: _cardYearController,
                                            labelText: 'MM/YY',
                                            isMultiline: false,
                                            validator: (value) {
                                              return _cardYearValidator(value);
                                            },
                                            type: TextInputType.number,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: sHeight(25.0),
                              ),
                              Text(
                                'UPI',
                                style: TextStyle(
                                    color: kBrownColor,
                                    fontSize: sSp(14.0),
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: sHeight(12.0),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    flex: 5,
                                    child: ReusableSmallTextFormField(
                                      controller: _upiIDController,
                                      labelText: 'UPI ID',
                                      isMultiline: false,
                                      validator: (value) {
                                        return _upiValidator(value);
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: sWidth(10.0),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: MaterialButton(
                                      height: sHeight(42.0),
                                      color: kBrownColor,
                                      highlightElevation: 0.0,
                                      splashColor: kWhiteColor.withOpacity(0.2),
                                      child: Text(
                                        'PAY',
                                        style: kButtonText.copyWith(
                                          color: kWhiteColor,
                                        ),
                                      ),
                                      onPressed: () {
                                        //pay with UPI
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: sHeight(10.0),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Radio(
                                    activeColor: kBrownColor,
                                    value: DeliveryOptions.PayPal,
                                    groupValue: _deliveryOptions,
                                    onChanged: (value) {
                                      setState(() {
                                        _deliveryOptions = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    'PayPal',
                                    style: TextStyle(
                                        color: kBrownColor,
                                        fontSize: sSp(14.0),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Radio(
                                    activeColor: kBrownColor,
                                    value: DeliveryOptions.COD,
                                    groupValue: _deliveryOptions,
                                    onChanged: (value) {
                                      setState(() {
                                        _deliveryOptions = value;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Cash on Delivery',
                                    style: TextStyle(
                                        color: kBrownColor,
                                        fontSize: sSp(14.0),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: sWidth(28.0)),
                alignment: Alignment.center,
                height: sHeight(54.0),
                width: double.infinity,
                color: kBrownColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Total: ₹${widget.totalAmount.toString()}',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: sSp(14.0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: sHeight(11.0)),
                      child: ReusableRegularButton(
                        text: 'REVIEW ORDER',
                        onPressed: () {
                          _reviewOrder(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
