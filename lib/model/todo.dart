import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

class ToDo {
  String id; // Unique identifier for the todo item
  String todoText; // Text content of the todo item
  bool isDone; // Completion status of the todo item (true if completed, false otherwise)
  DateTime? deadline; // Deadline for the task
  bool isRepetitive; // Flag to indicate if the task should repeat
  TaskPriority priority; // Priority level of the task

  // Constructor for the ToDo class, with required parameters for id and todoText, // an optional parameters for isDone and isRepetitive with default values of false as well as optional paramaters for deadline and priority 
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
    this.deadline,
    this.isRepetitive = false,
    this.priority = TaskPriority.medium,
  });

  // Define a method to schedule task notification using flutter_local_notifications
  Future<void> scheduleTaskNotification() async {
    if (deadline != null) {
      var androidDetails = AndroidNotificationDetails(
        'channelId',
        'channelName',
        'channelDescription',
        priority: Priority.high,
        importance: Importance.max,
      );
      var iOSDetails = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
        android: androidDetails,
        iOS: iOSDetails,
      );

      await FlutterLocalNotificationsPlugin().schedule(
        int.parse(id), // Notification ID (assuming unique task ID)
        'Task Reminder',
        todoText,
        deadline!,
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
      );
    }
  }

  // Static method to create a custom ToDo item
  static ToDo createCustomTask(String id, String todoText, DateTime? deadline, bool isRepetitive) {
    return ToDo(
      id: id,
      todoText: todoText,
      deadline: deadline,
      isRepetitive: isRepetitive,
    );
  }

  // Method to update task completion status
  void toggleDone() {
    isDone = !isDone;
  }
}

// Enum to represent task priority levels
enum TaskPriority {
  low,
  medium,
  high,
}
