import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:godigi/data/data.dart';
import 'package:godigi/dummy_data.dart';

part 'article_detail_event.dart';
part 'article_detail_state.dart';
part 'article_detail_bloc.freezed.dart';

class ArticleDetailBloc extends Bloc<ArticleDetailEvent, ArticleDetailState> {
  ArticleDetailBloc() : super(ArticleDetailState(article: dummyArticleData.first)) {
    on<GetArticleById>(_onGetArticleById);
  }

  Future<void> _onGetArticleById(GetArticleById event, Emitter<ArticleDetailState> emit) async {
    emit(state.copyWith(status: ArticleDetailStatus.loading, article: dummyArticleData.first));

    try {
      await Future.delayed(Duration(milliseconds: 800));

      final ArticleModel article = dummyArticleData.firstWhere((article) {
        return article.articleId == event.id;
      });

      emit(state.copyWith(status: ArticleDetailStatus.success, article: article));
    } catch (e) {
      emit(state.copyWith(status: ArticleDetailStatus.error));
    }
  }
}
