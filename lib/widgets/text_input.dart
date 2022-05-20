import 'package:geoloupix/app/core/constants.dart';
import 'package:flutter/material.dart';

class AppTextInput extends StatefulWidget {
  final String hint;
  final String? Function(String?) validator;
  final String? Function(String?) onSaved;
  final TextInputType? keyboardType;
  const AppTextInput({Key? key, required this.hint, required this.validator, required this.onSaved, this.keyboardType})
      : super(key: key);

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
  late final bool isPassword = widget.keyboardType == TextInputType.visiblePassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstants.colors.primary, width: 2),
              borderRadius: BorderRadius.circular(12)),
          hintText: widget.hint,
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppConstants.colors.red, width: 2),
              borderRadius: BorderRadius.circular(12)),
          errorStyle: AppConstants.texts.paragraph.copyWith(fontSize: 12, color: AppConstants.colors.red)),
      cursorColor: AppConstants.colors.primary,
      style: AppConstants.texts.paragraph,
      validator: widget.validator,
      onSaved: widget.onSaved,
      keyboardType: widget.keyboardType,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
    );
  }
}
