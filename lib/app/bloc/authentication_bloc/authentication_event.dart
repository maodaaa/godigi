part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.subscriptionRequested() = AuthenticationSubscriptionRequested;

  const factory AuthenticationEvent.logoutPressed() = AuthenticationLogoutPressed;

  const factory AuthenticationEvent.loginRequested({
    required String email,
    required String password,
  }) = AuthenticationLoginRequested;

  const factory AuthenticationEvent.otpVerified({
    required String otp,
    required VerificationMethod verificationMethod,
  }) = AuthenticationOtpVerified;
}
