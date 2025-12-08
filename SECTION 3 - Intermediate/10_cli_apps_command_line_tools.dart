/**
 * CLI APPS (COMMAND LINE TOOLS) IN DART
 * 
 * WHAT IS A CLI APP?
 * CLI (Command Line Interface) apps are programs that run in the terminal
 * and interact with users through text commands.
 * 
 * KEY CONCEPTS:
 * 
 * 1. COMMAND LINE ARGUMENTS:
 *    - Access via: Platform.environment or main(List<String> args)
 *    - Use 'args' package for parsing
 *    - Syntax: dart run app.dart arg1 arg2
 * 
 * 2. USER INPUT:
 *    - stdin.readLineSync(): Read from console
 *    - stdout.write(): Write without newline
 *    - print(): Write with newline
 * 
 * 3. EXIT CODES:
 *    - exit(0): Success
 *    - exit(1): Error
 *    - Use for program termination
 * 
 * 4. CLI FEATURES:
 *    - Interactive menus
 *    - Progress indicators
 *    - Colored output (using ANSI codes)
 *    - File operations
 *    - Command parsing
 * 
 * 5. PACKAGES FOR CLI:
 *    - args: Command-line argument parsing
 *    - io: Enhanced I/O operations
 *    - cli_completion: Tab completion
 * 
 * USE CASES:
 * - Build tools
 * - Code generators
 * - Development utilities
 * - Automation scripts
 * - System administration tools
 */

import 'dart:io';

void main(List<String> arguments) {
  print('=== CLI APPS (COMMAND LINE TOOLS) ===\n');
  
  // 1. COMMAND LINE ARGUMENTS
  print('--- Command Line Arguments ---');
  if (arguments.isNotEmpty) {
    print('Arguments received: ${arguments.length}');
    for (int i = 0; i < arguments.length; i++) {
      print('  Argument $i: ${arguments[i]}');
    }
  } else {
    print('No arguments provided');
    print('Usage: dart run app.dart [options]');
  }
  
  // 2. INTERACTIVE MENU
  print('\n--- Interactive Menu ---');
  runInteractiveMenu();
  
  // 3. READING USER INPUT
  print('\n--- Reading User Input ---');
  demonstrateUserInput();
  
  // 4. COMMAND PARSING
  print('\n--- Command Parsing ---');
  parseCommands(arguments);
  
  // 5. FILE OPERATIONS IN CLI
  print('\n--- File Operations in CLI ---');
  demonstrateFileOperations();
  
  // 6. EXIT CODES
  print('\n--- Exit Codes ---');
  demonstrateExitCodes();
}

/**
 * Interactive menu system
 */
void runInteractiveMenu() {
  while (true) {
    print('\n--- Main Menu ---');
    print('1. Option 1');
    print('2. Option 2');
    print('3. Option 3');
    print('4. Exit');
    
    stdout.write('\nEnter your choice (1-4): ');
    String? choice = stdin.readLineSync();
    
    switch (choice) {
      case '1':
        handleOption1();
        break;
      case '2':
        handleOption2();
        break;
      case '3':
        handleOption3();
        break;
      case '4':
        print('Exiting...');
        return;
      default:
        print('Invalid choice! Please try again.');
    }
  }
}

void handleOption1() {
  print('You selected Option 1');
  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();
  print('Hello, ${name ?? "Guest"}!');
}

void handleOption2() {
  print('You selected Option 2');
  stdout.write('Enter a number: ');
  String? input = stdin.readLineSync();
  if (input != null) {
    try {
      int number = int.parse(input);
      print('Square of $number: ${number * number}');
    } catch (e) {
      print('Invalid number!');
    }
  }
}

void handleOption3() {
  print('You selected Option 3');
  print('Current time: ${DateTime.now()}');
}

/**
 * Demonstrate user input
 */
void demonstrateUserInput() {
  stdout.write('Enter your name: ');
  String? name = stdin.readLineSync();
  print('Hello, ${name ?? "Anonymous"}!');
  
  stdout.write('Enter your age: ');
  String? ageInput = stdin.readLineSync();
  if (ageInput != null) {
    try {
      int age = int.parse(ageInput);
      print('You are $age years old');
    } catch (e) {
      print('Invalid age input');
    }
  }
}

/**
 * Parse commands from arguments
 */
void parseCommands(List<String> arguments) {
  if (arguments.isEmpty) {
    print('No commands provided');
    print('Available commands: help, version, info');
    return;
  }
  
  String command = arguments[0].toLowerCase();
  
  switch (command) {
    case 'help':
      print('''
Available commands:
  help    - Show this help message
  version - Show version information
  info    - Show app information
  greet   - Greet the user
      ''');
      break;
      
    case 'version':
      print('CLI App Version 1.0.0');
      break;
      
    case 'info':
      print('CLI App - Command Line Tool Example');
      print('Built with Dart');
      break;
      
    case 'greet':
      String name = arguments.length > 1 ? arguments[1] : 'User';
      print('Hello, $name!');
      break;
      
    default:
      print('Unknown command: $command');
      print('Use "help" to see available commands');
  }
}

/**
 * Demonstrate file operations in CLI
 */
