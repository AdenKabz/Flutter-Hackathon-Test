Task Management To-Do List App

Overview:

This task management to-do list app allows users to organize their tasks, set deadlines, and track completion status. Users can add, edit, and delete tasks, as well as view them based on different categories (all, completed, pending).

Features

Task List: Display a list of tasks with their descriptions.

Task Completion: Mark tasks as completed or pending.

Deadline: Set deadlines for tasks.

Priority: Assign priority levels (low, medium, high) to tasks.

Add New Task: Easily add new tasks to the list.

Delete Task: Remove tasks when no longer needed.


Installation:

Clone this repository to your local machine.

Ensure you have Flutter and Dart installed.

Run flutter pub get to install dependencies.

Launch the app using flutter run.

Usage:

Open the app.

View the list of tasks.

Tap on a task to mark it as completed or pending.

Add new tasks using the “+” button.

Swipe left on a task to delete it.

Code Structure

lib/: Contains the main Dart code.

model/todo.dart: Defines the ToDo class for task management.

widgets/todo_item.dart: Displays individual task items.

screens/tasks_screen.dart: Main screen with task list and category filters.

Dependencies
flutter_local_notifications: Used for task reminders.
intl: For date formatting.
