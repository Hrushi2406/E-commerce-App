import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitur/core/blocs/app_bloc/applevel_bloc.dart';
import 'package:furnitur/core/blocs/bloc/product_bloc.dart';
import 'package:furnitur/features/home/presentation/bloc/home_bloc.dart';
import 'package:furnitur/screens/splash_screen/splash_screen.dart';

import './service_locator.dart' as serviceLocator;
import 'core/ui_helper/ui_helper.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/authentication/presentation/screens/login_screen/login_screen.dart';
import 'features/authentication/presentation/screens/on_boarding_screen/on_boarding_screen.dart';
import 'features/authentication/presentation/screens/signup_screen/signup_screen.dart';
import 'features/cart/presentation/bloc/cart_bloc.dart';
import 'features/search/presentation/bloc/search_bloc.dart';
import 'screens/all_categories_screen/all_categories_screen.dart';
import 'screens/all_products_screen/all_products_screen.dart';
import 'screens/cart_screen/cart_screen.dart';
import 'screens/checking_out/checking_out_screen.dart';
import 'screens/review_order/review_order_screen.dart';
import 'screens/search_screen/search_screen.dart';
import 'screens/tabs/tabs.dart';
import 'service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator.init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplevelBloc>(
          create: (context) => locator<ApplevelBloc>()..add(AppStarted()),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => locator<AuthenticationBloc>(),
        ),
        BlocProvider<HomeBloc>(
          lazy: false,
          create: (context) => locator<HomeBloc>(),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => locator<ProductBloc>(),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => locator<SearchBloc>(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => locator<CartBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Furnitur',
        //device preview
        locale: DevicePreview.of(context).locale,
        builder: DevicePreview.appBuilder,
        //hiding debug-mode banner
        debugShowCheckedModeBanner: false,
        //theme
        theme: ThemeData(
          primaryColor: kOrangeColor,
          accentColor: kOrangeColor,
          scaffoldBackgroundColor: kWhiteColor,
        ),
        initialRoute: '/splash',
        routes: {
          // '/': (context) => CheckAuth(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignupScreen(),
          '/onBoarding': (context) => OnBoardingScreen(),
          '/home': (context) => TabsScreen(),
          '/search': (context) => SearchScreen(),
          '/all_products': (context) => AllProductsScreen(),
          '/all_categories': (context) => AllCategoriesScreen(),
          '/cart': (context) => CartScreen(),
          '/checking_out': (context) => CheckingOutScreen(),
          '/review_order': (context) => ReviewOrderScreen(),
          '/splash': (context) => SplashScreen(),
        },
      ),
    );
  }
}
