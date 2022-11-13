import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/utils/string_formatter.dart';
import '../colors.dart';
import 'button.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final FocusNode? focusNode;

  const TextInput({Key? key, this.controller, this.validator, this.obscureText = false, this.focusNode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      decoration: InputDecoration(
        // for blur text that will be  hidden after fill
        hintText: "email",
        // for floating text
        labelText: "email",
        prefixIcon: const Icon(Icons.email),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            controller?.clear();
          },
        ),
        errorText: "wrond email",
        border: const OutlineInputBorder(),
        // border: const OutlineInputBorder(borderSide: BorderSide(width: 2, color: ColorApp.divider), borderRadius: BorderRadius.all(Radius.circular(4.0)), gapPadding: 8),
        icon: const Icon(Icons.text_snippet_outlined),
      ),
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class FormData extends StatefulWidget {
  const FormData({Key? key}) : super(key: key);

  @override
  State<FormData> createState() => _FormDataState();
}

final GlobalKey<FormState> formKey = GlobalKey(debugLabel: "form");
final formUnfocusKey = GlobalKey<FormState>(debugLabel: "formUnfocous");
final emailFocus = FocusNode();

class _FormDataState extends State<FormData> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextInput(
            controller: _emailCtrl,
            focusNode: emailFocus,
            validator: (text) => (text != null && text.isEmpty) ? "ERROR" : null,
          ),
          TextInput(
            controller: _passCtrl,
            validator: (text) => (text != null && text.isEmpty) ? "error" : null,
          ),
          ButtonPrimary(
              text: 'valid',
              onPressed: () {
                formKey.currentState?.validate();
              }),
          ButtonPrimary(
              text: 'save',
              onPressed: () {
                formKey.currentState?.save();
              }),
          ButtonPrimary(
              text: 'valid',
              onPressed: () {
                formKey.currentState?.validate();
              }),
          ButtonPrimary(
              text: 'focus email',
              onPressed: () {
                FocusScope.of(context).requestFocus(emailFocus);
              }),
          ButtonPrimary(
              text: 'unfocus',
              onPressed: () {
                FocusScope.of(context).requestFocus(FocusNode());
                FocusScope.of(context).unfocus();
              }),
        ],
      ),
    );
  }
}

class KeyboardDismiss extends StatefulWidget {
  const KeyboardDismiss({Key? key}) : super(key: key);

  @override
  State<KeyboardDismiss> createState() => _KeyboardDismissState();
}

class _KeyboardDismissState extends State<KeyboardDismiss> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onVerticalDragDown],
      child: Form(
        key: formUnfocusKey,
        child: Column(
          children: [
            TextInput(
              controller: _emailCtrl,
              focusNode: emailFocus,
              validator: (text) => (text != null && text.isEmpty) ? "ERROR" : null,
            ),
            TextInput(
              controller: _passCtrl,
              validator: (text) => (text != null && text.isEmpty) ? "error" : null,
            ),
            TextInput(
              controller: _passCtrl,
              validator: (text) => (text != null && text.isEmpty) ? "error" : null,
            ),
            TextInput(
              controller: _passCtrl,
              validator: (text) => (text != null && text.isEmpty) ? "error" : null,
            ),
            TextInput(
              controller: _passCtrl,
              validator: (text) => (text != null && text.isEmpty) ? "error" : null,
            ),
            TextInput(
              controller: _passCtrl,
              validator: (text) => (text != null && text.isEmpty) ? "error" : null,
            ),
          ],
        ),
      ),
    );
  }
}

abstract class AppInputFormatter {
  final regexFormatter = FilteringTextInputFormatter.allow(RegExp(r' (0-9) '));
  // Example
  final regexLetter = FilteringTextInputFormatter.allow(RegExp(r' [a-zA-Z]')); //only letters;
  final regexNoLine = FilteringTextInputFormatter.deny(RegExp(r'\n')); // - single line;
  final regexNoDash = FilteringTextInputFormatter.deny(RegExp(r'[-]')); // - without dashes;

  //
  final lengthFormat = LengthLimitingTextInputFormatter(4);
}

class CustomCUrrencyFormat extends TextInputFormatter {
  final String sample;
  final String separator;
  CustomCUrrencyFormat({
    required this.sample,
    required this.separator,
  }) {
    assert(sample != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > 3) {
        final tempLastChar = newValue.text.substring(newValue.text.length - 1);
        final num = AppFormatter.getNumCurrency(newValue.text.substring(0, newValue.text.length - 1))!;
        final pricenum = (num * 10) + int.parse(tempLastChar);
        final price = AppFormatter.setCurrency(pricenum);
        return TextEditingValue(
          // new value for price
          text: price!,
        );
      }
    }
    return newValue;
  }
}
