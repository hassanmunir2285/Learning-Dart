/**
 * INTERMEDIATE PROJECT
 * 
 * This project demonstrates intermediate Dart concepts:
 * - Null Safety
 * - Error Handling
 * - File Operations
 * - Classes and Objects
 * - Collections
 * - Functions
 * 
 * PROJECT: TODO LIST MANAGER
 * 
 * Features:
 * 1. Add tasks
 * 2. View all tasks
 * 3. Mark tasks as complete
 * 4. Delete tasks
 * 5. Filter tasks (all, active, completed)
 * 6. Save/Load tasks from file
 * 7. Search tasks
 * 
 * This project uses:
 * - Classes for Task and TodoManager
 * - File handling for persistence
 * - Error handling for robustness
 * - Collections for data management
 */

import 'dart:io';
import 'dart:convert';

void main() {
  print('=== TODO LIST MANAGER ===\n');
  
  TodoManager manager = TodoManager();
  manager.loadTasks();
  
  while (true) {
    print('\n--- MENU ---');
    print('1. Add Task  2. View All  3. Complete Task');
    print('4. Delete Task  5. Search  6. Statistics  7. Exit');
    
    stdout.write('\nChoice: ');
    String? choice = stdin.readLineSync();
    
    switch (choice) {
      case '1': addTask(manager); break;
      case '2': viewAllTasks(manager); break;
      case '3': markTaskComplete(manager); break;
      case '4': deleteTask(manager); break;
      case '5': searchTasks(manager); break;
      case '6': showStatistics(manager); break;
      case '7':
        manager.saveTasks();
        print('Goodbye!');
        exit(0);
      default: print('Invalid choice!');
    }
  }
}

/**
 * Add a new task
 */
void addTask(TodoManager manager) {
  print('\n--- Add Task ---');
  stdout.write('Enter task description: ');
  String? description = stdin.readLineSync();
  
  if (description != null && description.trim().isNotEmpty) {
    Task task = Task(description.trim());
    manager.addTask(task);
    print('Task added successfully!');
  } else {
    print('Task description cannot be empty!');
  }
}

/**
 * View all tasks
 */
void viewAllTasks(TodoManager manager) {
  print('\n--- All Tasks ---');
  List<Task> tasks = manager.getAllTasks();
  
  if (tasks.isEmpty) {
    print('No tasks found.');
  } else {
    print('Total tasks: ${tasks.length}\n');
    for (int i = 0; i < tasks.length; i++) {
      print('${i + 1}. ${tasks[i]}');
    }
  }
}


/**
 * Mark task as complete
 */
void markTaskComplete(TodoManager manager) {
  List<Task> tasks = manager.getActiveTasks();
  if (tasks.isEmpty) {
    print('No active tasks.');
    return;
  }
  
  viewAllTasks(manager);
  stdout.write('Enter task number: ');
  String? input = stdin.readLineSync();
  
  try {
    int index = int.parse(input ?? '0') - 1;
    if (index >= 0 && index < tasks.length) {
      manager.completeTask(tasks[index].id);
      print('Task completed!');
    }
  } catch (e) {
    print('Invalid input!');
  }
}

/**
 * Delete a task
 */
void deleteTask(TodoManager manager) {
  List<Task> tasks = manager.getAllTasks();
  if (tasks.isEmpty) {
    print('No tasks.');
    return;
  }
  
  viewAllTasks(manager);
  stdout.write('Enter task number: ');
  try {
    int index = int.parse(stdin.readLineSync() ?? '0') - 1;
    if (index >= 0 && index < tasks.length) {
      manager.deleteTask(tasks[index].id);
      print('Task deleted!');
    }
  } catch (e) {
    print('Invalid input!');
  }
}

/**
 * Search tasks
 */
void searchTasks(TodoManager manager) {
  stdout.write('Search term: ');
  String? term = stdin.readLineSync();
  if (term != null && term.trim().isNotEmpty) {
    List<Task> results = manager.searchTasks(term.trim());
    if (results.isEmpty) {
      print('No tasks found.');
    } else {
      print('Found ${results.length} task(s):');
      for (Task task in results) print('  - $task');
    }
  }
}

/**
 * Show statistics
 */
void showStatistics(TodoManager manager) {
  List<Task> all = manager.getAllTasks();
  List<Task> active = manager.getActiveTasks();
  List<Task> completed = manager.getCompletedTasks();
  print('Total: ${all.length}, Active: ${active.length}, Completed: ${completed.length}');
  if (all.isNotEmpty) {
    print('Completion: ${(completed.length / all.length * 100).toStringAsFixed(1)}%');
  }
}

/**
 * TASK CLASS
 * Represents a single task
 */
class Task {
  final String id;
  final String description;
  bool isCompleted;
  final DateTime createdAt;
  DateTime? completedAt;
  
  Task(this.description)
      : id = DateTime.now().millisecondsSinceEpoch.toString(),
        isCompleted = false,
        createdAt = DateTime.now();
  
  // Named constructor from JSON
  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        description = json['description'],
        isCompleted = json['isCompleted'],
        createdAt = DateTime.parse(json['createdAt']),
        completedAt = json['completedAt'] != null
            ? DateTime.parse(json['completedAt'])
            : null;
  
  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'isCompleted': isCompleted,
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
    };
  }
  
  // Mark as complete
  void complete() {
    isCompleted = true;
    completedAt = DateTime.now();
  }
  
  @override
  String toString() {
    String status = isCompleted ? '[✓]' : '[ ]';
    String date = createdAt.toString().substring(0, 10);
    return '$status $description (Created: $date)';
  }
}

/**
 * TODO MANAGER CLASS
 * Manages collection of tasks
 */
class TodoManager {
  List<Task> _tasks = [];
  final String _filename = 'tasks.json';
  
  /**
   * Add a task
   */
  void addTask(Task task) {
    _tasks.add(task);
  }
  
  /**
   * Get all tasks
   */
  List<Task> getAllTasks() {
    return List.from(_tasks);
  }
  
  List<Task> getActiveTasks() => _tasks.where((task) => !task.isCompleted).toList();
  List<Task> getCompletedTasks() => _tasks.where((task) => task.isCompleted).toList();
  
  bool completeTask(String id) {
    try {
      _tasks.firstWhere((t) => t.id == id).complete();
      return true;
    } catch (e) {
      return false;
    }
  }
  
  bool deleteTask(String id) {
    try {
      _tasks.removeWhere((task) => task.id == id);
      return true;
    } catch (e) {
      return false;
    }
  }
  
  List<Task> searchTasks(String searchTerm) {
    return _tasks.where((task) => task.description.toLowerCase().contains(searchTerm.toLowerCase())).toList();
  }
  
  void saveTasks() {
    try {
      File(_filename).writeAsStringSync(jsonEncode(_tasks.map((t) => t.toJson()).toList()));
      print('Tasks saved.');
    } catch (e) {
      print('Error saving: $e');
    }
  }
  
  void loadTasks() {
    try {
      File file = File(_filename);
      if (file.existsSync()) {
        _tasks = (jsonDecode(file.readAsStringSync()) as List).map((json) => Task.fromJson(json)).toList();
        print('Loaded ${_tasks.length} tasks.');
      }
    } catch (e) {
      _tasks = [];
    }
  }
  
}

