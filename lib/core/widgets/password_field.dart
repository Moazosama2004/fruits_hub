import 'package:flutter/material.dart';
import 'package:fruits_hub/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});

  final Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObsecure = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: widget.onSaved,
      text: 'كلمة المرور',
      isObsecure: isObsecure,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isObsecure = !isObsecure;
          });
        },
        icon:
            isObsecure
                ? const Icon(Icons.remove_red_eye, color: Color(0xffC9CECF))
                : const Icon(Icons.visibility_off, color: Color(0xffC9CECF)),
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
