/**
 * ADVANCED CLI TOOLS BUILDING PROJECT
 * 
 * PROJECT: Task Manager CLI
 * 
 * FEATURES:
 * 1. Add, remove, list tasks
 * 2. Mark tasks as complete
 * 3. Filter tasks by status
 * 4. Save/load tasks from file
 * 5. Search tasks
 * 6. Task categories
 * 7. Due dates
 * 8. Priority levels
 * 9. Statistics
 * 10. Interactive menu
 * 
 * TECHNOLOGIES USED:
 * - dart:io for I/O operations
 * - File handling for persistence
 * - Command-line argument parsing
 * - Interactive prompts
 * - Error handling
 * - Async operations
 */

import 'dart:io';
import 'dart:convert';

void main() async {
  print('=== ADVANCED CLI TASK MANAGER ===\n');
  
  TaskManager taskManager = TaskManager();
  await taskManager.loadTasks();
  
  // Interactive menu
  await taskManager.run();
}

/**
 * Task model
 */
class Task {
  final String id;
  final String title;
  final String description;
  final String category;
  final Priority priority;
  final DateTime? dueDate;
  bool isCompleted;
  final DateTime createdAt;
  
  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.priority,
    this.dueDate,
    this.isCompleted = false,
    required this.createdAt,
  });
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'category': category,
    'priority': priority.toString().split('.').last,
    'dueDate': dueDate?.toIso8601String(),
    'isCompleted': isCompleted,
    'createdAt': createdAt.toIso8601String(),
  };
  
  factory Task.fromJson(Map<String, dynamic> json) => Task(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    category: json['category'],
    priority: Priority.values.firstWhere(
      (p) => p.toString().split('.').last == json['priority'],
      orElse: () => Priority.medium,
    ),
    dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
    isCompleted: json['isCompleted'] ?? false,
    createdAt: DateTime.parse(json['createdAt']),
  );
  
  String get status => isCompleted ? '✓' : '○';
  String get prioritySymbol {
    switch (priority) {
      case Priority.low:
        return '🟢';
      case Priority.medium:
        return '🟡';
      case Priority.high:
        return '🔴';
    }
  }
  
  bool isOverdue() {
    if (dueDate == null || isCompleted) return false;
    return DateTime.now().isAfter(dueDate!);
  }
}

enum Priority { low, medium, high }

/**
 * Task Manager
 */
class TaskManager {
  final List<Task> _tasks = [];
  final String _dataFile = 'tasks.json';
  
  Future<void> loadTasks() async {
    try {
      File file = File(_dataFile);
      if (await file.exists()) {
        String content = await file.readAsString();
        List<dynamic> jsonList = jsonDecode(content);
        _tasks.clear();
        _tasks.addAll(jsonList.map((json) => Task.fromJson(json)));
        print('Loaded ${_tasks.length} tasks from file.\n');
      }
    } catch (e) {
      print('Error loading tasks: $e\n');
    }
  }
  
  Future<void> saveTasks() async {
    try {
      File file = File(_dataFile);
      List<Map<String, dynamic>> jsonList = _tasks.map((t) => t.toJson()).toList();
      await file.writeAsString(jsonEncode(jsonList));
    } catch (e) {
      print('Error saving tasks: $e');
    }
  }
  
  Future<void> run() async {
    while (true) {
      printMenu();
      String? choice = stdin.readLineSync();
      
      switch (choice) {
        case '1':
          await addTask();
          break;
        case '2':
          listTasks();
          break;
        case '3':
          await completeTask();
          break;
        case '4':
          await removeTask();
          break;
        case '5':
          filterTasks();
          break;
        case '6':
          searchTasks();
          break;
        case '7':
          showStatistics();
          break;
        case '8':
          await saveTasks();
          print('Tasks saved successfully!\n');
          break;
        case '9':
          await saveTasks();
          print('Goodbye!');
          exit(0);
        default:
          print('Invalid choice. Please try again.\n');
      }
    }
  }
  
