import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/extends_utility/stream_build.dart';
import 'package:flutter_ui/extends_utility/transform.dart';
import 'package:flutter_ui/images.dart';
import 'package:flutter_ui/test_screen/route_aware/autorouter/auto_routes.dart';
import 'package:flutter_ui/widgets/inkwell.dart';
import '../utils/routes.dart';
import '../widgets/TextForm.dart';
import '../widgets/button.dart';
import '../widgets/loader.dart';
import '../widgets/spacing.dart';
import '../widgets/text.dart';

class WidgetBasicScreen extends StatelessWidget {
  const WidgetBasicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Basic aja')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ButtonPrimary(text: "Primary", onPressed: () {}),
            const ExtraHeight(),
            ButtonPrimary(onPressed: () {}, text: "Primary", icon: const Icon(Icons.ac_unit_rounded)),
            const ExtraHeight(),
            ButtonText(onPressed: () {}, text: "Text"),
            const ExtraHeight(),
            ButtonText(onPressed: () {}, text: "Text", icon: const Icon(Icons.ac_unit_rounded)),
            const ExtraHeight(),
            ButtonBorder(onPressed: () {}, text: "Outlined"),
            const ExtraHeight(),
            ButtonBorder(onPressed: () {}, text: "Outlined", icon: const Icon(Icons.ac_unit_rounded)),
            const ExtraHeight(),
            const CircleLoading(),
            const ExtraHeight(),
            const TextRich(),
            const ExtraHeight(),
            // TextAlign(),
            const Text('data'),
            const ExtraHeight(),
            ButtonPrimary(
              onPressed: () {
                
                // context.router.push(const RouteAwareRoute());
              },
              text: "Go to Aware",
            ),

            InkwellCustom(
                onTap: () {},
                child: (istap) => Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, color: istap ? Colors.white : Colors.orange),
                        Text('Icons.star', style: TextStyle(color: istap ? Colors.white : Colors.orange)),
                      ],
                    )),

            const ExtraHeight(),
            FormData(),
            TransformExample(),
            // MovingCardWidget(urlFront: ImageNetworks.frontCard, urlBack: ImageNetworks.frontCard),
            StreamExample(),
            // const ExtraHeight(),
            // KeyboardDismiss()
          ],
        ),
      ),
    );
  }
}
