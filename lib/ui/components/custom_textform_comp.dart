import 'package:cat_trivia/ui/components/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final String titleHintText;
  final bool isEmail;
  final bool isPassword;
  final bool obscureText;
  final int minLines;
  final int maxLines;
  final Widget? suffixIcon;
  final void Function()? onsuffixIconPressed;
  final void Function()? onPressed;
  final TextInputType keyboardType;
  final String? error;
  final int? maxLength;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatter;
  final TextAlign textAlign;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final bool isStarNeeded;

  const CustomTextField({
    Key? key,
    this.onPressed,
    this.onsuffixIconPressed,
    this.formatter,
    this.controller,
    this.hintText = '',
    this.title = '',
    this.isPassword = false,
    this.minLines = 1,
    this.maxLines = 2,
    this.isEmail = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.maxLength,
    this.obscureText = false,
    this.error,
    this.titleHintText = '',
    this.readOnly = false,
    this.onChanged,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.isStarNeeded = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title.isNotEmpty
            ? RichText(
                overflow: TextOverflow.clip,
                textAlign: TextAlign.end,
                textDirection: TextDirection.ltr,
                softWrap: true,
                maxLines: 1,
                textScaleFactor: 1,
                text: TextSpan(
                  text: widget.title,
                  style: Style.semiBold14().copyWith(
                    color: widget.error == null ? Style.text : Style.error,
                    fontWeight: FontWeight.w700,
                  ),
                  children: <TextSpan>[
                    widget.isStarNeeded
                        ? TextSpan(
                            text: ' *',
                            style: Style.semiBold14(color: Style.text))
                        : const TextSpan(),
                  ],
                ),
              )
            : const SizedBox(),
        widget.title.isNotEmpty ? SizedBox(height: 8.h) : const SizedBox(),
        widget.titleHintText.isNotEmpty
            ? Text(widget.titleHintText,
                style: Style.semiBold14(color: Style.text))
            : const SizedBox(),
        widget.titleHintText.isNotEmpty
            ? SizedBox(height: 6.h)
            : const SizedBox(),
        TextFormField(
          onTap: widget.onPressed,
          textInputAction: TextInputAction.done,
          focusNode: widget.focusNode,
          maxLength: widget.maxLength,
          onChanged: widget.onChanged,
          readOnly: widget.readOnly,
          textAlign: widget.textAlign,
          inputFormatters: widget.formatter,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          controller: widget.controller,
          style: Style.semiBold14(color: Style.text),
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            counterText: widget.maxLength == 500 ? null : '',
            suffixIcon: widget.suffixIcon != null
                ? IconButton(
                    splashColor: Style.transparent,
                    highlightColor: Style.transparent,
                    icon: widget.suffixIcon!,
                    onPressed: widget.onsuffixIconPressed ?? () {})
                : null,
            focusColor: Style.primary,
            fillColor: Style.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(color: Style.primary, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(color: Style.primary, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(color: Style.primary, width: 1),
            ),
            hintText: widget.hintText,
            hintStyle: Style.semiBold14(color: Style.grey),
            errorText: widget.error,
            errorStyle: Style.regular14().copyWith(color: Style.error),
            contentPadding: EdgeInsets.only(left: 12.w, top: 10.h, right: 12.w),
          ),
        ),
      ],
    );
  }
}
