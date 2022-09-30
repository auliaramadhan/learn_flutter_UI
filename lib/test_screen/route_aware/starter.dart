import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/test_screen/route_aware/autorouter/auto_route_aware.dart';
import 'package:flutter_ui/test_screen/route_aware/autorouter/auto_route_initial.dart';
import 'package:flutter_ui/test_screen/route_aware/normal_route/normal_route.dart';
import 'package:flutter_ui/test_screen/route_aware/autorouter/auto_routes.dart';
import 'package:flutter_ui/widgets/button.dart';

class RouteStarteer extends StatelessWidget {
  const RouteStarteer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ButtonPrimary(
                  text: "AutoRoute",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return AutoRouteScaffold();
                      },
                    ));
                  },
                ),
                ButtonPrimary(
                  text: "normal",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return NormalRouteScaffold();
                      },
                    ));
                  },
                ),
              ],
            )),
      ),
    );
  }
}
