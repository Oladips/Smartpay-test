import 'package:get/get.dart';
import 'package:test/presentation/views/country_picker/bindings/bindings.dart';
import 'package:test/presentation/views/country_picker/view/country_picker.dart';
import 'package:test/presentation/views/home/binding/binding.dart';
import 'package:test/presentation/views/home/view/home.dart';
import 'package:test/presentation/views/login/bindings/bindings.dart';
import 'package:test/presentation/views/login/views/login_view.dart';
import 'package:test/presentation/views/onboarding/bindings/bindings.dart';
import 'package:test/presentation/views/onboarding/views/onboarding_view.dart';
import 'package:test/presentation/views/otp/bindings/bindings.dart';
import 'package:test/presentation/views/otp/views/otp_view.dart';
import 'package:test/presentation/views/pin/bindings/bindings.dart';
import 'package:test/presentation/views/pin/views/pin_view.dart';
import 'package:test/presentation/views/sign%20up/bindings/bindings.dart';
import 'package:test/presentation/views/sign%20up/views/signup_view.dart';
import 'package:test/presentation/views/splash/bindings/bindings.dart';
import 'package:test/presentation/views/splash/views/splash_view.dart';
import 'package:test/presentation/views/success/binding/bindings.dart';
import 'package:test/presentation/views/success/views/signup_success.dart';

class AppRouter {
  /// IMPLEMENTATION OF GETX FOR THE NAVIGATION OF THE APP
  List<GetPage<dynamic>> getpages = [
    GetPage(
      name: '/splash',
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: '/onboarding',
      page: () => OnBoardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/signup',
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: '/otp',
      page: () => OtpVerification(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: '/country',
      page: () => CountryPickerView(),
      binding: CountryBinding(),
    ),
    GetPage(
      name: '/pin',
      page: () => PinView(),
      binding: PinBinding(),
    ),
    GetPage(
      name: '/successSignup',
      page: () => SignUpSuccess(),
      binding: SuccessBindings(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
