import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/core/extensions/extension.dart';

class WTextField extends StatefulWidget {
  final bool? hasBorderColor;
  final String title;
  final double borderRadius;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final double? width;
  final double? height;
  final TextInputType? keyBoardType;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final List<TextInputFormatter>? textInputFormatters;
  final Color? fillColor;
  final EdgeInsets? margin;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final Function()? onEditCompleted;
  final int? maxlines;
  final int? minLines;
  final bool autoFocus;
  final EdgeInsets? contentPadding;

  const WTextField({
    this.controller,
    this.onChanged,
    this.hasBorderColor,
    this.autoFocus = false,
    this.borderRadius = 5,
    this.maxlines = 1,
    this.textAlign = TextAlign.start,
    this.width,
    this.fillColor,
    this.title = '',
    this.textStyle,
    this.hintText,
    this.hintTextStyle,
    this.margin,
    this.textInputFormatters,
    this.keyBoardType,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.height,
    Key? key,
    this.onEditCompleted,
    this.minLines,
    this.contentPadding,
  }) : super(key: key);

  @override
  _WTextFieldState createState() => _WTextFieldState();
}

class _WTextFieldState extends State<WTextField>
    with SingleTickerProviderStateMixin {
  late FocusNode focusNode;
  bool focused = false;
  bool hasText = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    focusNode = FocusNode();

    focusNode.addListener(
      () => setState(() => focused = !focused),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        margin: widget.margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: widget.height,
              width: widget.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    child: TextField(
                      textAlign: widget.textAlign,
                      inputFormatters: widget.textInputFormatters,
                      textInputAction: widget.textInputAction,
                      keyboardType: widget.keyBoardType,
                      controller: widget.controller,
                      minLines: widget.minLines ?? 1,
                      maxLines: widget.maxlines,
                      autofocus: widget.autoFocus,
                      onEditingComplete: widget.onEditCompleted,
                      onChanged: (s) {
                        setState(() => hasText = s.isNotEmpty);
                        if (widget.onChanged != null) {
                          widget.onChanged!(s);
                        }
                      },
                      focusNode: focusNode,
                      style: widget.textStyle ??
                          context.styles.fontSz16Wight600ColorBlack,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 1,
                            color: context.colors.blueMain.withOpacity(.1),
                          ),
                        ),
                        hintText: widget.hintText,
                        hintStyle: widget.hintTextStyle ??
                            context.styles.fontSz16Wight600ColorBlack,
                        filled: true,
                        fillColor: widget.fillColor ?? context.colors.grey4,
                        contentPadding: widget.contentPadding,
                        disabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            width: 1,
                            color: widget.hasBorderColor != null &&
                                    !widget.hasBorderColor!
                                ? Colors.transparent
                                : context.colors.blueMain.withOpacity(.1),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            width: 1,
                            color: widget.hasBorderColor != null &&
                                    !widget.hasBorderColor!
                                ? Colors.transparent
                                : context.colors.blueMain.withOpacity(.1),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(widget.borderRadius),
                          borderSide: BorderSide(
                            width: 1,
                            color: widget.hasBorderColor != null &&
                                    !widget.hasBorderColor!
                                ? Colors.transparent
                                : context.colors.blueMain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
