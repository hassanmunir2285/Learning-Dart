/**
 * MODERN DART PROJECT
 * 
 * PROJECT: Task Management System
 * 
 * This project demonstrates modern Dart 3 features:
 * - Records for data structures
 * - Pattern matching for state handling
 * - Sealed classes for type safety
 * - Enhanced switch expressions
 * - Class modifiers for API design
 * 
 * FEATURES:
 * 1. Task creation and management
 * 2. State management with sealed classes
 * 3. Pattern matching for UI rendering
 * 4. Records for data transfer
 * 5. Type-safe error handling
 */

void main() {
  print('=== MODERN DART TASK MANAGEMENT SYSTEM ===\n');
  
  TaskManager taskManager = TaskManager();
  
  // Add tasks
  taskManager.addTask('Learn Dart 3', Priority.high);
  taskManager.addTask('Build project', Priority.medium);
  taskManager.addTask('Write tests', Priority.low);
  
  // Display tasks
  taskManager.displayTasks();
  
  // Complete a task
  taskManager.completeTask(0);
  
  // Display updated tasks
  taskManager.displayTasks();
  
  // Get statistics
  taskManager.showStatistics();
}

/**
 * Priority enum
 */
enum Priority { low, medium, high }

/**
 * Task record (using Dart 3 records)
 */
typedef Task = ({
  String id,
  String title,
  Priority priority,
  bool isCompleted,
  DateTime createdAt,
});

/**
 * Task state (sealed class for type safety)
 */
sealed class TaskState {}

class TaskListState extends TaskState {
  final List<Task> tasks;
  TaskListState(this.tasks);
}

class TaskLoadingState extends TaskState {}

class TaskErrorState extends TaskState {
  final String message;
  TaskErrorState(this.message);
}

/**
 * Task Manager
 */
class TaskManager {
  List<Task> _tasks = [];
  TaskState _state = TaskListState([]);
  
  void addTask(String title, Priority priority) {
    Task task = (
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      priority: priority,
      isCompleted: false,
      createdAt: DateTime.now(),
    );
    
    _tasks.add(task);
    _state = TaskListState(_tasks);
  }
  
  void completeTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      Task task = _tasks[index];
      Task updatedTask = (
        id: task.id,
        title: task.title,
        priority: task.priority,
        isCompleted: true,
        createdAt: task.createdAt,
      );
      
