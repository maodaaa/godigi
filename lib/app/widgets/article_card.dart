import 'package:flutter/material.dart';
import 'package:godigi/app/app.dart';
import 'package:godigi/core/core.dart';
import 'package:godigi/data/data.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
  });

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.all(AppSpacing.space1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(AppCornerRadius.lg),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0.5),
            blurRadius: 1.5,
            spreadRadius: 0,
            color: const Color(0x1F000000),
          ),
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 0,
            color: const Color(0x0A000000),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                fit: BoxFit.cover,
                height: 120,
                width: double.infinity,
                article.url,
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.space4,
                    vertical: AppSpacing.space1,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(AppCornerRadius.lg),
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                  child: Text(
                    article.informationType.name.toCapitalCase(),
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(AppSpacing.space3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppSpacing.space3,
              children: [
                Text(
                  article.publishedAt.toShortDateString(),
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 10,
                    color: AppColor.neutral60,
                    fontFamily: AppFontFamily.inter,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  article.title,
                  maxLines: 4,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.neutral80,
                    fontFamily: AppFontFamily.inter,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
