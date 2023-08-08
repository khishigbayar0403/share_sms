import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.validator,
      this.onSaved,
      this.hintText,
      this.obscureText,
      this.controller,
      this.onChanged,
      this.initialValue,
      this.onFieldSubmitted,
      this.keyboardType,
      this.suffixIcon,
      this.prefix})
      : super(key: key);

  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? hintText;
  final bool? obscureText;
  final String? initialValue;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final Widget? prefix;

  @override
  Widget build(BuildContext context) {
    var obscure = obscureText ?? false;
    return ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 48, minWidth: 100),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                  keyboardType: keyboardType,
                  controller: controller,
                  validator: validator,
                  obscureText: obscure,
                  onSaved: onSaved,
                  onFieldSubmitted: onFieldSubmitted,
                  initialValue: initialValue,
                  onChanged: onChanged,
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    hintText: hintText ?? "",
                    suffixIcon: suffixIcon,
                    suffixIconConstraints:
                        const BoxConstraints(minWidth: 28, maxHeight: 28),
                    prefixIconConstraints:
                        const BoxConstraints(minWidth: 28, maxHeight: 28),
                    prefixIcon: prefix,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8)),
                    filled: true,
                    fillColor: Theme.of(context).dividerColor.withAlpha(10),
                  )),
            )
          ],
        ));
  }
}
