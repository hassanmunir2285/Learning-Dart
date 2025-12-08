/**
 * TYPEDEFS & FUNCTION ALIASES IN DART
 * 
 * WHAT IS A TYPEDEF?
 * A typedef (type definition) creates an alias for a function type.
 * It allows you to give a name to a function signature.
 * 
 * KEY CONCEPTS:
 * 
 * 1. BASIC TYPEDEF:
 *    - Syntax: typedef AliasName = ReturnType Function(Parameters);
 *    - Creates a type alias for function signatures
 *    - Makes code more readable
 * 
 * 2. FUNCTION TYPES:
 *    - Functions are first-class objects in Dart
 *    - Can be assigned to variables
 *    - Can be passed as parameters
 *    - Can be returned from functions
 * 
 * 3. TYPEDEF USAGE:
 *    - As variable types
 *    - As parameter types
 *    - As return types
 *    - In generic typedefs
 * 
 * 4. GENERIC TYPEDEFS:
 *    - Typedefs with type parameters
 *    - Syntax: typedef Alias<T> = ReturnType Function(T param);
 * 
 * BENEFITS:
 * - Code Readability: Clear function signatures
 * - Type Safety: Compile-time checking
 * - Reusability: Define once, use everywhere
 * - Documentation: Self-documenting code
 * 
 * USE CASES:
 * - Callback functions
 * - Event handlers
 * - Transformers/Converters
 * - Comparators
 * - Validators
 */

void main() {
  print('=== TYPEDEFS & FUNCTION ALIASES ===\n');
  
  // 1. BASIC TYPEDEF USAGE
  print('--- Basic Typedef Usage ---');
  MathOperation add = (a, b) => a + b;
  MathOperation multiply = (a, b) => a * b;
  
  print('Add: ${add(10, 5)}');
  print('Multiply: ${multiply(10, 5)}');
  
  // 2. TYPEDEF AS PARAMETER
  print('\n--- Typedef as Parameter ---');
  calculate(10, 20, add);
  calculate(10, 20, multiply);
  
  // 3. STRING TRANSFORMER
  print('\n--- String Transformer ---');
  StringTransformer upper = (s) => s.toUpperCase();
  StringTransformer lower = (s) => s.toLowerCase();
  
  String text = 'Hello Dart';
  print('Original: $text');
  print('Uppercase: ${upper(text)}');
  print('Lowercase: ${lower(text)}');
  
  // 4. VALIDATOR TYPEDEF
  print('\n--- Validator Typedef ---');
  Validator isPositive = (value) => value > 0;
  Validator isEven = (value) => value % 2 == 0;
  
  print('Is 10 positive? ${isPositive(10)}');
  print('Is -5 positive? ${isPositive(-5)}');
  print('Is 10 even? ${isEven(10)}');
  print('Is 7 even? ${isEven(7)}');
  
  // 5. CALLBACK TYPEDEF
  print('\n--- Callback Typedef ---');
  processData('Hello', (result) {
    print('Callback result: $result');
  });
  
  // 6. COMPARATOR TYPEDEF
  print('\n--- Comparator Typedef ---');
  List<int> numbers = [3, 1, 4, 1, 5, 9, 2, 6];
  Comparator<int> ascending = (a, b) => a.compareTo(b);
  Comparator<int> descending = (a, b) => b.compareTo(a);
  
  numbers.sort(ascending);
  print('Ascending: $numbers');
  
  numbers.sort(descending);
  print('Descending: $numbers');
  
  // 7. GENERIC TYPEDEF
  print('\n--- Generic Typedef ---');
  Transformer<int, String> intToString = (value) => value.toString();
  Transformer<String, int> stringToInt = (value) => int.parse(value);
  
  print('Int to String: ${intToString(42)}');
  print('String to Int: ${stringToInt("123")}');
  
  // 8. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  demonstratePracticalExamples();
}

/**
 * Basic Typedef Definitions
 */

// Typedef for math operations
typedef MathOperation = int Function(int a, int b);

// Typedef for string transformations
typedef StringTransformer = String Function(String input);

// Typedef for validators
typedef Validator = bool Function(int value);

// Typedef for callbacks
typedef Callback = void Function(String result);

// Typedef for comparators
typedef Comparator<T> = int Function(T a, T b);

// Generic typedef for transformers
typedef Transformer<T, R> = R Function(T value);

// Typedef for event handlers
typedef EventHandler = void Function(dynamic event);