  void printMenu() {
    print('''
╔══════════════════════════════════════╗
║        TASK MANAGER MENU            ║
╠══════════════════════════════════════╣
║  1. Add Task                         ║
║  2. List Tasks                       ║
║  3. Complete Task                    ║
║  4. Remove Task                      ║
║  5. Filter Tasks                     ║
║  6. Search Tasks                     ║
║  7. Statistics                       ║
║  8. Save Tasks                       ║
║  9. Exit                             ║
╚══════════════════════════════════════╝
''');
    stdout.write('Enter your choice: ');
  }
  
  Future<void> addTask() async {
    print('\n--- Add New Task ---');
    
    stdout.write('Title: ');
    String? title = stdin.readLineSync();
    if (title == null || title.isEmpty) {
      print('Title cannot be empty.\n');
      return;
    }
    
    stdout.write('Description: ');
    String? description = stdin.readLineSync() ?? '';
    
    stdout.write('Category: ');
    String? category = stdin.readLineSync() ?? 'General';
    
    print('Priority (1=Low, 2=Medium, 3=High): ');
    String? priorityInput = stdin.readLineSync();
    Priority priority = Priority.medium;
    if (priorityInput == '1') priority = Priority.low;
    else if (priorityInput == '3') priority = Priority.high;
    
    stdout.write('Due date (YYYY-MM-DD) or press Enter: ');
    String? dueDateInput = stdin.readLineSync();
    DateTime? dueDate;
    if (dueDateInput != null && dueDateInput.isNotEmpty) {
      try {
        dueDate = DateTime.parse(dueDateInput);
      } catch (e) {
        print('Invalid date format. Task added without due date.\n');
      }
    }
    
    Task task = Task(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      category: category,
      priority: priority,
      dueDate: dueDate,
      createdAt: DateTime.now(),
    );
    
    _tasks.add(task);
    print('Task added successfully!\n');
  }
  
  void listTasks() {
    if (_tasks.isEmpty) {
      print('No tasks found.\n');
      return;
    }
    
    print('\n--- All Tasks ---');
    print('${'ID'.padRight(5)} ${'Status'.padRight(3)} ${'Priority'.padRight(3)} ${'Category'.padRight(15)} ${'Title'.padRight(30)} Due Date');
    print('─' * 100);
    
    for (var task in _tasks) {
      String dueDateStr = task.dueDate != null
          ? task.dueDate!.toString().split(' ')[0]
          : 'No date';
      String overdue = task.isOverdue() ? ' ⚠ OVERDUE' : '';
      
      print('${task.id.substring(0, 5).padRight(5)} '
          '${task.status.padRight(3)} '
          '${task.prioritySymbol.padRight(3)} '
          '${task.category.padRight(15)} '
          '${task.title.padRight(30)} '
          '$dueDateStr$overdue');
    }
    print('');
  }
  
  Future<void> completeTask() async {
    if (_tasks.isEmpty) {
      print('No tasks to complete.\n');
      return;
    }
    
    print('\n--- Complete Task ---');
    listTasks();
    stdout.write('Enter task ID: ');
    String? id = stdin.readLineSync();
    
    Task? task = _tasks.firstWhere(
      (t) => t.id == id,
      orElse: () => throw Exception('Task not found'),
    );
    
    if (task.isCompleted) {
      print('Task is already completed.\n');
      return;
    }
    
    task.isCompleted = true;
    print('Task marked as complete!\n');
  }
  
  Future<void> removeTask() async {
    if (_tasks.isEmpty) {
      print('No tasks to remove.\n');
      return;
    }
    
    print('\n--- Remove Task ---');
    listTasks();
    stdout.write('Enter task ID: ');
    String? id = stdin.readLineSync();
    
    int removedCount = _tasks.length;
    _tasks.removeWhere((t) => t.id == id);
    bool removed = removedCount > _tasks.length;
    
    if (removed) {
      print('Task removed successfully!\n');
    } else {
      print('Task not found.\n');
    }
  }
  
