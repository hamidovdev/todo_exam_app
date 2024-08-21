import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/extension.dart';

import 'w_scale.dart';

class WButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final GestureTapCallback onTap;
  final Widget? child;
  final BoxBorder? border;
  final double? borderRadius;

  const WButton({
    required this.onTap,
    this.width,
    this.borderRadius,
    this.height,
    this.text = '',
    this.color,
    this.textStyle,
    this.margin,
    this.padding,
    this.border,
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: WScaleAnimation(
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color ?? context.colors.blueMain,
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
              border: border,
            ),
            child: Align(
              alignment: Alignment.center,
              child: child ??
                  Text(
                    text,
                    style: textStyle ??
                        context.styles.fontSz16Weight400ColorWhite.copyWith(
                          color: context.colors.white,
                          decorationColor: context.colors.blue2,
                        ),
                  ),
            ),
          ),
        ),
      );
}
