/**
 * ERROR HANDLING: try, catch, finally IN DART
 * 
 * WHAT IS ERROR HANDLING?
 * Error handling is the process of responding to and recovering from
 * error conditions that occur during program execution.
 * 
 * KEY CONCEPTS:
 * 
 * 1. TRY BLOCK:
 *    - Contains code that might throw an exception
 *    - Syntax: try { code }
 *    - If exception occurs, control moves to catch block
 * 
 * 2. CATCH BLOCK:
 *    - Handles exceptions thrown in try block
 *    - Can catch specific exception types
 *    - Syntax: catch (exception) { handle }
 *    - Can have multiple catch blocks for different exceptions
 * 
 * 3. FINALLY BLOCK:
 *    - Always executes, regardless of exception
 *    - Used for cleanup code
 *    - Syntax: finally { cleanup }
 *    - Executes even if return statement is in try/catch
 * 
 * 4. ON KEYWORD:
 *    - Catches specific exception types
 *    - Syntax: on ExceptionType catch (e) { }
 *    - More specific than catch
 * 
 * EXCEPTION TYPES:
 * - Exception: Base class for all exceptions
 * - FormatException: Invalid format
 * - RangeError: Value out of range
 * - TypeError: Type mismatch
 * - ArgumentError: Invalid argument
 * - StateError: Invalid state
 * 
 * THROWING EXCEPTIONS:
 * - throw Exception('message')
 * - throw 'error message'
 * - throw CustomException()
 */

void main() {
  print('=== ERROR HANDLING IN DART ===\n');
  
  // 1. BASIC TRY-CATCH
  print('--- Basic Try-Catch ---');
  try {
    int result = 10 ~/ 0; // Division by zero
    print('Result: $result');
  } catch (e) {
    print('Error caught: $e');
  }
  
  // 2. TRY-CATCH WITH SPECIFIC EXCEPTION
  print('\n--- Try-Catch with Specific Exception ---');
  try {
    int number = int.parse('abc'); // FormatException
    print('Number: $number');
  } on FormatException catch (e) {
    print('Format error: $e');
  } catch (e) {
    print('Other error: $e');
  }
  
  // 3. TRY-CATCH-FINALLY
  print('\n--- Try-Catch-Finally ---');
  try {
    print('Executing try block');
    int result = 10 ~/ 2;
    print('Result: $result');
  } catch (e) {
    print('Error: $e');
  } finally {
    print('Finally block always executes');
  }
  
  // 4. MULTIPLE CATCH BLOCKS
  print('\n--- Multiple Catch Blocks ---');
  try {
    // Simulate different errors
    throw FormatException('Invalid format');
  } on FormatException catch (e) {
    print('FormatException: $e');
  } on ArgumentError catch (e) {
    print('ArgumentError: $e');
  } catch (e) {
    print('Other exception: $e');
  }
  
  // 5. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  
  // Example 1: Parsing user input
  demonstrateParsing();
  
  // Example 2: File operations
  demonstrateFileOperations();
  
  // Example 3: Division with error handling
  demonstrateDivision();
  
  // Example 4: Custom exceptions
  demonstrateCustomExceptions();
  
  // Example 5: Nested try-catch
  demonstrateNestedTryCatch();
}

/**
 * Example 1: Parsing user input
 */
void demonstrateParsing() {
  print('\n--- Parsing User Input ---');
  List<String> inputs = ['123', 'abc', '45.67', '-10'];
  
  for (String input in inputs) {
    try {
      int number = int.parse(input);
      print('Parsed "$input" as int: $number');
    } on FormatException catch (e) {
      print('Cannot parse "$input": ${e.message}');
    } catch (e) {
      print('Unexpected error parsing "$input": $e');
    }
  }
}

/**
 * Example 2: File operations
 */
void demonstrateFileOperations() {
  print('\n--- File Operations ---');
  try {
    // Simulating file read
    String? content = readFile('example.txt');
    if (content == null) {
      throw FileNotFoundException('File not found: example.txt');
    }
    print('File content: $content');
  } on FileNotFoundException catch (e) {
    print('File error: ${e.message}');
  } catch (e) {
    print('Error reading file: $e');
  } finally {
    print('File operation completed');
  }
}

