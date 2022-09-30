import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/button.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class NormalRouteScaffold extends StatelessWidget {
  const NormalRouteScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (navigatorKey.currentState!.canPop()) {
          navigatorKey.currentState!.pop();
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: MaterialApp(
          navigatorKey: navigatorKey,
          home: PageInitialScreen(),
        ),
      ),
    );
  }
}

class PageInitialScreen extends StatelessWidget {
  const PageInitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('initial route'),
            Text('initial route'),
            ButtonPrimary(
              text: "normal",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageNumberScreen('asdas')));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PageNumberScreen extends StatelessWidget {
  final String numberpae;

  const PageNumberScreen(
    this.numberpae, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('page number $numberpae'),
      ),
    );
  }
}
