import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:yoko_testwork/const/colors.dart';

final Shader linearGradient = const LinearGradient(
        colors: <Color>[kPrimaryBlueColor, kSecondaryBlueColor])
    .createShader(const Rect.fromLTWH(0.0, 0.0, 100.0, 50.0));

class RoundedTextField extends StatelessWidget {
  const RoundedTextField({
    Key? key,
    required this.hintText,
    this.icon,
    this.controller,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.suffix,
    this.validator,
    this.onTap,
    this.fillColor = kWhite4,
    this.isGradient = false,
  }) : super(key: key);
  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final bool isObscure;
  final TextInputType keyboardType;
  final Widget? suffix;
  final MultiValidator? validator;
  final Function? onTap;
  final Color? fillColor;
  final bool isGradient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        readOnly: controller == null,
        onTap: onTap as Function()?,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isObscure,
        validator: validator != null
            ? validator!
            : MinLengthValidator(0, errorText: "The field cannot be empty"),
        textAlign: controller == null ? TextAlign.center : TextAlign.left,
        cursorColor: kWhite100,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kWhite8),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kWhite8),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kPrimaryRedColor),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kWhite35),
            borderRadius: BorderRadius.circular(12),
          ),
          suffix: const SizedBox(width: 8),
          hintText: hintText,
          hintStyle: TextStyle(
            color: !isGradient ? kWhite50 : null,
            fontSize: 16,
            foreground: isGradient ? (Paint()..shader = linearGradient) : null,
          ),
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: kPrimaryBlueColor,
                )
              : null,
          suffixIcon: suffix,
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
