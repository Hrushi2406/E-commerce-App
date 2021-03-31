import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/blocs/app_bloc/applevel_bloc.dart';
import 'package:furnitur/features/authentication/presentation/bloc/authentication_bloc.dart';

import '../../../../../core/ui_helper/ui_helper.dart';
import '../../../../../core/ui_helper/widgets/buttons.dart';
import '../../../../../core/ui_helper/widgets/text_field.dart';

//! 5 to-do's in this file

class LoginMobilePortrait extends StatelessWidget {
  //global keys
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // final bool _isLoading = false;

  String _emailValidator(newValue) {
    //TODO: validate email
    return null;
  }

  String _passwordValidator(newValue) {
    //TODO: validate password
    return null;
  }

  void _forgotPassword() {
    //TODO: forgot password
  }

  void _loginUser(BuildContext context) {
    //dispatching the event
    BlocProvider.of<AuthenticationBloc>(context).add(LoginUserWithEmail(
        email: _emailController.text, password: _passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            //removing keyboard on tap anywhere
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
            if (state is AuthenticatedUser) {
              BlocProvider.of<ApplevelBloc>(context).add(SetAuthenticated());
              Navigator.of(context).pushReplacementNamed('/splash');
            }
          }, builder: (context, state) {
            print(state);
            // if (state is AuthenticationInitial) {
            //   return Center(child: Text("INITAL"));
            // }
            // if (state is AuthenticatedUser) {
            //   Navigator.of(context).pushNamed('/home');
            // }
            return Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: sWidth(45.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: sHeightMultiplier * 15,
                    width: double.infinity,
                  ),
                  Container(
                    width: sWidth(165.0),
                    child: const Image(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  SizedBox(
                    height: sHeight(60),
                  ),
                  Text(
                    'LOGIN',
                    style: kHeading2,
                  ),
                  SizedBox(
                    height: sHeight(30),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ReusableTextFormField(
                          controller: _emailController,
                          labelText: 'Email',
                          isObscureText: false,
                          validator: (newValue) {
                            return _emailValidator(newValue);
                          },
                          type: TextInputType.emailAddress,
                          error: state is AuthenticationFailure
                              ? state.errorHandler.email
                              : '',
                        ),
                        SizedBox(
                          height: sHeight(20.0),
                        ),
                        ReusableTextFormField(
                          controller: _passwordController,
                          labelText: 'Password',
                          isObscureText: true,
                          validator: (newValue) {
                            return _passwordValidator(newValue);
                          },
                          error: state is AuthenticationFailure
                              ? state.errorHandler.password
                              : '',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: sHeight(10),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: _forgotPassword,
                      child: Text(
                        'forgot password?',
                        style: TextStyle(
                          color: kIconColor,
                          fontSize: sSp(11.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sHeight(30),
                  ),
                  state is AuthenticationLoading
                      ? Container(
                          height: sWidth(30.0),
                          width: sWidth(30.0),
                          child: CircularProgressIndicator(),
                        )
                      : ReusableLoginButton(
                          onPressed: () {
                            _loginUser(context);
                          },
                          title: 'LOGIN',
                        ),
                  SizedBox(
                    height: sHeight(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(
                          color: kIconColor,
                          fontSize: sSp(13.0),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //navigate ot sign up screen
                          Navigator.of(context).pushNamed('/signup');
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: kOrangeColor,
                            fontSize: sSp(13.0),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
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
