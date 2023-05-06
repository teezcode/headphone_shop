import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:headphone_shop/ui/widgets/styles/styles.dart';



/// pass a [loadingNotifier] to manage button loading state
/// pass [isLoading] to manually set button state
class BoxButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? textSize;
  final VoidCallback? onPressed;
  final double borderRadius;
  final bool? fullLength;
  final bool? disabled;
  final ValueNotifier<bool>? loadingNotifier;
  final bool isLoading;
  final bool wrap;
  const BoxButton({
    this.text,
    this.backgroundColor,
    this.textColor,
    this.textSize,
    this.onPressed,
    required this.borderRadius,
    this.fullLength,
    this.wrap = false,
    this.disabled,
    this.loadingNotifier,
    this.isLoading = false,
  });

  const BoxButton.light({
    this.text,
    this.textSize,
    this.onPressed,
    this.fullLength,
    this.wrap = false,
    this.disabled,
    this.loadingNotifier,
    this.isLoading = false,
  })  : backgroundColor = AppStyles.PRIMARY_COLOR_LIGHT,
        textColor = AppStyles.PRIMARY_COLOR,
        borderRadius = 100;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: loadingNotifier ?? ValueNotifier(false),
        builder: (_, loading, child) {
          Widget widget = loading || isLoading
              ? const CupertinoActivityIndicator()
              : Text(
                  text ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: textSize ?? 14,
                  ),
                );
          return TextButton(
            onPressed: loading || isLoading ? null : onPressed,
            style: TextButton.styleFrom(
              backgroundColor: _backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                side: BorderSide(width: 0.3, color: Color(0xff4A9CDC),),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: widget,
            ),
          );
        });
  }

  Color get _backgroundColor {
    Color c = backgroundColor ?? AppStyles.PRIMARY_COLOR;
    if (disabled ?? false) return c.withOpacity(.5);
    return c;
  }
}
