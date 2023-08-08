import 'package:flutter/material.dart';
import 'package:share_sms/widgets/form/custom_icon_button.dart';
import 'package:share_sms/widgets/form/custom_text_field.dart';

class CustomPasswordField extends StatefulWidget {
  CustomPasswordField(
      {Key? key,
      this.validator,
      required this.onSaved,
      this.hintText,
      this.controller})
      : super(key: key);

  final String? Function(String?)? validator;
  final void Function(String?) onSaved;
  final String? hintText;
  final TextEditingController? controller;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool hiddenPassword = true;

  toggle() {
    setState(() {
      hiddenPassword = !hiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onSaved: widget.onSaved,
      validator: widget.validator,
      hintText: widget.hintText,
      obscureText: hiddenPassword,
      controller: widget.controller,
      suffixIcon: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: CustomIconButton(
          size: 32,
          iconColor: Theme.of(context).textTheme.bodyLarge!.color,
          icon: hiddenPassword ? Icons.visibility : Icons.visibility_off,
          onTap: toggle,
        ),
      ),
    );
  }
}
