import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:godigi/app/styles/styles.dart';
import 'package:godigi/core/constants/asset_constants.dart';
import 'package:godigi/data/data.dart';

class InfoBannerCard extends StatefulWidget {
  const InfoBannerCard({
    super.key,
    required this.bannerData,
  });

  final List<BannerModel> bannerData;

  @override
  State<InfoBannerCard> createState() => _InfoBannerCardState();
}

class _InfoBannerCardState extends State<InfoBannerCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final newPage = _pageController.page?.round() ?? 0;
      if (_currentPage != newPage) {
        setState(() {
          _currentPage = newPage;
        });
      }
    });

    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < widget.bannerData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.space2),
      child: SizedBox(
        height: 180,
        width: screenSize.width,
        child: ClipRRect(
          borderRadius: BorderRadius.all(AppCornerRadius.lg),
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColor.third30,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: SvgPicture.asset(
                    fit: BoxFit.cover,
                    AssetConstants.wavePatternTop,
                    width: screenSize.width,
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 20,
                  child: SvgPicture.asset(
                    AssetConstants.injourneyLogo,
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: widget.bannerData.length,
                        itemBuilder: (context, index) {
                          final info = widget.bannerData[index];
                          return Container(
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.all(
                              AppSpacing.space4,
                            ).copyWith(bottom: AppSpacing.space2),
                            child: Text(
                              info.content,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: AppFontFamily.montserrat,
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.space3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(widget.bannerData.length, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.space0),
                            height: AppSpacing.space2,
                            width: _currentPage == index ? AppSpacing.space6 : AppSpacing.space2,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? AppColor.primary50
                                  : AppColor.primary30,
                              borderRadius: BorderRadius.all(AppCornerRadius.md),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
