import 'dart:async';
import 'dart:math' as math;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:godigi/app/app.dart';
import 'package:godigi/core/constants/asset_constants.dart';
import 'package:godigi/core/constants/string_constants.dart';
import 'package:godigi/data/data.dart';
import 'package:godigi/domain/domain.dart';
import 'package:godigi/features/verification_otp/verification_otp.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class VerificationOtpPage extends StatelessWidget {
  const VerificationOtpPage({
    super.key,
    required this.verificationParamsModel,
  });

  final VerificationParamsModel verificationParamsModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerificationOtpBloc(
        authenticationRepository: getIt<AuthenticationRepository>(),
      ),
      child: VerificationOtpView(
        verificationParamsModel: verificationParamsModel,
      ),
    );
  }
}

class VerificationOtpView extends StatefulWidget {
  const VerificationOtpView({
    super.key,
    required this.verificationParamsModel,
  });

  final VerificationParamsModel verificationParamsModel;

  @override
  State<VerificationOtpView> createState() => _VerificationOtpViewState();
}

class _VerificationOtpViewState extends State<VerificationOtpView> {
  bool _isPinComplete = false;
  String _otpCode = '';

  // Countdown timer logic
  late Timer _timer;
  int _start = 59;
  bool _isTimerRunning = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _start = 59;
    _isTimerRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_start == 0) {
        setState(() {
          _isTimerRunning = false;
          timer.cancel();
        });
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void resendCode() {
    if (!_isTimerRunning) {
      startTimer();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    // final padding = MediaQuery.viewPaddingOf(context);
    // double appbarHeigh = AppBar().preferredSize.height;

    // double appbarSafeArea = padding.top + appbarHeigh;

    return BlocListener<VerificationOtpBloc, VerificationOtpState>(
      listener: (context, state) {
        switch (state) {
          case Loading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return LoadingDialog();
              },
            );
          case Failed():
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.redAccent,
                content: Text('Otp Not Valid'),
              ),
            );
          case Done():
            Navigator.of(context).pop();

          case Initial():
        }
      },
      child: Scaffold(
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
              child: OverflowBox(
                maxHeight: size.height,
                maxWidth: size.width,
                child: SvgPicture.asset(AssetConstants.bgAsset),
              ),
            ),
            Positioned.fill(
              top: size.height * 0.12,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _InJourneyLogo(),
                    SizedBox(
                      height: AppSpacing.space12,
                    ),
                    const Text(
                      'Enter the verify code',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColor.neutral80,
                        fontFamily: AppFontFamily.inter,
                      ),
                    ),

                    SizedBox(
                      height: AppSpacing.space4,
                    ),

                    Text.rich(
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.neutral60,
                        fontFamily: AppFontFamily.inter,
                      ),
                      TextSpan(
                        text: 'We have sent a verification code (OTP) to your email\n',
                        children: [
                          TextSpan(
                            text: widget.verificationParamsModel.recepientOtp,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColor.neutral60,
                              fontFamily: AppFontFamily.inter,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSpacing.space12),

                    Center(
                      child: _OtpInput(
                        onChanged: (value) {
                          setState(() {
                            _otpCode = value;
                            _isPinComplete = value.length == 4;
                          });
                        },
                        onCompleted: (otpCode) {
                          context.read<VerificationOtpBloc>().add(
                            VerificationOnOtpVerifRequested(
                              otp: otpCode,
                              verificationMethod: widget.verificationParamsModel.verificationMethod,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: AppSpacing.space12),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: _isPinComplete
                            ? () {
                                context.read<VerificationOtpBloc>().add(
                                  VerificationOnOtpVerifRequested(
                                    otp: _otpCode,
                                    verificationMethod:
                                        widget.verificationParamsModel.verificationMethod,
                                  ),
                                );
                              }
                            : null,
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
                        child: const Text('Submit'),
                      ),
                    ),
                    SizedBox(
                      height: AppSpacing.space8,
                    ),
                    Center(
                      child: Text.rich(
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0x090f4773).withValues(alpha: 0.45),
                          fontFamily: AppFontFamily.inter,
                        ),
                        TextSpan(
                          text: 'Request a new verification code in ',
                          children: [
                            TextSpan(
                              text: '00:${_start.toString().padLeft(2, '0')}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSpacing.space8,
                    ),
                    if (!_isTimerRunning)
                      Center(
                        child: TextButton(
                          onPressed: resendCode,
                          child: const Text(
                            'Resend Code',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.primary50,
                              fontFamily: AppFontFamily.inter,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OtpInput extends StatelessWidget {
  final int numberOfFields;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onCompleted;

  const _OtpInput({
    // ignore: unused_element_parameter
    this.numberOfFields = 4,
    required this.onChanged,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.all(AppSpacing.space1),
      width: 50,
      height: 60,
      textStyle: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w500,
        fontFamily: AppFontFamily.inter,
        color: const Color(0xFF090F47).withValues(alpha: 0.45),
      ),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF090F47)),
        ),
      ),
    );

    return Pinput(
      length: numberOfFields,
      onChanged: onChanged,
      onCompleted: onCompleted,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme,
      submittedPinTheme: defaultPinTheme,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
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

/// A custom loading dialog that blurs the background.
class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Center(
        child: Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: AppColor.grey50,
            borderRadius: BorderRadius.all(AppCornerRadius.lg),
          ),
          child: const Padding(
            padding: EdgeInsets.all(AppSpacing.space4),
            child: GradientCircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class GradientCircularProgressIndicator extends StatefulWidget {
  const GradientCircularProgressIndicator({super.key});

  @override
  State<GradientCircularProgressIndicator> createState() =>
      _GradientCircularProgressIndicatorState();
}

class _GradientCircularProgressIndicatorState extends State<GradientCircularProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
      child: CustomPaint(
        painter: _GradientPainter(),
        child: const SizedBox(width: 60, height: 60),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCircle(center: center, radius: size.width / 2);
    const strokeWidth = 8.0;
    const arcAngle = math.pi * 1.6;
    const startAngle = -math.pi / 2;

    final backgroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = Colors.grey.withOpacity(0.3);
    canvas.drawCircle(center, size.width / 2, backgroundPaint);

    final foregroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..shader = const SweepGradient(
        colors: [
          Color(0xFF00BFFF),
          Color(0xFF00CC99),
        ],
      ).createShader(rect);

    canvas.drawArc(rect, startAngle, arcAngle, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
