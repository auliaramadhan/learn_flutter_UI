import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/test_screen/route_aware/autorouter/auto_routes.dart';
import '../../../main.dart';
import '../../../utils/routes.dart';
import '../../../widgets/button.dart';

class RouteAwareScreen extends StatefulWidget {
  const RouteAwareScreen({Key? key}) : super(key: key);

  @override
  _RouteObservereScreenState createState() => _RouteObservereScreenState();
}

// normal autorouteAware
// class _RouteObservereScreenState extends State<RouteAwareScreen> with RouteAware {
class _RouteObservereScreenState extends State<RouteAwareScreen> with AutoRouteAware {
  var action = "";
  AutoRouteObserver? _observer;

  // call super only on normal Routeaware

  @override
  void didPush() {
    print('Route Aware: Called didPush');
    setState(() {
      action = "Called didPush";
    });
  }

  @override
  void didPop() {
    print('Route Aware: Called didPop');
    setState(() {
      action = "Called didPop";
    });
  }

  @override
  void didPopNext() {
    print('Route Aware: Called didPopNext');
    setState(() {
      action = "Called didPopNext";
    });
  }

  @override
  void didPushNext() {
    print('Route Aware: Called didPushNext');
    setState(() {
      action = "Called didPushNext";
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _observer?.unsubscribe(this);
    super.dispose();
  }

  @override
  void initState() {
    // ----normal autorouteAware----
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   routeObserver.subscribe(this, ModalRoute.of(context)!);
    // });

    // --- auto route aware-----
    _observer = RouterScope.of(context).firstObserverOfType<AutoRouteObserver>();
    if (_observer != null) {
      // we subscribe to the observer by passing our
      // AutoRouteAware state and the scoped routeData
      _observer!.subscribe(this, context.routeData);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter RouteAware Demo'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("what just happen $action"),
              ButtonPrimary(
                text: 'to screen',
                onPressed: () => AutoRouter.of(context).push(PageNumberRoute(numberpae: 'qwe')),
                // normalRoute
                // onPressed: () => Navigator.of(context).pushNamed(RoutesName.AdvanceScaffold),
              )
            ],
          ),
        ),
      ),
    );
  }
}


