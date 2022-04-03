import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../colors.dart';
import '../utils/debug.dart';

class TextRich extends StatelessWidget {
  const TextRich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return RichText(
      text: TextSpan(
        style: textTheme.bodyText1,
        children: [
          WidgetSpan(
              alignment: PlaceholderAlignment.baseline,
              baseline: TextBaseline.alphabetic,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 100),
                child: const TextField(),
              )),
          const TextSpan(text: '.'),
          const TextSpan(text: 'Test datda'),
          TextSpan(
            text: "link",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Debug.log("text print");
              },
            style: const TextStyle(color: ColorApp.secondary),
          )
        ],
      ),
    );
  }
}

class TextAlign extends StatelessWidget {
  const TextAlign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Text(
        'asdawd',
        style: TextStyle(fontSize: 15),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class TypographyExample extends StatelessWidget {
  const TypographyExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      children: [
        Text('Test displayLarge', style:textStyle.displayLarge),
          Text('Test displayMedium', style:textStyle.displayMedium),
          Text('Test displaySmall', style:textStyle.displaySmall),
          Text('Test headlineLarge', style:textStyle.headlineLarge),
          Text('Test headlineMedium', style:textStyle.headlineMedium),
          Text('Test headlineSmall', style:textStyle.headlineSmall),
          Text('Test titleLarge', style:textStyle.titleLarge),
          Text('Test titleMedium', style:textStyle.titleMedium),
          Text('Test titleSmall', style:textStyle.titleSmall),
          Text('Test bodyLarge', style:textStyle.bodyLarge),
          Text('Test bodyMedium', style:textStyle.bodyMedium),
          Text('Test bodySmall', style:textStyle.bodySmall),
          Text('Test labelLarge', style:textStyle.labelLarge),
          Text('Test labelMedium', style:textStyle.labelMedium),
          Text('Test labelSmall', style:textStyle.labelSmall),
      ],
    );
  }
}