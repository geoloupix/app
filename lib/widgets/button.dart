import 'package:app/app/core/constants.dart';
import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, danger }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final ButtonType type;
  const AppButton({Key? key, required this.text, required this.onTap, this.type = ButtonType.primary})
      : super(key: key);

  Color get textColor {
    switch (type) {
      case ButtonType.primary:
        return AppConstants.colors.white;
      case ButtonType.secondary:
        return AppConstants.colors.primary;
      case ButtonType.danger:
        return AppConstants.colors.white;
    }
  }

  Color get backgroundColor {
    switch (type) {
      case ButtonType.primary:
        return AppConstants.colors.primary;
      case ButtonType.secondary:
        return AppConstants.colors.white;
      case ButtonType.danger:
        return AppConstants.colors.red;
    }
  }

  Color get borderColor {
    switch (type) {
      case ButtonType.primary:
        return AppConstants.colors.primary;
      case ButtonType.secondary:
        return AppConstants.colors.primary;
      case ButtonType.danger:
        return AppConstants.colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: backgroundColor,
                      border: Border.all(color: borderColor, width: 2)),
                  alignment: Alignment.center,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: AppConstants.texts.button.copyWith(color: textColor),
                  )),
            ),
          ],
        ));
  }
}
