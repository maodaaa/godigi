import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class User with _$User {
  const factory User({
    required final String id,
    required final String email,
    required final String name,
    @Default(false) final bool otpDone,
    final String? token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static const empty = User(id: '-', email: '-', name: '-', otpDone: false);
}
