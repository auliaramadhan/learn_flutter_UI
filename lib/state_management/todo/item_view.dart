import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/button.dart';
import '../item_list_provider.dart';
import './todo_model.dart';
import 'package:provider/provider.dart';

class ItemView extends StatefulWidget {
  final Todo? item;

  const ItemView({this.item});

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    if (widget.item != null) _textEditingController.text = widget.item!.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _textEditingController,
              onFieldSubmitted: (value) => submit(),
              textCapitalization: TextCapitalization.sentences,
              autofocus: true,
            ),
            SizedBox(height: 10),
            ButtonPrimary(
              text: 'Submit',
              onPressed: submit,
            )
          ],
        ),
      ),
    );
  }

  void submit() {
    String description = _textEditingController.text;
    if (description != null && description.isNotEmpty) {
      if (widget.item != null) {
        context.read<TodoProvider>().editTask(widget.item!, description);
      } else {
        context.read<TodoProvider>().addNewTask(description);
      }
      Navigator.pop(context, _textEditingController.text);
    }
  }
}
