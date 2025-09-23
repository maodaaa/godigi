part of 'before_login_bloc.dart';

enum BeforeLoginStatus { initial, loading, success, error }

@freezed
sealed class BeforeLoginState with _$BeforeLoginState {
  const factory BeforeLoginState({
    @Default([]) List<ArticleModel> articleList,
    @Default(BeforeLoginStatus.initial) BeforeLoginStatus status,
  }) = _BeforeLoginState;
}
