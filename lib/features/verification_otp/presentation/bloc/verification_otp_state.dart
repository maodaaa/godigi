part of 'verification_otp_bloc.dart';

@freezed
sealed class VerificationOtpState with _$VerificationOtpState {
  const factory VerificationOtpState.initial() = Initial;
  const factory VerificationOtpState.loading() = Loading;
  const factory VerificationOtpState.failed() = Failed;
  const factory VerificationOtpState.done() = Done;
}