  void filterTasks() {
    print('\n--- Filter Tasks ---');
    print('1. All tasks');
    print('2. Completed tasks');
    print('3. Pending tasks');
    print('4. By category');
    print('5. By priority');
    print('6. Overdue tasks');
    stdout.write('Enter choice: ');
    String? choice = stdin.readLineSync();
    
    List<Task> filtered = [];
    
    switch (choice) {
      case '1':
        filtered = _tasks;
        break;
      case '2':
        filtered = _tasks.where((t) => t.isCompleted).toList();
        break;
      case '3':
        filtered = _tasks.where((t) => !t.isCompleted).toList();
        break;
      case '4':
        stdout.write('Enter category: ');
        String? category = stdin.readLineSync();
        filtered = _tasks.where((t) => t.category == category).toList();
        break;
      case '5':
        print('Priority (1=Low, 2=Medium, 3=High): ');
        String? priorityInput = stdin.readLineSync();
        Priority? priority;
        if (priorityInput == '1') priority = Priority.low;
        else if (priorityInput == '2') priority = Priority.medium;
        else if (priorityInput == '3') priority = Priority.high;
        if (priority != null) {
          filtered = _tasks.where((t) => t.priority == priority).toList();
        }
        break;
      case '6':
        filtered = _tasks.where((t) => t.isOverdue()).toList();
        break;
      default:
        print('Invalid choice.\n');
        return;
    }
    
    if (filtered.isEmpty) {
      print('No tasks found.\n');
      return;
    }
    
    print('\n--- Filtered Tasks ---');
    for (var task in filtered) {
      print('${task.status} ${task.prioritySymbol} [${task.category}] ${task.title}');
      if (task.description.isNotEmpty) {
        print('   ${task.description}');
      }
    }
    print('');
  }
  
  void searchTasks() {
    stdout.write('\nEnter search term: ');
    String? term = stdin.readLineSync();
    
    if (term == null || term.isEmpty) {
      print('Search term cannot be empty.\n');
      return;
    }
    
    List<Task> results = _tasks.where((task) {
      return task.title.toLowerCase().contains(term.toLowerCase()) ||
          task.description.toLowerCase().contains(term.toLowerCase()) ||
          task.category.toLowerCase().contains(term.toLowerCase());
    }).toList();
    
    if (results.isEmpty) {
      print('No tasks found matching "$term".\n');
      return;
    }
    
    print('\n--- Search Results ---');
    for (var task in results) {
      print('${task.status} ${task.prioritySymbol} [${task.category}] ${task.title}');
      print('   ${task.description}');
    }
    print('');
  }
  
  void showStatistics() {
    if (_tasks.isEmpty) {
      print('No tasks to analyze.\n');
      return;
    }
    
    int total = _tasks.length;
    int completed = _tasks.where((t) => t.isCompleted).length;
    int pending = total - completed;
    int overdue = _tasks.where((t) => t.isOverdue()).length;
    
    Map<String, int> categoryCount = {};
    Map<Priority, int> priorityCount = {};
    
    for (var task in _tasks) {
      categoryCount[task.category] = (categoryCount[task.category] ?? 0) + 1;
      priorityCount[task.priority] = (priorityCount[task.priority] ?? 0) + 1;
    }
    
    print('\n--- Statistics ---');
    print('Total tasks: $total');
    print('Completed: $completed (${(completed / total * 100).toStringAsFixed(1)}%)');
    print('Pending: $pending (${(pending / total * 100).toStringAsFixed(1)}%)');
    print('Overdue: $overdue');
    print('\nBy Category:');
    categoryCount.forEach((category, count) {
      print('  $category: $count');
    });
    print('\nBy Priority:');
    priorityCount.forEach((priority, count) {
      print('  ${priority.toString().split('.').last}: $count');
    });
    print('');
  }
}

