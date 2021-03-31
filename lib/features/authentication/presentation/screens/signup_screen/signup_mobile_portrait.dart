import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/blocs/app_bloc/applevel_bloc.dart';
import 'package:furnitur/features/authentication/presentation/bloc/authentication_bloc.dart';

import '../../../../../core/ui_helper/ui_helper.dart';
import '../../../../../core/ui_helper/widgets/buttons.dart';
import '../../../../../core/ui_helper/widgets/text_field.dart';

//! 7 to-do's in this screen

class SignupMobilePortrait extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // final bool _isLoading = false;

  String _nameValidator(newValue) {
    //TODO: validate name
    return null;
  }

  String _emailValidator(newValue) {
    //TODO: validate email
    return null;
  }

  String _passwordValidator(newValue) {
    //TODO: validate password
    return null;
  }

  void _signupUser(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(
      RegisterUserWithEmail(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  void _signupWithGoogle() {
    //TODO: signup with google
  }

  void _signupWithFacebook() {
    //TODO: signup with facebook
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0.0,
        centerTitle: false,
        title: Container(
          width: sWidth(90.0),
          child: Image(
            image: AssetImage('assets/images/logo.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        leading: IconButton(
          padding: EdgeInsets.all(0.0),
          iconSize: sSp(24.0),
          color: kBrownColor,
          icon: const Icon(
            Icons.chevron_left,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            //disable keyboard on tap outside
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
            if (state is AuthenticatedUser) {
              BlocProvider.of<ApplevelBloc>(context).add(SetAuthenticated());
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/splash', (route) => false);
            }
          }, builder: (context, state) {
            return Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: sWidth(45.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: sHeightMultiplier * 6.0,
                  ),
                  Text(
                    'SIGN UP',
                    style: kHeading2,
                  ),
                  SizedBox(
                    height: sHeight(30.0),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      // mainAxisAlignmesnapshotainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ReusableTextFormField(
                          controller: _nameController,
                          labelText: 'Name',
                          isObscureText: false,
                          validator: (newValue) {
                            _nameValidator(newValue);
                          },
                          error: state is AuthenticationFailure
                              ? state.errorHandler.name
                              : '',
                        ),
                        SizedBox(
                          height: sHeight(15.0),
                        ),
                        ReusableTextFormField(
                          controller: _emailController,
                          labelText: 'Email',
                          isObscureText: false,
                          validator: (newValue) {
                            _emailValidator(newValue);
                          },
                          type: TextInputType.emailAddress,
                          error: state is AuthenticationFailure
                              ? state.errorHandler.email
                              : '',
                        ),
                        SizedBox(
                          height: sHeight(15.0),
                        ),
                        ReusableTextFormField(
                          controller: _passwordController,
                          labelText: 'Password',
                          isObscureText: true,
                          validator: (newValue) {
                            _passwordValidator(newValue);
                          },
                          error: state is AuthenticationFailure
                              ? state.errorHandler.password
                              : '',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sHeight(25),
                  ),
                  state is AuthenticationLoading
                      ? Container(
                          height: sWidth(30.0),
                          width: sWidth(30.0),
                          child: CircularProgressIndicator(),
                        )
                      : ReusableLoginButton(
                          onPressed: () => _signupUser(context),
                          title: 'SIGN UP',
                        ),
                  SizedBox(
                    height: sHeight(25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: sWidth(120.0),
                        height: sHeight(0.25),
                        color: kBrownColor,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: sWidth(8.0)),
                        child: Text(
                          'OR',
                          style: TextStyle(
                            color: kBrownColor.withOpacity(0.8),
                            fontSize: sSp(9.0),
                          ),
                        ),
                      ),
                      Container(
                        width: sWidth(120.0),
                        height: sHeight(0.25),
                        color: kBrownColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: sHeight(25),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: kBrownColor, width: sSp(0.5)),
                      borderRadius: BorderRadius.circular(sSp(3.0)),
                    ),
                    child: ExternalSignupReusableButton(
                      title: 'google',
                      onPressed: _signupWithGoogle,
                    ),
                  ),
                  SizedBox(
                    height: sHeight(15),
                  ),
                  ExternalSignupReusableButton(
                    title: 'facebook',
                    onPressed: _signupWithFacebook,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
