import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:godigi/data/data.dart';
import 'package:godigi/domain/domain.dart';

part 'verification_otp_event.dart';
part 'verification_otp_state.dart';
part 'verification_otp_bloc.freezed.dart';

class VerificationOtpBloc extends Bloc<VerificationOtpEvent, VerificationOtpState> {
  VerificationOtpBloc({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository,
       super(const VerificationOtpState.initial()) {
    on<VerificationOnOtpVerifRequested>(_onOtpVerified);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onOtpVerified(
    VerificationOnOtpVerifRequested event,
    Emitter<VerificationOtpState> emit,
  ) async {
    emit(Loading());

    final result = await _authenticationRepository.verifyOtp(
      otp: event.otp,
      verificationMethod: event.verificationMethod,
    );

    if (result) {
      emit(Done());
    } else {
      emit(Failed());
    }
  }
}
