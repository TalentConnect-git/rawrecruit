import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart'
    show AppTextStyles, AppColors, AppTextFields, AppButton;
import 'package:rawrecruit/src/core/index.dart'
    show Failure, Toasts, RouteNames, FailureExt, getIt, AppStateProvider, User;
import 'package:rawrecruit/src/features/auth/index.dart'
    show RegisterViewModel, AuthCard;
import 'package:rawrecruit/src/features/onboarding/index.dart'
    show OnboardingLocalService;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final RegisterViewModel registerViewModel = RegisterViewModel();

  final emailController = TextEditingController(
    text: kDebugMode ? 'skhasan.talentconnect+rr@gmail.com' : null,
  );
  final passController = TextEditingController(
    text: kDebugMode ? 'Test@123' : null,
  );
  final otpController = TextEditingController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (getIt<AppStateProvider>().selectedUserType == null) {
        context.goNamed(RouteNames.userType);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: registerViewModel,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: MediaQuery.of(context).size.height * 0.15,
            ),
            child: Form(
              key: _formKey,

              /// ✅ USING UPDATED AUTH CARD (IMPORTANT)
              child: AuthCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 🔹 LOGO
                    Center(
                      child: Image.network(
                        'https://rawrecruit.in/assets/RR-Tagline-CmOUAebu.png',
                        height: 40,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// 🔹 TITLE
                    Text(
                      'Create Account',
                      style: AppTextStyles.s22W600.copyWith(
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      'Enter your details to get started',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),

                    const SizedBox(height: 20),

                    /// 🔹 EMAIL
                    AppTextFields(
                      controller: emailController,
                      hint: 'Email Address',
                    ),

                    const SizedBox(height: 16),

                    /// 🔹 PASSWORD
                    AppTextFields.password(
                      controller: passController,
                      hint: 'Password',
                    ),

                    /// 🔹 OTP
                    Selector<RegisterViewModel, bool>(
                      selector: (_, vm) => vm.isOtpSent,
                      builder: (_, isOtpSent, _) {
                        return Column(
                          children: [
                            if (isOtpSent) ...[
                              const SizedBox(height: 16),
                              AppTextFields(
                                controller: otpController,
                                hint: 'Enter OTP',
                              ),
                            ],

                            const SizedBox(height: 20),

                            Selector<RegisterViewModel, bool>(
                              selector: (_, vm) => vm.isLoadingForOtp,
                              builder: (_, isLoading, _) {
                                if (isLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                return SizedBox(
                                  width: double.infinity,
                                  child: AppButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        Failure? failure;

                                        if (isOtpSent) {
                                          failure = await registerViewModel
                                              .register(
                                                email: emailController.text
                                                    .trim(),
                                                password: passController.text
                                                    .trim(),
                                                otp: otpController.text.trim(),
                                              );

                                          Toasts.showSuccessOrFailureToast(
                                            context,
                                            failure: failure,
                                            successMsg: 'Register Successful!',
                                            popOnSuccess: false,
                                            successCallback: () async {
                                              final onboardingService =
                                                  getIt<
                                                    OnboardingLocalService
                                                  >();

                                              await onboardingService.clear();

                                              final prefs =
                                                  await SharedPreferences.getInstance();

                                              await prefs.setBool(
                                                'onboarding_completed',
                                                false,
                                              );
                                              final email = emailController.text
                                                  .trim();

                                              getIt<AppStateProvider>().data =
                                                  User(email: email);
                                              context.goNamed(
                                                RouteNames.onboarding,
                                              );
                                            },
                                          );
                                        } else {
                                          failure = await registerViewModel
                                              .sendOtp(
                                                email: emailController.text
                                                    .trim(),
                                              );

                                          failure?.showError(context);
                                        }
                                      }
                                    },
                                    backgroundColor: AppColors.kGreen,
                                    foregroundColor: Colors.black,
                                    label: isOtpSent ? 'Register' : 'Send OTP',
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    /// 🔹 DIVIDER
                    Row(
                      children: [
                        Expanded(
                          child: Divider(color: Colors.grey.withOpacity(0.3)),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Or Continue with',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: Colors.grey.withOpacity(0.3)),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// 🔹 SOCIAL BUTTONS
                    Column(
                      children: [
                        _socialButton(
                          icon: Image.network(
                            'https://cdn-icons-png.flaticon.com/512/2991/2991148.png',
                            height: 18,
                          ),
                          text: "Continue with Google",
                          onTap: () async {
                            final failure = await registerViewModel
                                .googleLogin();

                            Toasts.showSuccessOrFailureToast(
                              context,
                              failure: failure,
                              successMsg: 'Register Successful!',
                              popOnSuccess: false,
                              successCallback: () async {
                                await getIt<AppStateProvider>()
                                    .getUserDetails();

                                final onboardingService =
                                    getIt<OnboardingLocalService>();

                                await onboardingService.clear();

                                final prefs =
                                    await SharedPreferences.getInstance();

                                await prefs.setBool(
                                  'onboarding_completed',
                                  false,
                                );
                                final email = emailController.text.trim();

                                getIt<AppStateProvider>().data = User(
                                  email: email,
                                );

                                if (getIt<AppStateProvider>()
                                    .isProfileComplete) {
                                  context.goNamed(
                                    RouteNames.dashboard,
                                    extra: {
                                      'userType':
                                          getIt<AppStateProvider>().userType,
                                    },
                                  );
                                } else {
                                  context.goNamed(RouteNames.onboarding);
                                }
                              },
                            );
                          },
                        ),

                        const SizedBox(height: 12),

                        _socialButton(
                          icon: Image.asset(
                            'assets/images/linkedin.png',
                            height: 18,
                            width: 18,
                          ),
                          text: "Continue with LinkedIn",
                          onTap: () async {
                            final failure = await registerViewModel
                                .linkedInLogin();

                            Toasts.showSuccessOrFailureToast(
                              context,
                              failure: failure,
                              successMsg: 'Register Successful!',
                              popOnSuccess: false,
                              successCallback: () async {
                                await getIt<AppStateProvider>()
                                    .getUserDetails();

                                final onboardingService =
                                    getIt<OnboardingLocalService>();

                                await onboardingService.clear();

                                final prefs =
                                    await SharedPreferences.getInstance();

                                await prefs.setBool(
                                  'onboarding_completed',
                                  false,
                                );
                                final email = emailController.text.trim();

                                getIt<AppStateProvider>().data = User(
                                  email: email,
                                );

                                if (getIt<AppStateProvider>()
                                    .isProfileComplete) {
                                  context.goNamed(
                                    RouteNames.dashboard,
                                    extra: {
                                      'userType':
                                          getIt<AppStateProvider>().userType,
                                    },
                                  );
                                } else {
                                  context.goNamed(RouteNames.onboarding);
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// 🔹 LOGIN
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          context.pushReplacementNamed(RouteNames.login);
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(color: Colors.grey),
                            children: [
                              TextSpan(
                                text: 'Login',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _socialButton({
  required Widget icon,
  required String text,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.kCard,
        borderRadius: BorderRadius.circular(14),

        /// 🔥 subtle border
        border: Border.all(color: AppColors.kBorder),

        /// 🔥 soft glow
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 10),

          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
