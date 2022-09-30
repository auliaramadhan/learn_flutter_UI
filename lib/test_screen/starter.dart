import 'package:flutter/material.dart';
import 'package:flutter_ui/test_screen/route_aware/starter.dart';
import 'package:flutter_ui/test_screen/scaffold_advanced.dart';
import 'package:flutter_ui/test_screen/widget_basic.dart';
import 'package:flutter_ui/test_screen/widget_basic2.dart';
import 'package:flutter_ui/widgets/button.dart';

class StarterWidget extends StatefulWidget {
  const StarterWidget({Key? key}) : super(key: key);

  @override
  State<StarterWidget> createState() => _StarterWidgetState();
}

class _StarterWidgetState extends State<StarterWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ButtonPrimary(
                text: "WidgetBasic",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return WidgetBasicScreen();
                    },
                  ));
                },
              ),
              ButtonPrimary(
                text: "WidgetBasic2",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return WidgetBasic2Screen();
                    },
                  ));
                },
              ),
              ButtonPrimary(
                text: "AdvanceScaffoldScreen",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return AdvanceScaffoldScreen();
                    },
                  ));
                },
              ),
              ButtonPrimary(
                text: "ROUTE Starter",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return RouteStarteer();
                    },
                  ));
                },
              ),
            ],
          )),
    );
  }
}