// Typedef for async operations
typedef AsyncOperation<T> = Future<T> Function();

/**
 * Function using typedef as parameter
 */
void calculate(int a, int b, MathOperation operation) {
  int result = operation(a, b);
  print('$a operation $b = $result');
}

/**
 * Function using callback typedef
 */
void processData(String data, Callback callback) {
  String processed = data.toUpperCase();
  callback(processed);
}

/**
 * Practical Examples
 */
void demonstratePracticalExamples() {
  // Example 1: Filter function
  Filter<int> isPositive = (value) => value > 0;
  List<int> numbers = [-5, -2, 0, 3, 7, -1, 9];
  List<int> positiveNumbers = numbers.where(isPositive).toList();
  print('Positive numbers: $positiveNumbers');
  
  // Example 2: Mapper function
  Mapper<int, String> numberToWord = (n) {
    List<String> words = ['zero', 'one', 'two', 'three', 'four', 'five'];
    return n < words.length ? words[n] : 'unknown';
  };
  
  List<int> nums = [0, 1, 2, 3, 4, 5];
  List<String> words = nums.map(numberToWord).toList();
  print('Number words: $words');
  
  // Example 3: Reducer function
  Reducer<int, int> sum = (accumulator, value) => accumulator + value;
  int total = numbers.fold(0, sum);
  print('Sum: $total');
  
  // Example 4: Predicate function
  Predicate<String> isLong = (s) => s.length > 5;
  List<String> strings = ['short', 'medium', 'very long', 'tiny'];
  List<String> longStrings = strings.where(isLong).toList();
  print('Long strings: $longStrings');
}

/**
 * Additional Typedef Definitions
 */

// Filter/Predicate typedef
typedef Filter<T> = bool Function(T value);

// Mapper typedef
typedef Mapper<T, R> = R Function(T value);

// Reducer typedef
typedef Reducer<T, R> = R Function(R accumulator, T value);

// Predicate typedef (same as Filter)
typedef Predicate<T> = bool Function(T value);

// Binary operator typedef
typedef BinaryOperator<T> = T Function(T a, T b);

// Unary operator typedef
typedef UnaryOperator<T> = T Function(T value);

// Consumer typedef (takes value, returns nothing)
typedef Consumer<T> = void Function(T value);

// Supplier typedef (takes nothing, returns value)
typedef Supplier<T> = T Function();

/**
 * ADDITIONAL EXAMPLES
 */

// Using typedef in classes
class Calculator {
  MathOperation? operation;
  
  void setOperation(MathOperation op) {
    operation = op;
  }
  
  int? calculate(int a, int b) {
    return operation?.call(a, b);
  }
}

// Using typedef for event system
class EventEmitter {
  Map<String, List<EventHandler>> _handlers = {};
  
  void on(String event, EventHandler handler) {
    _handlers.putIfAbsent(event, () => []).add(handler);
  }
  
  void emit(String event, dynamic data) {
    _handlers[event]?.forEach((handler) => handler(data));
  }
}

// Using typedef for API calls
typedef ApiCall<T> = Future<T> Function();

class ApiClient {
  Future<T> execute<T>(ApiCall<T> call) async {
    try {
      return await call();
    } catch (e) {
      print('API Error: $e');
      rethrow;
    }
  }
}

// Using typedef for validation
class FormValidator {
  Map<String, List<Validator>> _validators = {};
  
  void addValidator(String field, Validator validator) {
    _validators.putIfAbsent(field, () => []).add(validator);
  }
  
  bool validate(String field, int value) {
    List<Validator>? validators = _validators[field];
    if (validators == null) return true;
    
    return validators.every((validator) => validator(value));
  }
}

// Complex typedef example
typedef ComplexOperation = int Function(int a, int b, int c);

void demonstrateComplexOperation() {
  ComplexOperation sumAll = (a, b, c) => a + b + c;
  ComplexOperation multiplyAll = (a, b, c) => a * b * c;
  
  print('Sum all: ${sumAll(1, 2, 3)}');
  print('Multiply all: ${multiplyAll(1, 2, 3)}');
}

// Typedef with nullable return
typedef NullableOperation<T> = T? Function(T? value);

void demonstrateNullableOperation() {
  NullableOperation<String> toUpper = (value) => value?.toUpperCase();
  
  print('To upper (null): ${toUpper(null)}');
  print('To upper (string): ${toUpper("hello")}');
}

