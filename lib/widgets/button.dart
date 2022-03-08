import 'package:flutter/material.dart';
import '../colors.dart';

class ButtonPrimary extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Icon? icon;
  const ButtonPrimary({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
  }) : super(key: key);

  style() => ElevatedButton.styleFrom(
        onPrimary: ColorApp.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: ColorApp.divider,
      );

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return ElevatedButton.icon(icon: icon!, onPressed: onPressed, label: Text(text));
    }
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

class ButtonText extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Icon? icon;
  const ButtonText({Key? key, required this.onPressed, required this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (icon != null) return TextButton.icon(onPressed: onPressed, icon: icon!, label: Text(text));
    return TextButton(onPressed: onPressed, child: Text(text));
  }
}

class ButtonBorder extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final Icon? icon;
  const ButtonBorder({Key? key, required this.onPressed, required this.text, this.icon}) : super(key: key);

  style() => OutlinedButton.styleFrom(
      elevation: 8,
      side: const BorderSide(color: ColorApp.primaryColor, width: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ));
  label() => Text(text);

  @override
  Widget build(BuildContext context) {
    if (icon != null) {
      return OutlinedButton.icon(icon: icon!, onPressed: onPressed,  label: label());
    }
    return OutlinedButton(onPressed: onPressed,  child: label());
  }
}
