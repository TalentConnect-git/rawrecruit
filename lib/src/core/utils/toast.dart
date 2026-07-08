import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rawrecruit/src/common/index.dart' show AppTextStyles;
import 'package:rawrecruit/src/core/index.dart'
    show Failure, NavigationRepository, getIt;

class Toasts {
  static OverlayEntry? currEntry;

  static void _showToast(
    BuildContext context, {
    required String message,
    required Color backgroundClr,
    required Border border,
    required IconData icon,
    Widget? trailing,
  }) {
    final ctx = getIt<NavigationRepository>().context;
    final overlay = Overlay.of(ctx!); // just

    if (currEntry != null) return;

    // Animation controller
    AnimationController controller = AnimationController(
      vsync: Navigator.of(ctx),
      duration: Duration(milliseconds: 300),
    );

    final overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          bottom:
              MediaQuery.of(context).padding.bottom +
              kToolbarHeight, // below status bar
          left: 16,
          right: 16,
          child: Material(
            color: Colors.transparent,
            child: SlideTransition(
              position: Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
                  .animate(
                    CurvedAnimation(parent: controller, curve: Curves.easeOut),
                  ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: backgroundClr,
                  borderRadius: BorderRadius.circular(8),
                  border: border,
                ),
                child: Row(
                  children: [
                    Icon(icon, size: 32, color: Colors.white),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        message,
                        style: AppTextStyles.s16W600.copyWith(
                          color: Colors.white,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    if (trailing != null)
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: trailing,
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(overlayEntry);
    currEntry = overlayEntry;
    controller.forward();

    Future.delayed(Duration(seconds: 4), () {
      controller.reverse().then((_) {
        currEntry = null;
        overlayEntry.remove();
      });
    });
  }

  static void showInfoToast(
    BuildContext context, {
    required String message,
    Widget? trailing,
  }) {
    _showToast(
      context,
      message: message,
      backgroundClr: Colors.orange.shade400,
      border: Border.all(color: Colors.orange.shade900, width: 1.5),
      icon: Icons.info_outline,
      trailing: trailing,
    );
  }

  // static void showLoginToast(BuildContext context) {
  //   showInfoToast(
  //     context,
  //     message: 'Please Login first',
  //     trailing: InkWell(
  //       splashFactory: NoSplash.splashFactory,
  //       onTap: () {
  //         ///
  //         context.pushNamed(RouteNames.loginRegister);
  //       },
  //       child: Container(
  //         padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
  //         decoration: BoxDecoration(
  //           color: Colors.orange.shade50,
  //           border: Border.all(color: Colors.orange),
  //           borderRadius: BorderRadius.circular(4),
  //         ),
  //         child: Text(
  //           'Login',
  //           style: AppTextStyles.s14W600.copyWith(color: Colors.black),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  static void showErrorToast(BuildContext context, {required String? message}) {
    if (message == null) return;
    _showToast(
      context,
      message: message,
      backgroundClr: Colors.red.shade400,
      border: Border.all(color: Colors.red.shade900, width: 2),
      icon: Icons.error_outline,
    );
  }

  static void showSuccessToast(
    BuildContext context, {
    required String message,
  }) {
    _showToast(
      context,
      message: message,
      backgroundClr: Color(0xff222222),
      border: Border.all(color: Color(0xff444444), width: 2),
      icon: Icons.check,
    );
  }

  static void showSuccessOrFailureToast(
    BuildContext context, {
    Failure? failure,
    String? failureMsg,
    VoidCallback? failureCallback,
    bool popOnFailure = false,
    bool hideFailure = false,
    bool popOnSuccess = true,
    bool hideSuccess = false,
    String? successMsg,
    String? successTitle,
    VoidCallback? successCallback,
  }) {
    if (failure == null) {
      if (!hideSuccess) {
        Toasts.showSuccessToast(
          context,
          message: successMsg ?? 'Api Hit Successfully',
        );
      }

      if (successCallback != null) {
        successCallback();
      }

      if (popOnSuccess) {
        context.pop(true);
      }
    } else {
      if (!hideFailure) {
        Toasts.showErrorToast(
          context,
          message: failureMsg ?? (failure.message ?? 'API hit Failed'),
        );
      }

      if (failureCallback != null) {
        failureCallback();
      }

      if (popOnFailure) {
        context.pop(true);
      }
    }
  }
}
