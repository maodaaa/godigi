import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:godigi/app/routing/app_router.dart';
import 'package:godigi/app/styles/styles.dart';
import 'package:godigi/core/core.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        HomeRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColor.primary50,
            unselectedItemColor: AppColor.silver30,
            backgroundColor: Colors.white,
            currentIndex: tabsRouter.activeIndex,
            onTap: (value) {
              if (value == 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSpacing.space4,
                      vertical: AppSpacing.space2,
                    ),
                    content: Text('This feature is not implemented yet!'),
                    backgroundColor: AppColor.neutral60,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              } else {
                tabsRouter.setActiveIndex(value);
              }
            },

            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetConstants.icHome,
                  colorFilter: ColorFilter.mode(
                    tabsRouter.activeIndex == 0 ? AppColor.primary50 : AppColor.silver30,
                    BlendMode.srcIn,
                  ),
                ),
                label: StringConstants.home,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetConstants.icReports,
                  colorFilter: ColorFilter.mode(
                    tabsRouter.activeIndex == 1 ? AppColor.primary50 : AppColor.silver30,
                    BlendMode.srcIn,
                  ),
                ),
                label: StringConstants.reports,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AssetConstants.icProfile,
                  colorFilter: ColorFilter.mode(
                    tabsRouter.activeIndex == 2 ? AppColor.primary50 : AppColor.silver30,
                    BlendMode.srcIn,
                  ),
                ),
                label: StringConstants.profile,
              ),
            ],
          ),
        );
      },
    );
  }
}
