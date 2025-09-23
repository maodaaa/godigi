import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godigi/app/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:godigi/app/di/injection_container.dart';
import 'package:godigi/app/routing/app_router.dart';
import 'package:godigi/core/core.dart';
import 'package:godigi/domain/repositories/src/authentication_repository.dart';
import 'package:godigi/domain/repositories/src/user_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initDependency();

  log("Waiting for dependencies to initialize...");
  await getIt.allReady();
  log("All dependencies are ready!");

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) =>
          AuthenticationBloc(
            authenticationRepository: getIt<AuthenticationRepository>(),
            userRepository: getIt<UserRepository>(),
          )..add(
            AuthenticationSubscriptionRequested(),
          ),
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});
  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        switch (state) {
          case Authenticated():
            appRouter.replaceAll([const MainRoute()]);
          case OtpRequired():
            appRouter.replaceAll([
              VerificationOptionRoute(recepientOtp: state.user.email),
            ]);

          case _:
            appRouter.replaceAll([const BeforeLoginRoute()]);
        }
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: StringConstants.appName,
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        routerConfig: appRouter.config(),
      ),
    );
  }
}