void demonstrateFileOperations() {
  print('File operations available:');
  print('1. List files in current directory');
  print('2. Read a file');
  print('3. Create a file');
  
  stdout.write('\nEnter choice (1-3): ');
  String? choice = stdin.readLineSync();
  
  switch (choice) {
    case '1':
      listFiles();
      break;
    case '2':
      readFile();
      break;
    case '3':
      createFile();
      break;
    default:
      print('Invalid choice');
  }
}

void listFiles() {
  try {
    Directory currentDir = Directory.current;
    List<FileSystemEntity> entities = currentDir.listSync();
    
    print('\nFiles in current directory:');
    for (var entity in entities) {
      String type = entity is File ? 'File' : 'Directory';
      String name = entity.path.split(Platform.pathSeparator).last;
      print('  [$type] $name');
    }
  } catch (e) {
    print('Error listing files: $e');
  }
}

void readFile() {
  stdout.write('Enter filename: ');
  String? filename = stdin.readLineSync();
  
  if (filename != null) {
    try {
      File file = File(filename);
      if (file.existsSync()) {
        String contents = file.readAsStringSync();
        print('\nFile contents:');
        print(contents);
      } else {
        print('File not found: $filename');
      }
    } catch (e) {
      print('Error reading file: $e');
    }
  }
}

void createFile() {
  stdout.write('Enter filename: ');
  String? filename = stdin.readLineSync();
  
  if (filename != null) {
    try {
      File file = File(filename);
      stdout.write('Enter content: ');
      String? content = stdin.readLineSync();
      
      file.writeAsStringSync(content ?? '');
      print('File created: $filename');
    } catch (e) {
      print('Error creating file: $e');
    }
  }
}

/**
 * Demonstrate exit codes
 */
void demonstrateExitCodes() {
  print('''
Exit codes:
- 0: Success
- 1: General error
- 2: Misuse of shell command

Example:
  exit(0);  // Success
  exit(1);  // Error
''');
  
  // Uncomment to test exit codes
  // exit(0); // Success exit
}

/**
 * ADDITIONAL EXAMPLES
 */

// Progress indicator
void showProgress() {
  print('Processing...');
  for (int i = 0; i <= 100; i += 10) {
    stdout.write('\rProgress: $i%');
    sleep(Duration(milliseconds: 100));
  }
  print('\nDone!');
}

// Colored output (ANSI codes)
void coloredOutput() {
  // ANSI color codes
  const String red = '\x1B[31m';
  const String green = '\x1B[32m';
  const String yellow = '\x1B[33m';
  const String blue = '\x1B[34m';
  const String reset = '\x1B[0m';
  
  print('${red}This is red$reset');
  print('${green}This is green$reset');
  print('${yellow}This is yellow$reset');
  print('${blue}This is blue$reset');
}

// Table output
void displayTable() {
  print('\n--- User Table ---');
  print('Name        | Age | City');
  print('------------|-----|----------');
  print('Alice       | 25  | New York');
  print('Bob         | 30  | London');
  print('Charlie     | 35  | Tokyo');
}

// Confirmation prompt
bool confirm(String message) {
  stdout.write('$message (y/n): ');
  String? response = stdin.readLineSync()?.toLowerCase();
  return response == 'y' || response == 'yes';
}

// Password input (hide characters)
String? readPassword() {
  stdout.write('Enter password: ');
  // Note: stdin doesn't hide input by default
  // For production, use a package like 'io' or implement terminal control
  return stdin.readLineSync();
}

// Multi-line input
List<String> readMultiLine() {
  print('Enter lines (empty line to finish):');
  List<String> lines = [];
  while (true) {
    String? line = stdin.readLineSync();
    if (line == null || line.isEmpty) break;
    lines.add(line);
  }
  return lines;
}

// Command history (simple)
class CommandHistory {
  List<String> _history = [];
  
  void add(String command) {
    _history.add(command);
  }
  
  void show() {
    print('Command history:');
    for (int i = 0; i < _history.length; i++) {
      print('  ${i + 1}. ${_history[i]}');
    }
  }
}

// Environment variables
void showEnvironment() {
  print('\n--- Environment Variables ---');
  Map<String, String> env = Platform.environment;
  print('PATH: ${env['PATH']}');
  print('HOME: ${env['HOME'] ?? env['USERPROFILE']}');
  print('OS: ${Platform.operatingSystem}');
}

// Simple calculator CLI
void calculatorCLI() {
  print('\n--- Simple Calculator ---');
  stdout.write('Enter first number: ');
  String? num1Input = stdin.readLineSync();
  
  stdout.write('Enter operator (+, -, *, /): ');
  String? operator = stdin.readLineSync();
  
  stdout.write('Enter second number: ');
  String? num2Input = stdin.readLineSync();
  
  if (num1Input != null && num2Input != null && operator != null) {
    try {
      double num1 = double.parse(num1Input);
      double num2 = double.parse(num2Input);
      
      double result = 0;
      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 != 0) {
            result = num1 / num2;
          } else {
            print('Error: Division by zero');
            return;
          }
          break;
        default:
          print('Invalid operator');
          return;
      }
      
      print('Result: $result');
    } catch (e) {
      print('Error: Invalid input');
    }
  }
}

