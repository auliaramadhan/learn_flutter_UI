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
    return Theme(
      data: ThemeData(
          textTheme: const TextTheme(
        //  displayLarge = displayLarge ?? headline1,
        headline1: TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
        //  displayMedium = displayMedium ?? headline2,
        headline2: TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
        //  displaySmall = displaySmall ?? headline3,
        headline3: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
        //  headlineMedium = headlineMedium ?? headline4,
        headline4: TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        //  headlineSmall = headlineSmall ?? headline5,
        headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        //  titleLarge = titleLarge ?? headline6,
        headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
        //  titleMedium = titleMedium ?? subtitle1,
        subtitle1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
        //  titleSmall = titleSmall ?? subtitle2,
        subtitle2: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
        //  bodyLarge = bodyLarge ?? bodyText1,
        bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
        //  bodyMedium = bodyMedium ?? bodyText2,
        bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
        //  bodySmall = bodySmall ?? caption,
        button: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
        //  labelLarge = labelLarge ?? button,
        caption: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
        //  labelSmall = labelSmall ?? overline;
        overline: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
      )),
      child: Column(
        children: [
          Text('Test displayLarge', style: textStyle.displayLarge),
          Text('Test displayMedium', style: textStyle.displayMedium),
          Text('Test displaySmall', style: textStyle.displaySmall),
          Text('Test headlineLarge', style: textStyle.headlineLarge),
          Text('Test headlineMedium', style: textStyle.headlineMedium),
          Text('Test headlineSmall', style: textStyle.headlineSmall),
          Text('Test titleLarge', style: textStyle.titleLarge),
          Text('Test titleMedium', style: textStyle.titleMedium),
          Text('Test titleSmall', style: textStyle.titleSmall),
          Text('Test bodyLarge', style: textStyle.bodyLarge),
          Text('Test bodyMedium', style: textStyle.bodyMedium),
          Text('Test bodySmall', style: textStyle.bodySmall),
          Text('Test labelLarge', style: textStyle.labelLarge),
          Text('Test labelMedium', style: textStyle.labelMedium),
          Text('Test labelSmall', style: textStyle.labelSmall),
        ],
      ),
    );
  }
}
