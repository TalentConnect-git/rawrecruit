import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/index.dart';

class AppTextFields extends StatefulWidget {
  const AppTextFields({
    required this.controller,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.enable = true,
    this.validator,
    this.onChanged,
    this.keyboardType,
    super.key,
  }) : _isPassword = false;

  const AppTextFields.password({
    required this.controller,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.enable = true,
    this.validator,
    this.onChanged,
    this.keyboardType,
    super.key,
  }) : _isPassword = true;

  final bool _isPassword;

  final TextEditingController controller;
  final String? hint;
  final bool? enable;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
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
            enabled: widget.enable ?? true,
            obscureText: widget._isPassword && !visible,
            obscuringCharacter: '*',
            onTapOutside: (_) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onTap: () {},
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.text),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.text),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.text),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: widget.hint ?? '',
              labelStyle: AppTextStyles.s16W500.copyWith(
                color: AppColors.secText,
              ),
              floatingLabelStyle: AppTextStyles.s16W400.copyWith(
                color: AppColors.primary,
              ),
              errorStyle: AppTextStyles.s12W600.copyWith(color: Colors.red),
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
                          color: visible ? AppColors.primary : AppColors.text,
                          size: 24,
                        ),
                      ),
                    )
                  : widget.suffixIcon,
            ),
            style: AppTextStyles.s16W400.copyWith(color: AppColors.text),
          );
        },
      ),
    );
  }
}
