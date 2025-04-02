import 'package:app_congonhas/src/login/register/enter_account/enter_account_binding.dart';
import 'package:app_congonhas/src/login/register/enter_account/enter_account_view.dart';
import 'package:app_congonhas/src/login/register/make_account/make_account_binding.dart';
import 'package:app_congonhas/src/login/register/make_account/make_account_view.dart';
import 'package:app_congonhas/src/login/welcome/welcome_binding.dart';
import 'package:app_congonhas/src/login/welcome/welcome_view.dart';
import 'package:app_congonhas/src/principal/home/buying/buying_binding.dart';
import 'package:app_congonhas/src/principal/home/buying/buying_view.dart';
import 'package:app_congonhas/src/principal/home/home_binding.dart';
import 'package:app_congonhas/src/principal/home/home_view.dart';
import 'package:app_congonhas/src/principal/more/more_binding.dart';
import 'package:app_congonhas/src/principal/more/more_view.dart';
import 'package:app_congonhas/src/principal/my_cart/my_cart_binding.dart';
import 'package:app_congonhas/src/principal/my_cart/my_cart_view.dart';
import 'package:app_congonhas/src/principal/order/order_binding.dart';
import 'package:app_congonhas/src/principal/order/order_view.dart';
import 'package:app_congonhas/src/splash/splash_binding.dart';
import 'package:app_congonhas/src/splash/splash_view.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const splash = "/";
  static const welcome = "/welcome";
  static const makeAccount = "/make_account";
  static const enterAccount = "/enter_account";
  static const home = "/home";
  static const more = "/more";
  static const myCart = "/myCart";
  static const order = "/order";
  static const buying = "/home/buying";

  static final getPages = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: welcome,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: makeAccount,
      page: () => const MakeAccountView(),
      binding: MakeAccountBinding(),
    ),
    GetPage(
      name: enterAccount,
      page: () => const EnterAccountView(),
      binding: EnterAccountBinding(),
    ),
    GetPage(
      name: home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: more,
      page: () => const MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: myCart,
      page: () => const MyCartView(),
      binding: MyCartBinding(),
    ),
    GetPage(
      name: order,
      page: () => const OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: buying,
      page: () => const BuyingView(),
      binding: BuyingBinding(),
    ),
  ];
}
