import 'package:flutter/material.dart';
import 'package:godigi/app/app.dart';
import 'package:godigi/app/widgets/article_card.dart';
import 'package:godigi/core/constants/string_constants.dart';
import 'package:godigi/data/data.dart';

class ArticleSection extends StatelessWidget {
  const ArticleSection({
    super.key,
    required this.article,
  });

  final List<ArticleModel> article;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              StringConstants.latestArticle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColor.neutral90,
                fontFamily: AppFontFamily.inter,
              ),
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
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: article.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: AppSpacing.space2),
                width: 200,
                child: ArticleCard(article: article[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
