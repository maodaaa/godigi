import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:godigi/data/enums/src/verification_method.dart';

part 'verification_params_model.freezed.dart';

@freezed
sealed class VerificationParamsModel with _$VerificationParamsModel {
  const factory VerificationParamsModel({
    required final VerificationMethod verificationMethod,
    required final String recepientOtp,
  }) = _VerificationParamsModel;
}
