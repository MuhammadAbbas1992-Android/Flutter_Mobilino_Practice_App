import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilino/res/routs/routs_app.dart';
import 'package:mobilino/views/about_us/about_us_view.dart';
import 'package:mobilino/views/add_product/add_product_view.dart';
import 'package:mobilino/views/cart/cart_view.dart';
import 'package:mobilino/views/contact_us/contact_us_view.dart';
import 'package:mobilino/views/home/home_view.dart';
import 'package:mobilino/views/login/admin_login_view.dart';
import 'package:mobilino/views/login/user_login_view.dart';
import 'package:mobilino/views/nav_bar/nav_bar_view.dart';
import 'package:mobilino/views/product_detail/product_detail_view.dart';
import 'package:mobilino/views/products/admin_products_view.dart';
import 'package:mobilino/views/products/user_products_view.dart';
import 'package:mobilino/views/sign_up/sign_up_view.dart';
import 'package:mobilino/views/splash/splash_view.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRouts.initial,
      getPages: AppRouts.appRouts,
      // home: const SplashView(),
      // home: const UserLoginView(),
      // home: const AdminLoginView(),
      // home: const SignUpView(),
      // home: const HomeView(),
      // home: const NavBarView(),
      // home: const AdminProductsView(),
      // home: const AddProductView(),
      // home: const UserProductsView(),
      // home: const ContactUsView(),
      // home: const AboutUsView(),
      // home: const CartView(),
      // home: const ProductDetailView(),
    );
  }
}
