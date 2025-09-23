part of 'article_detail_bloc.dart';

@freezed
sealed class ArticleDetailEvent with _$ArticleDetailEvent {
  const factory ArticleDetailEvent.getArticleById(int id) = GetArticleById;
}
