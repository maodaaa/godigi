part of 'article_detail_bloc.dart';

enum ArticleDetailStatus { initial, loading, success, error }

@freezed
sealed class ArticleDetailState with _$ArticleDetailState {
  const factory ArticleDetailState({
    final ArticleModel? article,
    @Default(ArticleDetailStatus.initial) ArticleDetailStatus status,
  }) = _ArticleDetailState;
}
