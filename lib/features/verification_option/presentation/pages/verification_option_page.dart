// Enum to represent the different verification methods
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:godigi/app/app.dart';
import 'package:godigi/core/core.dart';
import 'package:godigi/data/enums/src/verification_method.dart';
import 'package:godigi/data/models/src/verification_params_model.dart';

@RoutePage()
class VerificationOptionPage extends StatefulWidget {
  const VerificationOptionPage({
    super.key,
    @PathParam('recepientOtp') required this.recepientOtp,
  });

  final String recepientOtp;

  @override
  State<VerificationOptionPage> createState() => _VerificationOptionPageState();
}

class _VerificationOptionPageState extends State<VerificationOptionPage> {
  VerificationMethod _selectedMethod = VerificationMethod.none;

  void _selectMethod(VerificationMethod method) {
    setState(() {
      _selectedMethod = method;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMethodSelected = _selectedMethod != VerificationMethod.none;
    final size = MediaQuery.sizeOf(context);
    final padding = MediaQuery.viewPaddingOf(context);
    double appbarHeigh = AppBar().preferredSize.height;

    double appbarSafeArea = padding.top + appbarHeigh;

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
            child: OverflowBox(
              maxHeight: size.height,
              maxWidth: size.width,
              child: SvgPicture.asset(AssetConstants.bgAsset),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.space4,
            ).copyWith(top: appbarSafeArea),
            child: Column(
              children: [
                SizedBox(
                  height: AppSpacing.space4,
                ),
                const Text(
                  'Verification',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFontFamily.inter,
                    color: AppColor.neutral70,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Choose how you'd like to receive your OTP (One-Time Password) for verification.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppFontFamily.inter,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: AppSpacing.space16),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: VerificationCard(
                          icon: Icon(
                            Icons.email_outlined,
                            size: 48,
                            color: AppColor.primary50,
                          ),
                          iconColor: AppColor.primary50,
                          text: 'Send to Email',
                          isSelected: _selectedMethod == VerificationMethod.email,
                          onTap: () => _selectMethod(VerificationMethod.email),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: VerificationCard(
                          // Using a placeholder icon as WhatsApp is a brand icon
                          icon: SvgPicture.asset(
                            height: 48,
                            width: 48,
                            AssetConstants.icWhatsapp,
                          ),
                          iconColor: Color(0xFF25D366),
                          text: 'Send to WhatsApp',
                          isSelected: _selectedMethod == VerificationMethod.whatsapp,
                          onTap: () => _selectMethod(VerificationMethod.whatsapp),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSpacing.space16,
                ),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: isMethodSelected
                        ? () => context.router.push(
                            VerificationOtpRoute(
                              verificationParamsModel: VerificationParamsModel(
                                verificationMethod: _selectedMethod,
                                recepientOtp: widget.recepientOtp,
                              ),
                            ),
                          )
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
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class VerificationCard extends StatelessWidget {
  final Widget icon;
  final Color iconColor;
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const VerificationCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(
          vertical: AppSpacing.space6,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Color(0xFF04B0C0) : AppColor.grey20,
            width: 2,
          ),
          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.teal.withValues(alpha: 0.1),
                blurRadius: 10,
                spreadRadius: 2,
              )
            else
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.space6),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: icon,
            ),
            const SizedBox(height: 16),
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: AppFontFamily.inter,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
