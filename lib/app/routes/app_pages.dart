import 'package:get/get.dart';

import '../../presentation/account/bindings/account_binding.dart';
import '../../presentation/account/views/account_view.dart';
import '../../presentation/cart/bindings/cart_binding.dart';
import '../../presentation/cart/views/cart_view.dart';
import '../../presentation/dashboard/bindings/dashboard_binding.dart';
import '../../presentation/dashboard/views/dashboard_view.dart';
import '../../presentation/explore/bindings/explore_binding.dart';
import '../../presentation/explore/views/explore_view.dart';
import '../../presentation/favourite/bindings/favourite_binding.dart';
import '../../presentation/favourite/views/favourite_view.dart';
import '../../presentation/list_product/bindings/list_product_binding.dart';
import '../../presentation/list_product/views/list_product_view.dart';
import '../../presentation/login/bindings/login_binding.dart';
import '../../presentation/login/views/login_view.dart';
import '../../presentation/onboarding/bindings/onboarding_binding.dart';
import '../../presentation/onboarding/views/onboarding_view.dart';
import '../../presentation/payment/bindings/payment_binding.dart';
import '../../presentation/payment/views/payment_view.dart';
import '../../presentation/product_detail/bindings/product_detail_binding.dart';
import '../../presentation/product_detail/views/product_detail_view.dart';
import '../../presentation/shop/bindings/shop_binding.dart';
import '../../presentation/shop/views/shop_view.dart';
import '../../presentation/sign_up/bindings/sign_up_binding.dart';
import '../../presentation/sign_up/views/sign_up_view.dart';
import '../../presentation/splash/bindings/splash_binding.dart';
import '../../presentation/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnBoardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SHOP,
      page: () => const ShopView(),
      binding: ShopBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => const ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => const ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.FAVOURITE,
      page: () => const FavouriteView(),
      binding: FavouriteBinding(),
    ),
    GetPage(
      name: _Paths.LIST_PRODUCT,
      page: () => const ListProductView(),
      binding: ListProductBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
  ];
}
