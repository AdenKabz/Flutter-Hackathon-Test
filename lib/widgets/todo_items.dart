import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import date formatting utilities
import 'package:todolist/model/todo.dart'; // Import the ToDo model class

class ToDoItem extends StatelessWidget {
  final ToDo todo; // The ToDo object associated with this item
  final Function(ToDo) onToDoChanged; // Callback function for task completion status change
  final Function(String) onDeleteItem; // Callback function for task deletion

  //constructor for ToDoItem taking the required paramaters
  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20), //setting margin for ListTile Container
      child: ListTile(
        onTap: () {
          onToDoChanged(todo); // Invoke the callback function when the item is tapped
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        tileColor: todo.isDone ? Colors.grey[300] : Colors.white, // Set tile color based on task completion
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (newValue) {
            // Toggle task completion status
            ToDo updatedToDo = todo.copyWith(isDone: newValue ?? false); // Create a copy of the task with updated completion status
            onToDoChanged(updatedToDo); // Invoke the callback function with the updated task
          },
          activeColor: Colors.blue, // Set color of the checkbox when checked
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.todoText, // Display the task text
              style: TextStyle(
                fontSize: 16,
                color: todo.isDone ? Colors.grey : Colors.black, // Set text color based on task completion
                decoration: todo.isDone ? TextDecoration.lineThrough : null, // Apply strikethrough decoration if task is completed
              ),
            ),
            if (todo.deadline != null)
              Text(
                'Deadline: ${DateFormat('MMM dd, yyyy').format(todo.deadline!)}', // Display task deadline if set
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                ),
              ),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            onDeleteItem(todo.id); // Invoke the callback function to delete the task
          },
          icon: Icon(
            Icons.delete,
            size: 24,
            color: Colors.red, // Set icon color to red
          ),
        ),
      ),
    );
  }
}
