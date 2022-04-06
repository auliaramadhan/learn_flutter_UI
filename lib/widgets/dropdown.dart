import 'package:flutter/material.dart';
import 'package:flutter_ui/extends_utility/utils.dart';
import 'package:flutter_ui/style.dart';

class DropdownExample extends StatefulWidget {
  DropdownExample({Key? key}) : super(key: key);

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  final genderCtrl = TextEditingController();
  var _currencies = ["Food", "Transport", "Personal", "Shopping", "Medical", "Rent", "Movie", "Salary"];
  String? _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: genderCtrl,
          decoration: AppStyle.inputTextBorder.copyWith(
              hintText: 'Pilih Jenis Kelamin',
              suffixIcon: PopupMenuButton(
                icon: const Icon(Icons.arrow_drop_down_outlined),
                // icon: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_drop_down_outlined)),
                onSelected: (String value) {
                  genderCtrl.text = value;
                },
                itemBuilder: (BuildContext context) {
                  return ['Pria', 'Wanita'].map<PopupMenuItem<String>>((String value) {
                    return PopupMenuItem(child: Text(value), value: value);
                  }).toList();
                },
              )),
        ),
        FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(hintText: 'Please select expense', border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
              isEmpty: (_currentSelectedValue ?? "").isEmpty,
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _currentSelectedValue,
                  isDense: true,
                  onChanged: ( newValue) {
                    setState(() {
                      _currentSelectedValue = newValue!;
                      state.didChange(newValue);
                    });
                  },
                  items: _currencies.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
