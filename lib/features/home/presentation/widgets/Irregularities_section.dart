import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:godigi/app/app.dart';
import 'package:godigi/core/core.dart';
import 'package:godigi/data/data.dart';

class IrregularitiesSection extends StatelessWidget {
  const IrregularitiesSection({super.key, required this.irregularities});

  final List<IrregularityModel> irregularities;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text(
                  StringConstants.irregularities,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColor.neutral90,
                    fontFamily: AppFontFamily.inter,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD32F2F),
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '12',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                StringConstants.seeAll,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            padding: EdgeInsets.all(AppSpacing.space0),
            scrollDirection: Axis.horizontal,
            itemCount: irregularities.length,
            itemBuilder: (context, index) {
              final irregularity = irregularities[index];
              return Container(
                width: screenSize.width * 0.43,
                margin: const EdgeInsets.only(right: AppSpacing.space3),
                child: IrregularityCard(
                  title: irregularity.title,
                  date: irregularity.publishedAt.toShortDateString(),
                  description: irregularity.content,
                  informationType: irregularity.informationType,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class IrregularityCard extends StatelessWidget {
  const IrregularityCard({
    super.key,
    required this.title,
    required this.date,
    required this.description,
    required this.informationType,
  });

  final String title;
  final String date;
  final String description;
  final InformationType informationType;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: const Color(0x1F000000),
                offset: const Offset(0, 0.5),
                blurRadius: 1.5,
                spreadRadius: 0,
              ),
              BoxShadow(
                color: const Color(0x0A000000),
                offset: const Offset(0, 0),
                blurRadius: 1,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Color(0xFF04B0C0).withValues(alpha: 0.1),
                ),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      width: constraints.maxWidth,
                      fit: BoxFit.fill,
                      AssetConstants.wavePatternTopSmall,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.space2),
                      child: Column(
                        spacing: AppSpacing.space6,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: SvgPicture.asset(
                                  AssetConstants.icOptima,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Color(0xFF04B0C0).withValues(alpha: 0.4),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  informationType.displayName,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontFamily: AppFontFamily.inter,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF333333),
                              fontFamily: AppFontFamily.montserrat,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.space3),
                      child: Text(
                        date,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: AppColor.neutral60,
                          fontFamily: AppFontFamily.inter,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.space3).copyWith(top: 0),
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.neutral80,
                          fontFamily: AppFontFamily.inter,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
