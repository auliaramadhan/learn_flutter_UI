import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/button.dart';
import 'package:flutter_ui/widgets/checkbox.dart';
import 'package:flutter_ui/widgets/radio.dart';
import 'package:flutter_ui/widgets/spacing.dart';
import 'package:flutter_ui/widgets/text.dart';

class WidgetBasic2Screen extends StatelessWidget {
  const WidgetBasic2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic aja')),
      body: ListView(
        children: [
          const TypographyExample(),
          const ExtraHeight(),
          CheckboxExample(),
          const ExtraHeight(),
          RadioExample(),
          const ExtraHeight(),
          ButtonPrimary(
            onPressed: () {
              context.popRoute();
            },
            text: "Go back",
          ),
        ],
      ),
    );
  }
}
