import 'dart:io';

void main() {
  List<String> tasks = [];
  while (true) {
    print('\n--- To-Do List Menu ---');
    print('1. Add Task');
    print('2. View Tasks');
    print('3. Remove Task');
    print('4. Exit');
    stdout.write('Choose an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // Add Task
        stdout.write('Enter the task: ');
        String? task = stdin.readLineSync();
        if (task != null && task.isNotEmpty) {
          tasks.add(task);
          print('Task added: "$task"');
        } else {
          print('Task cannot be empty.');
        }
        break;

      case '2':
        // View Tasks
        if (tasks.isEmpty) {
          print('No tasks available.');
        } else {
          print('\n--- Your Tasks ---');
          for (int i = 0; i < tasks.length; i++) {
            print('${i + 1}. ${tasks[i]}');
          }
        }
        break;

      case '3':
        // Remove Task
        stdout.write('Enter the task index to remove: ');
        String? indexInput = stdin.readLineSync();
        if (indexInput != null) {
          int index = int.tryParse(indexInput) ?? -1;
          if (index >= 1 && index <= tasks.length) {
            String removedTask = tasks.removeAt(index - 1);
            print('Task removed: "$removedTask"');
          } else {
            print('Invalid index. Please enter a valid task number.');
          }
        }
        break;

      case '4':
        // Exit
        print('Exiting the program.');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}