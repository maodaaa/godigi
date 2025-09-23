import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:godigi/app/app.dart';
import 'package:godigi/app/widgets/article_card.dart';
import 'package:godigi/core/core.dart';
import 'package:godigi/features/before_login/presentation/bloc/before_login_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class BeforeLoginPage extends StatelessWidget {
  const BeforeLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BeforeLoginBloc()..add(GetArticle()),
      child: const BeforeLoginView(),
    );
  }
}

class BeforeLoginView extends StatelessWidget {
  const BeforeLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 80,
          color: AppColor.neutral10,
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.space4,
            vertical: AppSpacing.space3,
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColor.primary50),
              foregroundColor: WidgetStatePropertyAll(Colors.white),
            ),
            onPressed: () => context.router.push(LoginRoute()),
            child: Text(
              StringConstants.loginToOptima,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: AppFontFamily.inter,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _Header(
              height: size.height * 0.2,
            ),
            _ContentBody(
              content: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(AppSpacing.space2),
                      child: Text(
                        StringConstants.latestNewsAndEvent,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColor.neutral80,
                          fontFamily: AppFontFamily.inter,
                        ),
                      ),
                    ),
                    BlocBuilder<BeforeLoginBloc, BeforeLoginState>(
                      builder: (context, state) {
                        switch (state.status) {
                          case BeforeLoginStatus.success:
                            return StaggeredGrid.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: AppSpacing.space1,
                              crossAxisSpacing: AppSpacing.space1,
                              children: List.generate(
                                state.articleList.length,
                                (index) {
                                  final crossAxisCellCount = index == 0 ? 2 : 1;
                                  final article = state.articleList[index];
                                  return StaggeredGridTile.fit(
                                    crossAxisCellCount: crossAxisCellCount,
                                    child: GestureDetector(
                                      onTap: () => context.router.push(
                                        ArticleDetailRoute(articleId: article.articleId),
                                      ),
                                      child: ArticleCard(article: article),
                                    ),
                                  );
                                },
                              ),
                            );
                          case _:
                            return Skeletonizer(
                              child: StaggeredGrid.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: AppSpacing.space1,
                                crossAxisSpacing: AppSpacing.space1,
                                children: List.generate(
                                  state.articleList.length,
                                  (index) {
                                    final crossAxisCellCount = index == 0 ? 2 : 1;
                                    final article = state.articleList[index];
                                    return StaggeredGridTile.fit(
                                      crossAxisCellCount: crossAxisCellCount,
                                      child: GestureDetector(
                                        onTap: () => context.router.push(
                                          ArticleDetailRoute(articleId: article.articleId),
                                        ),
                                        child: ArticleCard(article: article),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                        }
                      },
                    ),
                  ],
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
  final double height;

  const _Header({this.height = 180});

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
                SvgPicture.asset(
                  AssetConstants.optimaLogo,
                ),
                const SizedBox(height: AppSpacing.space12),
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