      _tasks[index] = updatedTask;
      _state = TaskListState(_tasks);
    }
  }
  
  void displayTasks() {
    // Pattern matching with sealed class
    String display = switch (_state) {
      TaskListState(tasks: var tasks) => _formatTaskList(tasks),
      TaskLoadingState() => 'Loading tasks...',
      TaskErrorState(message: var msg) => 'Error: $msg',
    };
    
    print(display);
  }
  
  String _formatTaskList(List<Task> tasks) {
    if (tasks.isEmpty) {
      return 'No tasks found.\n';
    }
    
    StringBuffer buffer = StringBuffer();
    buffer.writeln('=== TASKS ===');
    
    for (int i = 0; i < tasks.length; i++) {
      Task task = tasks[i];
      String status = task.isCompleted ? '✓' : '○';
      String priority = _getPrioritySymbol(task.priority);
      
      buffer.writeln('$i. $status $priority ${task.title}');
    }
    
    buffer.writeln('');
    return buffer.toString();
  }
  
  String _getPrioritySymbol(Priority priority) => switch (priority) {
    Priority.low => '🟢',
    Priority.medium => '🟡',
    Priority.high => '🔴',
  };
  
  void showStatistics() {
    if (_state case TaskListState(tasks: var tasks)) {
      int total = tasks.length;
      int completed = tasks.where((t) => t.isCompleted).length;
      int pending = total - completed;
      
      // Count by priority using pattern matching
      int highCount = tasks.where((t) => t.priority == Priority.high).length;
      int mediumCount = tasks.where((t) => t.priority == Priority.medium).length;
      int lowCount = tasks.where((t) => t.priority == Priority.low).length;
      
      print('''
=== STATISTICS ===
Total Tasks: $total
Completed: $completed
Pending: $pending

By Priority:
  High: $highCount
  Medium: $mediumCount
  Low: $lowCount
''');
    }
  }
  
  // Get task by ID using pattern matching
  Task? getTaskById(String id) {
    if (_state case TaskListState(tasks: var tasks)) {
      try {
        return tasks.firstWhere((task) => task.id == id);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
  
  // Filter tasks by priority
  List<Task> getTasksByPriority(Priority priority) {
    if (_state case TaskListState(tasks: var tasks)) {
      return tasks.where((task) => task.priority == priority).toList();
    }
    return [];
  }
  
  // Get task summary using records
  ({int total, int completed, int pending}) getTaskSummary() {
    if (_state case TaskListState(tasks: var tasks)) {
      int total = tasks.length;
      int completed = tasks.where((t) => t.isCompleted).length;
      int pending = total - completed;
      
      return (total: total, completed: completed, pending: pending);
    }
    return (total: 0, completed: 0, pending: 0);
  }
}

/**
 * ADDITIONAL FEATURES
 */

// Task filter using pattern matching
List<Task> filterTasks(List<Task> tasks, TaskFilter filter) {
  return switch (filter) {
    AllTasksFilter() => tasks,
    CompletedTasksFilter() => tasks.where((t) => t.isCompleted).toList(),
    PendingTasksFilter() => tasks.where((t) => !t.isCompleted).toList(),
    PriorityFilter(priority: var p) => tasks.where((t) => t.priority == p).toList(),
  };
}

// Sealed class for filters
sealed class TaskFilter {}
class AllTasksFilter extends TaskFilter {}
class CompletedTasksFilter extends TaskFilter {}
class PendingTasksFilter extends TaskFilter {}
class PriorityFilter extends TaskFilter {
  final Priority priority;
  PriorityFilter(this.priority);
}

// Task operations using records
TaskOperationResult performOperation(TaskOperation operation, List<Task> tasks) {
  return switch (operation) {
    AddTaskOperation(title: var title, priority: var priority) => (
      success: true,
      message: 'Task added: $title',
      tasks: [...tasks, _createTask(title, priority)],
    ),
    CompleteTaskOperation(index: var index) when index >= 0 && index < tasks.length => (
      success: true,
      message: 'Task completed',
      tasks: _completeTaskAt(tasks, index),
    ),
    CompleteTaskOperation() => (
      success: false,
      message: 'Invalid task index',
      tasks: tasks,
    ),
    DeleteTaskOperation(index: var index) when index >= 0 && index < tasks.length => (
      success: true,
      message: 'Task deleted',
      tasks: tasks.asMap().entries.where((entry) => entry.key != index).map((entry) => entry.value).toList(),
    ),
    DeleteTaskOperation() => (
      success: false,
      message: 'Invalid task index',
      tasks: tasks,
    ),
  };
}

typedef TaskOperationResult = ({
  bool success,
  String message,
  List<Task> tasks,
});

sealed class TaskOperation {}
class AddTaskOperation extends TaskOperation {
  final String title;
  final Priority priority;
  AddTaskOperation(this.title, this.priority);
}
class CompleteTaskOperation extends TaskOperation {
  final int index;
  CompleteTaskOperation(this.index);
}
class DeleteTaskOperation extends TaskOperation {
  final int index;
  DeleteTaskOperation(this.index);
}

Task _createTask(String title, Priority priority) => (
  id: DateTime.now().millisecondsSinceEpoch.toString(),
  title: title,
  priority: priority,
  isCompleted: false,
  createdAt: DateTime.now(),
);

List<Task> _completeTaskAt(List<Task> tasks, int index) {
  List<Task> updated = List.from(tasks);
  Task task = updated[index];
  updated[index] = (
    id: task.id,
    title: task.title,
    priority: task.priority,
    isCompleted: true,
    createdAt: task.createdAt,
  );
  return updated;
}

