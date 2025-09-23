import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:godigi/data/data.dart';
import 'package:godigi/dummy_data.dart';

part 'before_login_event.dart';
part 'before_login_state.dart';
part 'before_login_bloc.freezed.dart';

class BeforeLoginBloc extends Bloc<BeforeLoginEvent, BeforeLoginState> {
  BeforeLoginBloc() : super(const BeforeLoginState()) {
    on<GetArticle>(_onGetArticle);
  }

  Future<void> _onGetArticle(GetArticle event, Emitter<BeforeLoginState> emit) async {
    emit(
      state.copyWith(
        status: BeforeLoginStatus.loading,
        articleList: dummyArticleData.take(4).toList(),
      ),
    );
    try {
      await Future.delayed(Duration(seconds: 2));
      final article = dummyArticleData;

      emit(state.copyWith(status: BeforeLoginStatus.success, articleList: article));
    } catch (e) {
      emit(state.copyWith(status: BeforeLoginStatus.error));
    }
  }
}