/**
 * Example 3: Division with error handling
 */
void demonstrateDivision() {
  print('\n--- Division with Error Handling ---');
  List<Map<String, dynamic>> divisions = [
    {'a': 10, 'b': 2},
    {'a': 10, 'b': 0},
    {'a': 15, 'b': 3},
  ];
  
  for (var div in divisions) {
    try {
      int a = div['a'];
      int b = div['b'];
      
      if (b == 0) {
        throw DivisionByZeroException('Cannot divide by zero');
      }
      
      int result = a ~/ b;
      print('$a ÷ $b = $result');
    } on DivisionByZeroException catch (e) {
      print('Error: ${e.message}');
    } catch (e) {
      print('Unexpected error: $e');
    }
  }
}

/**
 * Example 4: Custom exceptions
 */
void demonstrateCustomExceptions() {
  print('\n--- Custom Exceptions ---');
  try {
    validateAge(-5);
  } on InvalidAgeException catch (e) {
    print('Validation error: ${e.message}');
  }
  
  try {
    validateEmail('invalid-email');
  } on InvalidEmailException catch (e) {
    print('Validation error: ${e.message}');
  }
}

/**
 * Example 5: Nested try-catch
 */
void demonstrateNestedTryCatch() {
  print('\n--- Nested Try-Catch ---');
  try {
    print('Outer try block');
    try {
      int result = 10 ~/ 0;
      print('Result: $result');
    } on IntegerDivisionByZeroException {
      print('Inner catch: Division by zero');
      throw 'Re-throwing error';
    }
  } catch (e) {
    print('Outer catch: $e');
  }
}

/**
 * CUSTOM EXCEPTION CLASSES
 */

// Custom exception for file not found
class FileNotFoundException implements Exception {
  final String message;
  FileNotFoundException(this.message);
  
  @override
  String toString() => 'FileNotFoundException: $message';
}

// Custom exception for division by zero
class DivisionByZeroException implements Exception {
  final String message;
  DivisionByZeroException(this.message);
  
  @override
  String toString() => 'DivisionByZeroException: $message';
}

// Custom exception for invalid age
class InvalidAgeException implements Exception {
  final String message;
  InvalidAgeException(this.message);
  
  @override
  String toString() => 'InvalidAgeException: $message';
}

// Custom exception for invalid email
class InvalidEmailException implements Exception {
  final String message;
  InvalidEmailException(this.message);
  
  @override
  String toString() => 'InvalidEmailException: $message';
}

/**
 * HELPER FUNCTIONS
 */

// Simulate file reading
String? readFile(String filename) {
  // Simulate file not found
  if (filename == 'example.txt') {
    return null;
  }
  return 'File content';
}

// Validate age
void validateAge(int age) {
  if (age < 0 || age > 150) {
    throw InvalidAgeException('Age must be between 0 and 150');
  }
  print('Age $age is valid');
}

// Validate email
void validateEmail(String email) {
  if (!email.contains('@') || !email.contains('.')) {
    throw InvalidEmailException('Invalid email format');
  }
  print('Email $email is valid');
}

/**
 * ADDITIONAL EXAMPLES
 */

// Try-catch with return
int safeDivide(int a, int b) {
  try {
    return a ~/ b;
  } catch (e) {
    print('Error in division: $e');
    return 0; // Default value
  }
}

// Try-catch with rethrow
void processData(String data) {
  try {
    if (data.isEmpty) {
      throw ArgumentError('Data cannot be empty');
    }
    print('Processing: $data');
  } catch (e) {
    print('Error processing data: $e');
    rethrow; // Re-throw the exception
  }
}

// Finally with return
int getValue() {
  try {
    return 10;
  } finally {
    print('Finally executes even with return');
  }
}

// Stack trace
void demonstrateStackTrace() {
  try {
    throw Exception('Something went wrong');
  } catch (e, stackTrace) {
    print('Exception: $e');
    print('Stack trace: $stackTrace');
  }
}

// Error handling in async code
Future<void> demonstrateAsyncErrorHandling() async {
  try {
    // Simulate async operation
    await Future.delayed(Duration(seconds: 1));
    throw Exception('Async error');
  } catch (e) {
    print('Async error caught: $e');
  }
}

