import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as river;
import 'package:flutter_ui/state_management/todo/todo_items.dart';
import '../item_list_provider.dart';
import './item_view.dart';
import './todo_model.dart';
import 'package:provider/provider.dart' as prov;
import 'package:state_notifier/state_notifier.dart' as stateNotif;

class TodoScreen extends StatelessWidget {
  TodoScreen({Key? key}) : super(key: key);

  final provider = TodoProvider();
  final providerValue = TodoProviderValue();
  final providerState = TodoProviderState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => goToNewItemView(context),
      ),
      // body: prov.ChangeNotifierProvider(
      //   create: (_) => provider,
      //   child: TodoPage(),
      // ),
      body: prov.Provider(
        create: (_) => providerValue,
        child: TodoPage(),
      ),
    );
  }

  void goToNewItemView(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (_) {
          // return prov.ChangeNotifierProvider.value(
          //   value: provider,
          //   child: ItemView(),
          // );
          return prov.ValueListenableProvider.value(
            value: providerValue,
            child: ItemView(),
          );
        });
  }
}

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  late final TodoProvider myNotifier;

    void listener() {
      // Do something
      print(myNotifier.items.length);
    }
  @override
  void initState() {
    super.initState();
    myNotifier = context.read<TodoProvider>();
    myNotifier.addListener(listener);
  }

  @override
  void dispose() {
    myNotifier.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return prov.Consumer<TodoProvider>(
      builder: (context, value, child) {
        return value.items.isEmpty
            ? Text("empty")
            : ListView.builder(
                itemBuilder: (context, index) => TodoItem(
                  item: value.items[index],
                  onTap: value.chanceCompleteness,
                  onDismissed: value.removeItem,
                  onLongPress: (todo) => goToEditItemView(context, todo),
                ),
                itemCount: value.items.length,
              );
      },
    );
  }

  // Navigation
  void goToEditItemView(BuildContext ctx, Todo item) {
    showDialog(
        context: ctx,
        builder: (_) {
          return prov.ChangeNotifierProvider.value(
            value: context.read<TodoProvider>(),
            child: ItemView(item: item),
          );
        });
  }
}
