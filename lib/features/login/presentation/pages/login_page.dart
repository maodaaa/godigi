import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:godigi/app/app.dart';
import 'package:godigi/core/core.dart';
import 'package:godigi/domain/domain.dart';
import 'package:godigi/features/login/presentation/bloc/login_bloc.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(authenticationRepository: getIt<AuthenticationRepository>()),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.primary20,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(AssetConstants.bgAsset),
          ),
          Positioned.fill(
            top: size.height * 0.12,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _InJourneyLogo(),
                    SizedBox(
                      height: AppSpacing.space2,
                    ),
                    Text(
                      StringConstants.loginToYourAccount,
                      style: TextStyle(
                        fontFamily: AppFontFamily.inter,
                        color: AppColor.neutral70,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: AppSpacing.space6,
                    ),
                    _TextField(
                      controller: _emailController,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(
                          EmailChanged(value),
                        );
                      },
                      fieldName: StringConstants.fieldEmailName,
                      fieldLabel: StringConstants.fieldEmailLabel,
                    ),
                    SizedBox(
                      height: AppSpacing.space2,
                    ),
                    BlocSelector<LoginBloc, LoginState, String?>(
                      selector: (state) => state.errorMessage,
                      builder: ((context, errorMessage) {
                        return _TextField(
                          isPassword: true,
                          controller: _passwordController,
                          onChanged: (value) {
                            context.read<LoginBloc>().add(
                              PasswordChanged(value),
                            );
                          },
                          errorText: errorMessage,
                          fieldName: StringConstants.fieldPasswordName,
                          fieldLabel: StringConstants.fieldPasswordLabel,
                        );
                      }),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          foregroundColor: WidgetStatePropertyAll(AppColor.primary50),
                        ),
                        child: Text(StringConstants.forgotPassword),
                      ),
                    ),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) => state.status == FormSubmissionStatus.success
                          ? context.router.push(
                              VerificationOptionRoute(
                                recepientOtp: state.email,
                              ),
                            )
                          : null,
                      buildWhen: (prev, curr) =>
                          prev.email != curr.email ||
                          prev.password != curr.password ||
                          prev.status != curr.status,
                      builder: (context, state) {
                        final isFormValid = state.email.isNotEmpty && state.password.isNotEmpty;
                        final isLoading = state.status == FormSubmissionStatus.loading;
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: !isFormValid
                                ? null
                                : () => context.read<LoginBloc>().add(Submitted()),
                            style: ButtonStyle(
                              textStyle: const WidgetStatePropertyAll(
                                TextStyle(
                                  fontFamily: AppFontFamily.inter,
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              backgroundColor: WidgetStateColor.resolveWith((states) {
                                if (WidgetState.disabled.isSatisfiedBy(states)) {
                                  return AppColor.neutral30;
                                }
                                return AppColor.primary50;
                              }),
                              foregroundColor: WidgetStatePropertyAll(AppColor.neutral20),
                              padding: WidgetStatePropertyAll(
                                EdgeInsets.symmetric(
                                  vertical: AppSpacing.space3,
                                  horizontal: AppSpacing.space4,
                                ),
                              ),
                            ),
                            child: isLoading
                                ? SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : const Text(StringConstants.login),
                          ),
                        );
                      },
                    ),

                    SizedBox(
                      height: AppSpacing.space2,
                    ),
                    Row(
                      spacing: AppSpacing.space1,
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColor.silver20,
                            height: 2,
                          ),
                        ),
                        Text('OR'),
                        Expanded(
                          child: Divider(
                            color: AppColor.silver20,
                            height: 2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSpacing.space2,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          iconAlignment: IconAlignment.start,
                          textStyle: WidgetStatePropertyAll(
                            TextStyle(
                              fontFamily: AppFontFamily.inter,
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                          shadowColor: WidgetStatePropertyAll(Colors.transparent),
                          side: WidgetStatePropertyAll(
                            BorderSide(
                              color: AppColor.primary50,
                            ),
                          ),
                          foregroundColor: WidgetStatePropertyAll(AppColor.primary50),
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(
                              vertical: AppSpacing.space3,
                              horizontal: AppSpacing.space4,
                            ),
                          ),
                        ),
                        child: Text(StringConstants.loginWithGoogle),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TextField extends StatefulWidget {
  const _TextField({
    required this.fieldName,
    required this.fieldLabel,
    required this.controller,
    this.errorText,
    this.onChanged,
    this.isPassword = false,
  });

  final String fieldName;
  final String fieldLabel;
  final String? errorText;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final bool isPassword;

  @override
  State<_TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<_TextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSpacing.space2,
      children: [
        Text(
          widget.fieldName,
          style: TextStyle(
            fontFamily: AppFontFamily.inter,
            color: AppColor.neutral60,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: [
            FilteringTextInputFormatter.deny(RegExp(r'\s')),
          ],
          decoration: InputDecoration(
            errorText: widget.errorText,
            filled: true,
            fillColor: AppColor.neutral20,
            hint: Text(
              widget.fieldLabel,
              style: TextStyle(
                fontFamily: AppFontFamily.inter,
                color: AppColor.neutral50,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: AppColor.neutral60,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: AppColor.silver20),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: AppColor.silver20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: AppColor.silver20),
            ),
          ),
        ),
      ],
    );
  }
}

class _InJourneyLogo extends StatelessWidget {
  const _InJourneyLogo();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        spacing: AppSpacing.space2,
        children: [
          SvgPicture.asset(
            height: 30,
            AssetConstants.optimaColorLogo,
          ),
          Text(
            StringConstants.byInJourney,
            style: TextStyle(
              fontFamily: AppFontFamily.montserrat,
              color: Color(0xFF04B0C0),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
