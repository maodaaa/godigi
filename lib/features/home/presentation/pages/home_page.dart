// ignore_for_file: unused_element_parameter

import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:godigi/app/app.dart';
import 'package:godigi/core/core.dart';
import 'package:godigi/data/data.dart';
import '../../../../../dummy_data.dart';
import 'package:godigi/features/home/presentation/bloc/home_bloc.dart';
import 'package:godigi/features/home/presentation/widgets/Irregularities_section.dart';
import 'package:godigi/features/home/presentation/widgets/airport_facility_section.dart';
import 'package:godigi/features/home/presentation/widgets/article_section.dart';
import 'package:godigi/features/home/presentation/widgets/featured_section.dart';
import 'package:godigi/features/home/presentation/widgets/info_banner_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()
        ..add(
          GetArticleData(),
        )
        ..add(
          GetBannerData(),
        )
        ..add(
          GetIrregularitiesData(),
        )
        ..add(
          GetAirportFacilityData(),
        ),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Header(
              airportChips: dummyAirportData,
              height: size.height * 0.2,
            ),
            _ContentBody(
              content: [
                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) => previous.bannerStatus != current.bannerStatus,
                  builder: (context, state) {
                    switch (state.bannerStatus) {
                      case HomeStatus.success:
                        return InfoBannerCard(
                          bannerData: state.bannerData,
                        );
                      case _:
                        return Skeletonizer(
                          child: InfoBannerCard(
                            bannerData: state.bannerData,
                          ),
                        );
                    }
                  },
                ),
                SizedBox(
                  height: AppSpacing.space6,
                ),
                FeaturedSection(),
                SizedBox(
                  height: AppSpacing.space6,
                ),

                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      previous.irregularitiesStatus != current.irregularitiesStatus,
                  builder: (context, state) {
                    switch (state.irregularitiesStatus) {
                      case HomeStatus.success:
                        return IrregularitiesSection(
                          irregularities: state.irregularitiesData,
                        );

                      case _:
                        return Skeletonizer(
                          child: IrregularitiesSection(
                            irregularities: state.irregularitiesData,
                          ),
                        );
                    }
                  },
                ),

                SizedBox(
                  height: AppSpacing.space6,
                ),

                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) =>
                      previous.airportFacilityStatus != current.airportFacilityStatus,
                  builder: (context, state) {
                    switch (state.airportFacilityStatus) {
                      case HomeStatus.success:
                        return AirportFacilitySection(
                          facilities: state.airportFacilityData,
                        );
                      case _:
                        return Skeletonizer(
                          child: AirportFacilitySection(
                            facilities: state.airportFacilityData,
                          ),
                        );
                    }
                  },
                ),
                SizedBox(
                  height: AppSpacing.space6,
                ),

                BlocBuilder<HomeBloc, HomeState>(
                  buildWhen: (previous, current) => previous.articleStatus != current.articleStatus,
                  builder: (context, state) {
                    switch (state.articleStatus) {
                      case HomeStatus.success:
                        return ArticleSection(
                          article: state.articleData,
                        );
                      case _:
                        return Skeletonizer(
                          child: ArticleSection(
                            article: state.articleData,
                          ),
                        );
                    }
                  },
                ),
                SizedBox(
                  height: AppSpacing.space6,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final List<AirportModel> airportChips;
  final double height;

  const _Header({required this.airportChips, this.height = 180});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned.fill(child: _HeaderBackground()),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _AppBarContent(),
                const SizedBox(height: AppSpacing.space6),
                _AirportChipsBar(airportChips: airportChips),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -20,
            child: Container(
              height: 35,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: AppCornerRadius.lg,
                  topRight: AppCornerRadius.lg,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarContent extends StatelessWidget {
  const _AppBarContent();

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.viewPaddingOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space4,
      ).add(EdgeInsetsGeometry.only(top: padding.top)),
      child: Row(
        children: [
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return Text(
                  'Hi, ${state.user.name}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: AppFontFamily.inter,
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
          Spacer(),
          Icon(
            Icons.notifications,
            color: Colors.white,
            size: 24,
          ),
        ],
      ),
    );
  }
}

class _HeaderBackground extends StatelessWidget {
  const _HeaderBackground();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            gradient: RadialGradient(
              radius: 2,
              center: Alignment(0, 0.1),
              colors: [
                Color(0xFF04B0C0),
                Color.fromRGBO(0, 127, 138, 0.9),
                Color(0xFF04B0C0),
              ],
              stops: [
                0.4,
                0.8,
                1.0,
              ],
            ),
          ),
        ),

        Positioned(
          right: 0,
          top: 0,
          child: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) {
              return const RadialGradient(
                center: Alignment.center,
                radius: 0.7,
                colors: [Colors.transparent, Colors.white],
                stops: [0.6, 1.0],
              ).createShader(bounds);
            },
            child: SvgPicture.asset(
              AssetConstants.bgAssetSmall,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AirportChipsBar extends StatelessWidget {
  final List<AirportModel> airportChips;
  final int maxChipsToShow = 3;

  const _AirportChipsBar({required this.airportChips});

  @override
  Widget build(BuildContext context) {
    final chipsToDisplay = airportChips.take(maxChipsToShow).toList();
    final remainingCount = airportChips.length - maxChipsToShow;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: AppCornerRadius.lg,
        topRight: AppCornerRadius.lg,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 0),
        child: Container(
          alignment: AlignmentGeometry.topCenter,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space4,
            vertical: AppSpacing.space4,
          ).copyWith(bottom: AppSpacing.space6, top: AppSpacing.space3),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: const BorderRadius.only(
              topLeft: AppCornerRadius.lg,
              topRight: AppCornerRadius.lg,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.flight_takeoff, size: 24, color: Colors.white),
              const SizedBox(width: AppSpacing.space4),
              Expanded(
                child: Row(
                  children: [
                    ...chipsToDisplay.map(
                      (chipData) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: _AirportChip(label: chipData.airportId),
                      ),
                    ),
                    if (remainingCount > 0)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: _AirportChip(label: '+$remainingCount'),
                      ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, size: 24, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

class _AirportChip extends StatelessWidget {
  final String label;

  const _AirportChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.primary20,
        borderRadius: BorderRadius.all(AppCornerRadius.full),
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space3, vertical: 8.0),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColor.primary50,
          fontSize: 10.0,
          fontWeight: FontWeight.w700,
          fontFamily: AppFontFamily.inter,
        ),
      ),
    );
  }
}

class _ContentBody extends StatelessWidget {
  const _ContentBody({
    required this.content,
  });

  final List<Widget> content;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space4),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: content,
      ),
    );
  }
}
