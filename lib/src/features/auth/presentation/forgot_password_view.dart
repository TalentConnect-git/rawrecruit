import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/common/index.dart'
    show AppTextFields, AppColors, RAppBar, AppButton;
import 'package:rawrecruit/src/core/index.dart' show Toasts;
import 'package:rawrecruit/src/features/auth/index.dart'
    show ForgotPasswordViewModel;

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _LoginViewState();
}

class _LoginViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(text: '');

  final ForgotPasswordViewModel forgotPasswordViewModel =
      ForgotPasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: forgotPasswordViewModel,
      child: Scaffold(
        backgroundColor: Colors.black, // ✅ FIX

        appBar: RAppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          label: 'Forgot Password',
          leading: InkWell(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.keyboard_arrow_left, color: AppColors.white),
          ),
        ),

        body: Selector<ForgotPasswordViewModel, bool>(
          selector: (_, vm) => vm.isLoading,
          builder: (_, isLoading, _) => isLoading
              ? Center(
                  child: CircularProgressIndicator(color: AppColors.kGreen),
                )
              : Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppTextFields(
                          controller: emailController,
                          hint: 'Email Address',
                        ),

                        const SizedBox(height: 20),

                        /// 🔹 LOGIN BUTTON
                        AppButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final failure = await forgotPasswordViewModel
                                  .sendResetLink(
                                    email: emailController.text.trim(),
                                  );

                              Toasts.showSuccessOrFailureToast(
                                context,
                                failure: failure,
                                successMsg:
                                    "If your email is registered, you’ll receive a password reset link shortly.",
                              );
                            }
                          },
                          foregroundColor: Colors.black, // ✅ FIX
                          backgroundColor: AppColors.kGreen, // ✅ FIX
                          label: 'Send Password Reset Link',
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
