import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godigi/app/app.dart';
import 'package:godigi/core/constants/string_constants.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  context.read<AuthenticationBloc>().add(AuthenticationLogoutPressed()),
              style: ButtonStyle(
                textStyle: const WidgetStatePropertyAll(
                  TextStyle(
                    fontFamily: AppFontFamily.inter,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                backgroundColor: WidgetStateColor.resolveWith((states) {
                  if (WidgetState.disabled.isSatisfiedBy(states)) {
                    return AppColor.neutral30;
                  }
                  return AppColor.primary50;
                }),
                foregroundColor: WidgetStatePropertyAll(AppColor.neutral20),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.symmetric(
                    vertical: AppSpacing.space3,
                    horizontal: AppSpacing.space4,
                  ),
                ),
              ),
              child: const Text(StringConstants.logout),
            ),
          ],
        ),
      ),
    );
  }
}
