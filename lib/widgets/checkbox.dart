import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({Key? key}) : super(key: key);

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('checkbox only'),
        Checkbox(
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith(getColor),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        const Text('CheckboxListTile'),
        CheckboxListTile(
          title: const Text('Animate Slowly'),
          subtitle: const Text('Just subtite Slowly'),
          selectedTileColor: Colors.blue.shade200 ,
          value: timeDilation != 1.0,
          onChanged: (bool? value) {
            setState(() {
              timeDilation = value! ? 10.0 : 1.0;
            });
          },
          secondary: const Icon(Icons.hourglass_empty),
        )
      ],
    );
  }
}
