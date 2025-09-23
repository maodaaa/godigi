// ignore_for_file: unused_element_parameter

import 'package:flutter/material.dart';
import 'package:godigi/app/app.dart';
import 'package:godigi/core/constants/string_constants.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          StringConstants.featured,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColor.neutral90,
            fontFamily: AppFontFamily.inter,
          ),
        ),
        const SizedBox(height: AppSpacing.space3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _FeaturedCard(
                icon: Icons.settings_suggest,
                text: StringConstants.facilityService,
              ),
            ),
            const SizedBox(width: AppSpacing.space4),
            Expanded(
              child: _FeaturedCard(
                icon: Icons.flight_takeoff,
                text: StringConstants.irregularities,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FeaturedCard extends StatelessWidget {
  const _FeaturedCard({
    required this.icon,
    required this.text,
    this.iconColor = AppColor.primary50,
    this.backgroundColor = AppColor.primary20,
    this.iconBackgroundColor = AppColor.primary30,
  });

  final IconData icon;
  final String text;
  final Color iconColor;
  final Color backgroundColor;
  final Color iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(AppCornerRadius.ml),
        border: Border.all(
          color: iconBackgroundColor,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.space2),
            decoration: BoxDecoration(
              color: iconBackgroundColor,
              borderRadius: BorderRadius.all(AppCornerRadius.md),
            ),
            child: Icon(
              icon,
              size: 32,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColor.neutral80,
                fontFamily: AppFontFamily.inter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
