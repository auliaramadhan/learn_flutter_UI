import 'package:flutter/material.dart';
import 'package:flutter_ui/state_management/todo/todo_model.dart';

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
      secondaryBackground: Container(
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