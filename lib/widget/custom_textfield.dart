import 'package:clinic/common/styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? initialValue;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool readOnly;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Color? cursorColor;
  final int? maxLines;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final AutovalidateMode? autoValidateMode;
  final bool? enableSuggestions;
  final bool? enableInteractiveSelection;
  final int? errorMaxLines;
  final TextAlign? textAlign;

  const CustomTextFormField({
    Key? key,
    this.initialValue,
    this.controller,
    this.labelText,
    this.hintText,
    this.labelStyle,
    this.hintStyle,
    this.textStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.cursorColor,
    this.maxLines,
    this.width,
    this.height, 
    this.readOnly = false, 
    this.onTap, 
    this.autoValidateMode,
    this.enableSuggestions,
    this.enableInteractiveSelection = true, 
    this.errorMaxLines, this.textAlign
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: labelText != null,
          child: Text(
            labelText.toString(),
            style: labelStyle ?? ralewayMedium(black,13),
          ),
        ),
        const SizedBox(height: 4.0),
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: SizedBox(
            width: width,
            height: height,
            child: TextFormField(
              enableInteractiveSelection: onTap != null 
                ? false
                : enableInteractiveSelection,
              enableSuggestions: enableSuggestions ?? false,
              onTap: onTap,
              autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
              initialValue: initialValue,
              controller: controller,
              obscureText: obscureText,
              readOnly: readOnly,
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              validator: validator,
              onChanged: onChanged,
              cursorColor: cursorColor,
              maxLines: maxLines,
              style: textStyle,
              textAlign: textAlign ?? TextAlign.start,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}