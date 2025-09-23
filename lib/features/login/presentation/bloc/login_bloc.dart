import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:godigi/core/core.dart';
import 'package:godigi/domain/domain.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository,
       super(const LoginState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<Submitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onEmailChanged(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email, status: FormSubmissionStatus.initial));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password, status: FormSubmissionStatus.initial));
  }

  Future<void> _onSubmitted(Submitted event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: FormSubmissionStatus.loading));
    try {
      final isSucces = await _authenticationRepository.logIn(
        email: state.email,
        password: state.password,
      );

      if (isSucces) {
        emit(state.copyWith(status: FormSubmissionStatus.success));
      } else {
        emit(
          state.copyWith(
            status: FormSubmissionStatus.error,
            errorMessage: StringConstants.incorrectPassword,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: FormSubmissionStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
