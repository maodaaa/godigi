part of 'before_login_bloc.dart';

@freezed
sealed class BeforeLoginEvent with _$BeforeLoginEvent {
  const factory BeforeLoginEvent.getArticle() = GetArticle;
}
