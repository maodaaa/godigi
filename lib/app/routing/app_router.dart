import 'package:auto_route/auto_route.dart';
import 'package:godigi/features/features.dart';
import 'package:flutter/widgets.dart';
import 'package:godigi/data/models/src/verification_params_model.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      path: '/splash',
      initial: true,
    ),

    AutoRoute(
      page: BeforeLoginRoute.page,

      path: '/before-login',
    ),

    AutoRoute(page: ArticleDetailRoute.page, path: '/article-detail/:id'),

    AutoRoute(page: LoginRoute.page, path: '/login'),

    AutoRoute(
      page: MainRoute.page,
      path: '/main',
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home'),
        AutoRoute(page: ProfileRoute.page, path: 'profile'),
      ],
    ),

    AutoRoute(
      page: VerificationOptionRoute.page,
      path: '/verification-option-screen/:recepientOtp',
    ),
    AutoRoute(
      page: VerificationOtpRoute.page,
      path: '/verification-otp-screen',
    ),
  ];
}
