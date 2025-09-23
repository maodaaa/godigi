import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:godigi/app/app.dart';
import 'package:godigi/core/core.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primary20,
        body: Padding(
          padding: const EdgeInsets.all(AppSpacing.space4).copyWith(bottom: AppSpacing.space8),
          child: Stack(
            children: [
              Positioned.fill(
                child: OverflowBox(
                  maxHeight: size.height,
                  maxWidth: size.width,
                  child: SvgPicture.asset(AssetConstants.bgAsset),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: size.height / 2.5,
                child: Column(
                  spacing: AppSpacing.space2,
                  children: [
                    SvgPicture.asset(AssetConstants.optimaColorLogo, height: 32),
                    Text(
                      StringConstants.splashContent,
                      style: TextStyle(
                        color: Color(0xFF04B0C0),
                        fontSize: 12,
                        fontFamily: AppFontFamily.montserrat,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                bottom: 0,
                child: SvgPicture.asset(AssetConstants.injourneyLogo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
