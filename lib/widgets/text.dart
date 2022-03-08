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
