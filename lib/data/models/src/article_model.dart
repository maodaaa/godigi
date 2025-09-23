import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:godigi/data/enums/enums.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
sealed class ArticleModel with _$ArticleModel {
  const factory ArticleModel({
    required final int articleId,
    required final String author,
    required final String title,
    required final String url,
    required final DateTime publishedAt,
    required final String content,
    required final InformationType informationType,
    required,
  }) = _ArticleModel;

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);
}
