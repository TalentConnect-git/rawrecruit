import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

class AppTextFields extends StatefulWidget {
  const AppTextFields({
    required this.controller,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.helperText,
    this.enable = true,
    this.readOnly = false,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.maxLines = 1,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    super.key,
  }) : _isPassword = false;

  const AppTextFields.password({
    required this.controller,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.enable = true,
    this.readOnly = false,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.helperText,
    this.maxLines = 1,
    super.key,
  }) : _isPassword = true;

  final bool _isPassword;

  final TextEditingController controller;
  final String? hint;
  final bool enable;
  final bool readOnly;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? helperText;
  final int maxLines;

  final AutovalidateMode autoValidateMode;
  final String? Function(String? val)? validator;
  final void Function(String? val)? onChanged;

  @override
  State<AppTextFields> createState() => _AppTextFieldsState();
}

class _AppTextFieldsState extends State<AppTextFields> {
  final _isVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ValueListenableBuilder(
        valueListenable: _isVisible,
        builder: (_, visible, _) {
          return TextFormField(
            controller: widget.controller,
            enabled: widget.enable,
            readOnly: widget.readOnly,
            obscureText: widget._isPassword && !visible,
            obscuringCharacter: '*',
            autovalidateMode: widget.autoValidateMode,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            maxLines: widget._isPassword ? 1 : widget.maxLines,

            onChanged: widget.onChanged,

            onTapOutside: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },

            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.border),
                borderRadius: BorderRadius.circular(8),
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.kGreen),
                borderRadius: BorderRadius.circular(8),
              ),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.white),
                borderRadius: BorderRadius.circular(8),
              ),

              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.errorBorder),
                borderRadius: BorderRadius.circular(8),
              ),

              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.kGreen),
                borderRadius: BorderRadius.circular(8),
              ),

              labelText: widget.hint ?? '',

              labelStyle: AppTextStyles.s16W500.copyWith(
                color: AppColors.white,
              ),

              floatingLabelStyle: AppTextStyles.s16W400.copyWith(
                color: AppColors.white,
              ),

              helperText: widget.helperText,

              helperStyle: AppTextStyles.s12W400.copyWith(
                color: Colors.grey,
              ),

              errorStyle: AppTextStyles.s12W600.copyWith(
                color: Colors.red,
              ),

              isDense: true,

              prefixIcon: widget.prefixIcon,

              suffixIcon: widget._isPassword
                  ? GestureDetector(
                      onTap: () {
                        _isVisible.value = !_isVisible.value;
                      },
                      child: ValueListenableBuilder(
                        valueListenable: _isVisible,
                        builder: (context, visible, child) => Icon(
                          visible
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                          color: visible
                              ? AppColors.kGreen
                              : AppColors.text,
                          size: 24,
                        ),
                      ),
                    )
                  : widget.suffixIcon,
            ),

            style: AppTextStyles.s16W400.copyWith(
              color: AppColors.white,
            ),
          );
        },
      ),
    );
  }
}