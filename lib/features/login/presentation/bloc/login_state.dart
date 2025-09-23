part of 'login_bloc.dart';

enum FormSubmissionStatus { initial, loading, success, error }

@freezed
sealed class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(FormSubmissionStatus.initial) FormSubmissionStatus status,
    String? errorMessage,
  }) = _LoginState;
}
