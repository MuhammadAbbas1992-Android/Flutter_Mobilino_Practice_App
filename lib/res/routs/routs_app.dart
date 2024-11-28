import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:mobilino/res/routs/routs_name.dart';
import 'package:mobilino/views/contact_us/contact_us_view.dart';
import 'package:mobilino/views/login/admin_login_view.dart';
import 'package:mobilino/views/login/user_login_view.dart';
import 'package:mobilino/views/nav_bar/nav_bar_view.dart';
import 'package:mobilino/views/products/admin_products_view.dart';
import 'package:mobilino/views/products/user_products_view.dart';

import '../../views/about_us/about_us_view.dart';
import '../../views/add_product/add_product_view.dart';
import '../../views/cart/cart_view.dart';
import '../../views/home/home_view.dart';
import '../../views/product_detail/product_detail_view.dart';
import '../../views/sign_up/sign_up_view.dart';
import '../../views/splash/splash_view.dart';

class AppRouts {
  AppRouts._();
  static String initial = RoutsName.splashView;
  static final appRouts = [
    GetPage(
        name: RoutsName.splashView,
        page: () => const SplashView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutsName.userLoginView,
        page: () => const UserLoginView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutsName.adminLoginView,
        page: () => const AdminLoginView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutsName.signUpView,
        page: () => const SignUpView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutsName.homeView,
        page: () => const HomeView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutsName.userProductsView,
        page: () => const UserProductsView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutsName.adminProductsView,
        page: () => const AdminProductsView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutsName.productsDetailView,
        page: () => const ProductDetailView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutsName.cartView,
        page: () => const CartView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutsName.aboutUsView,
        page: () => const AboutUsView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutsName.contactUsView,
        page: () => const ContactUsView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutsName.addProductView,
        page: () => const AddProductView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
    GetPage(
        name: RoutsName.navBarView,
        page: () => const NavBarView(),
        transitionDuration: const Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
  ];
}
