part of 'verification_otp_bloc.dart';

@freezed
sealed class VerificationOtpEvent with _$VerificationOtpEvent {
  const factory VerificationOtpEvent.onVerifOtp({
    required String otp,
    required VerificationMethod verificationMethod,
  }) = VerificationOnOtpVerifRequested;
}
