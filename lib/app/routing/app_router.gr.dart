// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ArticleDetailPage]
class ArticleDetailRoute extends PageRouteInfo<ArticleDetailRouteArgs> {
  ArticleDetailRoute({
    required int articleId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         ArticleDetailRoute.name,
         args: ArticleDetailRouteArgs(articleId: articleId, key: key),
         rawPathParams: {'id': articleId},
         initialChildren: children,
       );

  static const String name = 'ArticleDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<ArticleDetailRouteArgs>(
        orElse: () =>
            ArticleDetailRouteArgs(articleId: pathParams.getInt('id')),
      );
      return ArticleDetailPage(articleId: args.articleId, key: args.key);
    },
  );
}

class ArticleDetailRouteArgs {
  const ArticleDetailRouteArgs({required this.articleId, this.key});

  final int articleId;

  final Key? key;

  @override
  String toString() {
    return 'ArticleDetailRouteArgs{articleId: $articleId, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ArticleDetailRouteArgs) return false;
    return articleId == other.articleId && key == other.key;
  }

  @override
  int get hashCode => articleId.hashCode ^ key.hashCode;
}

/// generated route for
/// [BeforeLoginPage]
class BeforeLoginRoute extends PageRouteInfo<void> {
  const BeforeLoginRoute({List<PageRouteInfo>? children})
    : super(BeforeLoginRoute.name, initialChildren: children);

  static const String name = 'BeforeLoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BeforeLoginPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomePage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfilePage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}

/// generated route for
/// [VerificationOptionPage]
class VerificationOptionRoute
    extends PageRouteInfo<VerificationOptionRouteArgs> {
  VerificationOptionRoute({
    Key? key,
    required String recepientOtp,
    List<PageRouteInfo>? children,
  }) : super(
         VerificationOptionRoute.name,
         args: VerificationOptionRouteArgs(
           key: key,
           recepientOtp: recepientOtp,
         ),
         rawPathParams: {'recepientOtp': recepientOtp},
         initialChildren: children,
       );

  static const String name = 'VerificationOptionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<VerificationOptionRouteArgs>(
        orElse: () => VerificationOptionRouteArgs(
          recepientOtp: pathParams.getString('recepientOtp'),
        ),
      );
      return VerificationOptionPage(
        key: args.key,
        recepientOtp: args.recepientOtp,
      );
    },
  );
}

class VerificationOptionRouteArgs {
  const VerificationOptionRouteArgs({this.key, required this.recepientOtp});

  final Key? key;

  final String recepientOtp;

  @override
  String toString() {
    return 'VerificationOptionRouteArgs{key: $key, recepientOtp: $recepientOtp}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VerificationOptionRouteArgs) return false;
    return key == other.key && recepientOtp == other.recepientOtp;
  }

  @override
  int get hashCode => key.hashCode ^ recepientOtp.hashCode;
}

/// generated route for
/// [VerificationOtpPage]
class VerificationOtpRoute extends PageRouteInfo<VerificationOtpRouteArgs> {
  VerificationOtpRoute({
    Key? key,
    required VerificationParamsModel verificationParamsModel,
    List<PageRouteInfo>? children,
  }) : super(
         VerificationOtpRoute.name,
         args: VerificationOtpRouteArgs(
           key: key,
           verificationParamsModel: verificationParamsModel,
         ),
         initialChildren: children,
       );

  static const String name = 'VerificationOtpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationOtpRouteArgs>();
      return VerificationOtpPage(
        key: args.key,
        verificationParamsModel: args.verificationParamsModel,
      );
    },
  );
}

class VerificationOtpRouteArgs {
  const VerificationOtpRouteArgs({
    this.key,
    required this.verificationParamsModel,
  });

  final Key? key;

  final VerificationParamsModel verificationParamsModel;

  @override
  String toString() {
    return 'VerificationOtpRouteArgs{key: $key, verificationParamsModel: $verificationParamsModel}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! VerificationOtpRouteArgs) return false;
    return key == other.key &&
        verificationParamsModel == other.verificationParamsModel;
  }

  @override
  int get hashCode => key.hashCode ^ verificationParamsModel.hashCode;
}
