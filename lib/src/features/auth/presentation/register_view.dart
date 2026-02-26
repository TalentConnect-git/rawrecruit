import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart'
    show
        AppTextStyles,
        AppColors,
        AppTextFields,
        AppButton,
        AppLoadingIndicator;
import 'package:rawrecruit/src/core/index.dart'
    show
        UserType,
        Failure,
        Toasts,
        RouteNames,
        FailureExt,
        getIt,
        AppStateProvider;
import 'package:rawrecruit/src/features/auth/index.dart'
    show AuthCard, UserTypeCard, RegisterViewModel;

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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: registerViewModel,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: MediaQuery.of(context).size.height * 0.15,
          ),
          child: Form(
            key: _formKey,
            child: AuthCard(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 36),
                    child: Image.network(
                      'https://rawrecruit.in/assets/RR-Tagline-CmOUAebu.png',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Welcome User,',
                    style: AppTextStyles.s22W600.copyWith(
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Enter your detail to create an account.',
                    style: AppTextStyles.s14W400,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Select User Type',
                    style: AppTextStyles.s16W600.copyWith(
                      color: AppColors.text,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Selector<RegisterViewModel, UserType>(
                    selector: (_, vm) => vm.userType,
                    builder: (_, selectedType, _) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...UserType.values.map(
                          (userType) => GestureDetector(
                            onTap: () {
                              registerViewModel.userType = userType;
                            },
                            child: UserTypeCard(
                              userType: userType,
                              isSelected: selectedType == userType,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppTextFields(
                    controller: emailController,
                    hint: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email address is required';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  AppTextFields.password(
                    controller: passController,
                    hint: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }

                      return null;
                    },
                  ),
                  Selector<RegisterViewModel, bool>(
                    selector: (_, vm) => vm.isOtpSent,
                    builder: (_, isOtpSent, _) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isOtpSent) ...[
                            const SizedBox(height: 16),
                            AppTextFields(
                              controller: otpController,
                              hint: 'Enter OTP',
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'OTP is required';
                                }

                                final isNotValid =
                                    (int.tryParse(value)) == null;

                                if (isNotValid) {
                                  return 'Enter valid OTP';
                                }

                                return null;
                              },
                            ),
                          ],
                          const SizedBox(height: 20),
                          Selector<RegisterViewModel, bool>(
                            selector: (_, vm) => vm.isLoadingForOtp,
                            builder: (_, isLoading, _) {
                              if (isLoading) return AppLoadingIndicator();

                              return AppButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    Failure? failure;
                                    if (isOtpSent) {
                                      failure = await registerViewModel
                                          .register(
                                            email: emailController.text.trim(),
                                            password: passController.text
                                                .trim(),
                                            otp: otpController.text.trim(),
                                          );

                                      Toasts.showSuccessOrFailureToast(
                                        context,
                                        failure: failure,
                                        successMsg: 'Register Successful!',
                                        popOnSuccess: false,
                                        successCallback: () {
                                          context.pushReplacementNamed(
                                            RouteNames.dashboard,
                                            extra: getIt<AppStateProvider>()
                                                .userType,
                                          );
                                        },
                                      );
                                    } else {
                                      failure = await registerViewModel.sendOtp(
                                        email: emailController.text.trim(),
                                      );

                                      failure?.showError(context);
                                    }
                                  }
                                },
                                foregroundColor: AppColors.background,
                                backgroundColor: AppColors.primary,
                                label: isOtpSent ? 'Register' : 'Send OTP',
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    spacing: 16,
                    children: [
                      Expanded(child: Divider()),
                      Text('Or Continue with'),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  AppButton.outlined(
                    onPressed: () {},
                    foregroundColor: AppColors.background,
                    backgroundColor: AppColors.text,
                    label: 'Register with Google',
                  ),
                  const SizedBox(height: 12),
                  AppButton.outlined(
                    onPressed: () {},
                    foregroundColor: AppColors.background,
                    backgroundColor: AppColors.text,
                    label: 'Register with LinkedIn',
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      context.pushReplacementNamed(RouteNames.login);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: AppTextStyles.s14W400,
                        ),
                        Text(
                          "Login",
                          style: AppTextStyles.s14W600.copyWith(
                            color: AppColors.primary,
                            decorationColor: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
