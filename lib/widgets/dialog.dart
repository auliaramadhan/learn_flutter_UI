import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/colors.dart';
import 'package:flutter_ui/widgets/button.dart';

class CustomDialog extends StatefulWidget {
  CustomDialog({Key? key}) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ButtonText(
            onPressed: () => _showDialogBasic(context),
            text: 'show dialog basic',
            // onPressed: () => _showDialogBasic(context),
          ),
          ButtonText(
            onPressed: () => _showDialogAlert(context),
            text: 'show dialog alert',
            // onPressed: () => _showDialogBasic(context),
          ),
          ButtonText(
            onPressed: () => _showDialogWithSetState(context),
            text: 'show dialog with setstate',
            // onPressed: () => _showDialogBasic(context),
          ),
          ButtonText(
            onPressed: () => _showDialogBottom(context),
            text: 'show dialog modal bottom sheet',
            // onPressed: () => _showDialogBasic(context),
          ),
        ],
      ),
    );
  }

  _showDialogBasic(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: Container(
            child: Column(
          children: [Text('Hey this is simple basic dialog')],
        )),
      ),
    );
  }

  _showDialogWithSetState(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        child: StatefulBuilder(
          builder: (context, setState) => Container(
            child: Column(
              children: [
                Text('Hey this is simple basic dialog'),
                Switch.adaptive(
                  onChanged: (value) {
                    setState(() {
                      isSwitch = value;
                    });
                  },
                  value: isSwitch,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showDialogBottom(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey.withOpacity(0.4),
      barrierColor: ColorApp.divider,
      elevation: 5,
      isScrollControlled: true,
      // routeSettings: ,
      clipBehavior: Clip.antiAlias,
      enableDrag: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) => Container(
          child: Column(
        children: [
          const Text('Hey this is modal bottom sheet'),
          ButtonPrimary(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: 'close')
        ],
      )),
    );
  }

  _showDialogAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        content: Text('Hey this is simple basic dialog'),
        actions: [
          ButtonPrimary(onPressed: () => Navigator.of(context).pop(), text: 'submit'),
          ButtonText(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            text: 'cancel',
          )
        ],
        actionsAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
