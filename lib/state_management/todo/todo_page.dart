import 'dart:ui';
import 'package:flutter/material.dart';
import '../item_list_provider.dart';
import './item_view.dart';
import './todo_model.dart';
import 'package:provider/provider.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({Key? key}) : super(key: key);

  final provider  = StateProvider();

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
      body: ChangeNotifierProvider(
        create: (_) => provider,
        child: TodoPage(),
      ),
    );
  }

  void goToNewItemView(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (_) {
          return ChangeNotifierProvider.value(
            value: provider,
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
  @override
  Widget build(BuildContext context) {
    return Consumer<StateProvider>(
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
          return ChangeNotifierProvider.value(
            value: context.read<StateProvider>(),
            child: ItemView(item: item),
          );
        });
  }
}

class TodoItem extends StatelessWidget {
  final Todo item;
  final Function(Todo) onTap;
  final Function(Todo) onLongPress;
  final Function(Todo) onDismissed;

  TodoItem({required this.item, required this.onTap, required this.onDismissed, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.hashCode.toString()),
      direction: DismissDirection.horizontal,
      background: Container(
        padding: EdgeInsets.only(left: 12),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerLeft,
      ),
      secondaryBackground:Container(
        padding: EdgeInsets.only(right: 12),
        color: Colors.green,
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
      ),
      
      onDismissed: (direction) {
          onDismissed(item);
        /* if (DismissDirection.startToEnd == direction) {
          onDismissed(item);
        }else if(DismissDirection.endToStart == direction){
          onLongPress(item);
          print('adasas');
        } */
      },
      child: ListTile(
        title: Text(
          item.description,
          style: TextStyle(decoration: item.complete ? TextDecoration.lineThrough : null),
        ),
        trailing: Icon(item.complete ? Icons.check_box : Icons.check_box_outline_blank),
        onTap: () => onTap(item),
        onLongPress: () => onLongPress(item),
      ),
    );
  }
}
