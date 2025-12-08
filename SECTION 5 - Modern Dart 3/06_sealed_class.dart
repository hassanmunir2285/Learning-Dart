/**
 * SEALED CLASSES IN DART 3
 * 
 * WHAT IS A SEALED CLASS?
 * A sealed class is a class that can only have a fixed set of subclasses,
 * all defined in the same library. This enables exhaustiveness checking
 * and pattern matching.
 * 
 * KEY CHARACTERISTICS:
 * 
 * 1. CLOSED HIERARCHY:
 *    - All subclasses must be in same library
 *    - Fixed set of possible types
 *    - Enables exhaustiveness checking
 * 
 * 2. CANNOT BE INSTANTIATED:
 *    - Cannot create instance directly
 *    - Must use subclasses
 * 
 * 3. PATTERN MATCHING:
 *    - Perfect for switch expressions
 *    - Compiler checks exhaustiveness
 *    - No default case needed if all cases covered
 * 
 * 4. USE CASES:
 *    - State machines
 *    - Result types
 *    - Algebraic data types
 *    - API responses
 * 
 * WHEN TO USE:
 * - When you have a fixed set of related types
 * - For state management
 * - For result/error handling
 * - When you want exhaustiveness checking
 */

void main() {
  print('=== SEALED CLASSES IN DART 3 ===\n');
  
  // 1. BASIC SEALED CLASS
  print('--- Basic Sealed Class ---');
  demonstrateBasicSealedClass();
  
  // 2. SEALED CLASS WITH PATTERN MATCHING
  print('\n--- Sealed Class with Pattern Matching ---');
  demonstrateSealedClassPatternMatching();
  
  // 3. SEALED CLASS FOR STATE MANAGEMENT
  print('\n--- Sealed Class for State Management ---');
  demonstrateSealedClassState();
  
  // 4. SEALED CLASS FOR RESULT TYPES
  print('\n--- Sealed Class for Result Types ---');
  demonstrateSealedClassResult();
}

/**
 * Basic sealed class
 */
void demonstrateBasicSealedClass() {
  // Cannot instantiate sealed class directly
  // ❌ Shape shape = Shape(); // Error!
  
  // Must use subclasses
  Shape circle = Circle(5.0);
  Shape square = Square(4.0);
  
  print('Circle radius: ${(circle as Circle).radius}');
  print('Square side: ${(square as Square).side}');
}

// Sealed class - closed hierarchy
sealed class Shape {}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);
}

class Square extends Shape {
  final double side;
  Square(this.side);
}

/**
 * Sealed class with pattern matching
 */
void demonstrateSealedClassPatternMatching() {
  // Pattern matching with sealed class
  print(describe(Unauthenticated()));
  print(describe(Loading()));
  print(describe(Authenticated(username: 'Hassan')));
  print(describe(AuthError('Invalid token')));
  
  // Switch expression - exhaustiveness checked
  print(describe2(Unauthenticated()));
  print(describe2(Authenticated(username: 'admin')));
  print(describe2(Authenticated(username: 'user')));
}

// Sealed class for authentication state
sealed class AuthState {}

class Unauthenticated extends AuthState {}
class Loading extends AuthState {}
class Authenticated extends AuthState {
  final String username;
  Authenticated({required this.username});
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

// Pattern matching function
String describe(AuthState state) {
  return switch (state) {
    Unauthenticated() => 'Please sign in',
    Loading() => 'Loading...',
    Authenticated(username: var username) => 'Welcome, $username!',
    AuthError(message: var message) => 'Error: $message',
    // No default needed - exhaustiveness checked!
  };
}

// Pattern matching with guards
String describe2(AuthState state) => switch (state) {
  Authenticated(username: var username) when username == 'admin' => 'Admin access',
  Authenticated(username: var username) => 'User: $username',
  Unauthenticated() => 'Please sign in',
  Loading() => 'Loading...',
  AuthError(message: var message) => 'Error: $message',
};

/**
 * Sealed class for state management
 */
void demonstrateSealedClassState() {
  // State machine example
  AppState state = InitialState();
  print(processState(state));
  
  state = LoadingState();
  print(processState(state));
  
  state = LoadedState(['item1', 'item2']);
  print(processState(state));
  
  state = ErrorState('Network error');
  print(processState(state));
}

sealed class AppState {}

class InitialState extends AppState {}
class LoadingState extends AppState {}
class LoadedState extends AppState {
  final List<String> data;
  LoadedState(this.data);
}
class ErrorState extends AppState {
  final String message;
  ErrorState(this.message);
}

String processState(AppState state) => switch (state) {
  InitialState() => 'Initializing...',
  LoadingState() => 'Loading data...',
  LoadedState(data: var data) => 'Loaded ${data.length} items',
  ErrorState(message: var msg) => 'Error: $msg',
};

/**
 * Sealed class for result types
 */
void demonstrateSealedClassResult() {
  // Result type pattern
  Result<int> success = Success(42);
  Result<int> failure = Failure('Something went wrong');
  
  print(handleResult(success));
  print(handleResult(failure));
}

sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T value;
  Success(this.value);
}

class Failure<T> extends Result<T> {
  final String error;
  Failure(this.error);
}

String handleResult<T>(Result<T> result) => switch (result) {
  Success(value: var value) => 'Success: $value',
  Failure(error: var error) => 'Failure: $error',
};

/**
 * ADDITIONAL EXAMPLES
 */

// Sealed class for network response
sealed class NetworkResponse {}

class SuccessResponse extends NetworkResponse {
  final Map<String, dynamic> data;
  SuccessResponse(this.data);
}

class ErrorResponse extends NetworkResponse {
  final int statusCode;
  final String message;
  ErrorResponse(this.statusCode, this.message);
}

// Pattern matching network response
void handleNetworkResponse(NetworkResponse response) {
  switch (response) {
    case SuccessResponse(data: var data):
      print('Success: $data');
    case ErrorResponse(statusCode: var code, message: var msg):
      print('Error $code: $msg');
  }
}

// Sealed class for UI state
sealed class UIState {}

class EmptyState extends UIState {}
class LoadingState2 extends UIState {}
class ContentState extends UIState {
  final List<String> items;
  ContentState(this.items);
}
class ErrorState2 extends UIState {
  final String error;
  ErrorState2(this.error);
}
