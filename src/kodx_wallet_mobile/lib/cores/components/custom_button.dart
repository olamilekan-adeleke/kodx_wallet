import 'package:flutter/material.dart';
import 'package:kodx_wallet_mobile/cores/utils/custom_sizer_utils.dart';

import '../../cores/constants/color.dart';

import 'custom_circular_progress_indicator.dart';
import 'custom_text_widget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.textSize,
    this.height,
    this.width,
    this.textFontWeight,
    this.circular = false,
  })  : busy = false,
        iconData = null,
        iconSize = null,
        iconColor = null;

  const CustomButton.loading({
    this.onTap,
    this.color,
    this.height,
    this.width,
  })  : busy = true,
        iconData = null,
        text = null,
        textColor = null,
        textSize = null,
        textFontWeight = null,
        iconSize = null,
        iconColor = null,
        circular = false;

  const CustomButton.smallSized({
    this.text,
    this.onTap,
    this.color,
    this.textColor,
    this.textSize,
    this.height,
    this.width,
    this.textFontWeight,
    this.circular = false,
  })  : busy = false,
        iconData = null,
        iconSize = null,
        iconColor = null;

  const CustomButton.icon({
    required this.iconData,
    required this.height,
    required this.width,
    this.onTap,
    this.color,
    this.iconColor,
    this.iconSize,
    this.circular = false,
  })  : busy = false,
        text = null,
        textColor = null,
        textSize = null,
        textFontWeight = null;

  final String? text;
  final IconData? iconData;
  final void Function()? onTap;
  final bool busy;
  final Color? color;
  final Color? textColor;
  final double? textSize;
  final double? height;
  final double? width;
  final FontWeight? textFontWeight;
  final Color? iconColor;
  final double? iconSize;
  final bool circular;

  @override
  Widget build(BuildContext context) {
    const double __defaultHeight = 52.0;
    final double __defaultWidth = MediaQuery.of(context).size.width * 0.95;

    Widget child;

    if (text == null) {
      if (busy) {
        child = loadingIndicator(color: kcPrimaryColor);
      } else {
        child = Icon(
          iconData,
          color: iconColor ?? Colors.white,
          size: iconSize ?? 20.0,
        );
      }
    } else {
      child = textWidget(
        text ?? 'no text',
        color: textColor ?? white,
        size: textSize ?? sizerSp(18),
        fontWeight: textFontWeight ?? FontWeight.w700,
      );
    }

    return SizedBox(
      height: height ?? __defaultHeight,
      width: width ?? __defaultWidth,
      child: TextButton(
        onPressed: () => onTap!(),
        style: ButtonStyle(
          shape: circular
              ? MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                )
              : MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
          backgroundColor: busy
              ? MaterialStateProperty.all(kcPrimaryColor)
              : MaterialStateProperty.all(color ?? kcPrimaryColor),
        ),
        child: child,
      ),
    );
  }
}
