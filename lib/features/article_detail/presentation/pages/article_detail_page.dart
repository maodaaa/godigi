import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godigi/app/app.dart';
import 'package:godigi/core/constants/string_constants.dart';
import 'package:godigi/features/article_detail/presentation/bloc/article_detail_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({
    @PathParam('id') required this.articleId,
    super.key,
  });

  final int articleId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleDetailBloc()..add(GetArticleById(articleId)),
      child: const ArticleDetaiView(),
    );
  }
}

class ArticleDetaiView extends StatelessWidget {
  const ArticleDetaiView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.secondary10,
            appBar: AppBar(
              scrolledUnderElevation: 0,
              backgroundColor: AppColor.secondary10,
              title: Text(StringConstants.article),
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColor.neutral100,
                fontFamily: AppFontFamily.inter,
              ),
              actions: [
                IconButton(
                  onPressed: () => SharePlus.instance.share(
                    ShareParams(text: 'https://optima.angkasapura2.co.id/article'),
                  ),
                  icon: Icon(
                    Icons.share_outlined,
                    size: 24,
                  ),
                ),
              ],
            ),
            body: Skeletonizer(
              enabled: state.status != ArticleDetailStatus.success,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.space4),
                  child: Column(
                    spacing: AppSpacing.space6,
                    children: [
                      Container(
                        height: 160,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSpacing.space4),
                          image: DecorationImage(
                            image: NetworkImage(state.article!.url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        state.article!.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColor.neutral80,
                          fontFamily: AppFontFamily.inter,
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width,
                        height: 1,
                        child: OverflowBox(
                          maxWidth: screenSize.width,
                          maxHeight: 1,
                          child: Divider(
                            color: AppColor.neutral30,
                            thickness: 1,
                            height: 1,
                          ),
                        ),
                      ),
                      Text(
                        state.article!.content,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColor.neutral60,
                          fontFamily: AppFontFamily.inter,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
