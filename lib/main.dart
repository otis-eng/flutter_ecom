import 'package:advika/screens/add_address/add_address.dart';
import 'package:advika/screens/congratulation/congratulation.dart';
import 'package:advika/screens/filter/filter.dart';
import 'package:advika/screens/home/home.dart';
import 'package:advika/screens/login_signup/login.dart';
import 'package:advika/screens/login_signup/signup.dart';
import 'package:advika/screens/payment/payment.dart';
import 'package:advika/screens/shipping_to/shipping_to.dart';
import 'package:advika/screens/splash/splash.dart';
import 'package:advika/screens/walk_through/walk_through.dart';
import 'package:advika/screens/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'screens/cart/cart.dart';
import 'screens/categories/categories.dart';
import 'screens/my_account/my_account.dart';
import 'screens/products/products.dart';
import 'screens/product_detail/product_detail.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        final MediaQueryData data  = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: data.textScaleFactor > 1.15 ? 1.15 : data.textScaleFactor,
          ),
            child: child!
        );
      },
        title: 'advika',
        navigatorObservers: [routeObserver],
        theme: ThemeData(
          fontFamily: 'Montserrat', colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kImageDefaultBackgroundColor),
        ),
        debugShowCheckedModeBanner: false,

        initialRoute: SplashScreen.path,
        routes: {
          LoginScreen.path: (context) => const LoginScreen(),
          SignupScreen.path: (context) => const SignupScreen(),
          HomeScreen.path: (context) => const HomeScreen(),
          CartScreen.path: (context) => const CartScreen(),
          CategoriesScreen.path: (context) => const CategoriesScreen(),
          ProductsScreen.path: (context) => const ProductsScreen(),
          WalkThroughScreen.path: (context) => WalkThroughScreen(),
          ProductDetailScreen.path: (context) => const ProductDetailScreen(),
          MyAccountScreen.path: (context) => const MyAccountScreen(),
          ShippingToScreen.path: (context) => const ShippingToScreen(),
          FilterScreen.path: (context) => const FilterScreen(),
          PaymentScreen.path: (context) => const PaymentScreen(),
          SplashScreen.path: (context) => const SplashScreen(),
          CongratulationScreen.path: (context) => const CongratulationScreen(),
          WishListScreen.path: (context) => const WishListScreen(),
          AddAddressScreen.path: (context) => const AddAddressScreen(),
        });
  }
}
