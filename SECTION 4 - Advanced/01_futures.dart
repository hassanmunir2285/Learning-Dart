import 'dart:async';

/**
 * FUTURES IN DART
 * 
 * WHAT IS A FUTURE?
 * A Future represents a value that will be available at some point in the future.
 * It's used for asynchronous operations that may take time to complete.
 * 
 * KEY CONCEPTS:
 * 
 * 1. FUTURE BASICS:
 *    - Represents asynchronous computation
 *    - Can complete with a value or error
 *    - Syntax: Future<Type> functionName() { }
 * 
 * 2. FUTURE STATES:
 *    - Uncompleted: Operation is still running
 *    - Completed with value: Operation succeeded
 *    - Completed with error: Operation failed
 * 
 * 3. FUTURE METHODS:
 *    - then(): Handle successful completion
 *    - catchError(): Handle errors
 *    - whenComplete(): Always executes
 *    - timeout(): Set timeout duration
 * 
 * 4. CREATING FUTURES:
 *    - Future.value(): Completed future with value
 *    - Future.error(): Completed future with error
 *    - Future.delayed(): Future that completes after delay
 *    - Future.microtask(): Schedule microtask
 * 
 * 5. CHAINING FUTURES:
 *    - then() returns a Future
 *    - Can chain multiple then() calls
 *    - Errors propagate through chain
 * 
 * USE CASES:
 * - Network requests
 * - File I/O operations
 * - Database queries
 * - Timers and delays
 * - Any time-consuming operation
 */

void main() {
  print('=== FUTURES IN DART ===\n');
  
  // 1. BASIC FUTURE
  print('--- Basic Future ---');
  Future<String> future = getData();
  future.then((value) {
    print('Future completed with: $value');
  });
  
  // 2. FUTURE WITH THEN
  print('\n--- Future with then() ---');
  fetchUserData().then((data) {
    print('User data: $data');
  });
  
  // 3. FUTURE WITH ERROR HANDLING
  print('\n--- Future with Error Handling ---');
  fetchDataWithError()
      .then((value) => print('Success: $value'))
      .catchError((error) => print('Error: $error'));
  
  // 4. FUTURE.DELAYED
  print('\n--- Future.delayed() ---');
  Future.delayed(Duration(seconds: 1), () {
    print('This runs after 1 second');
  });
  
  // 5. FUTURE.VALUE
  print('\n--- Future.value() ---');
  Future<String> immediateFuture = Future.value('Immediate value');
  immediateFuture.then((value) => print('Value: $value'));
  
  // 6. FUTURE.ERROR
  print('\n--- Future.error() ---');
  Future<String> errorFuture = Future.error('Something went wrong');
  errorFuture.catchError((error) => print('Caught error: $error'));
  
  // 7. CHAINING FUTURES
  print('\n--- Chaining Futures ---');
  chainFutures();
  
  // 8. FUTURE METHODS
  print('\n--- Future Methods ---');
  demonstrateFutureMethods();
  
  // 9. WAITING FOR MULTIPLE FUTURES
  print('\n--- Waiting for Multiple Futures ---');
  waitForMultipleFutures();
  
  // Wait for async operations to complete
  Future.delayed(Duration(seconds: 2), () {
    print('\nAll futures completed');
  });
}

/**
 * Basic Future example
 */
Future<String> getData() {
  return Future.delayed(Duration(seconds: 1), () {
    return 'Data loaded';
  });
}

/**
 * Future that returns data
 */
Future<Map<String, dynamic>> fetchUserData() {
  return Future.delayed(Duration(milliseconds: 500), () {
    return {
      'id': 1,
      'name': 'John Doe',
      'email': 'john@example.com'
    };
  });
}

/**
 * Future that may error
 */
Future<String> fetchDataWithError() {
  return Future.delayed(Duration(milliseconds: 500), () {
    // Simulate error
    if (true) {
      throw Exception('Network error');
    }
    return 'Data';
  });
}

/**
 * Chaining futures
 */
void chainFutures() {
  Future<int> future = Future.value(10);
  
  future
      .then((value) => value * 2) // Returns 20
      .then((value) => value + 5)  // Returns 25
      .then((value) {
        print('Chained result: $value');
        return value;
      })
      .catchError((error) => print('Error in chain: $error'));
}

/**
 * Demonstrate Future methods
 */
void demonstrateFutureMethods() {
  // timeout()
  Future<String> slowFuture = Future.delayed(Duration(seconds: 5), () => 'Done');
  slowFuture
      .timeout(Duration(seconds: 2))
      .then((value) => print('Completed: $value'))
      .catchError((error) {
        print('Timeout: $error');
        return 'Timeout';
      });
  
  // whenComplete()
  Future.delayed(Duration(milliseconds: 500), () => 'Data')
      .then((value) => print('Got: $value'))
      .whenComplete(() => print('Operation completed'));
  
  // catchError with test
  Future.error('Custom error')
      .catchError((error) {
        print('Caught: $error');
        return 'Handled';
      }, test: (error) => error is String);
}

/**
 * Wait for multiple futures
 */
void waitForMultipleFutures() {
  Future<String> future1 = Future.delayed(Duration(milliseconds: 300), () => 'First');
  Future<String> future2 = Future.delayed(Duration(milliseconds: 200), () => 'Second');
  Future<String> future3 = Future.delayed(Duration(milliseconds: 100), () => 'Third');
  
  // Wait for all futures
  Future.wait([future1, future2, future3]).then((results) {
    print('All futures completed: $results');
  });
  
  // Wait for any future
  Future.any([future1, future2, future3]).then((result) {
    print('First completed: $result');
  });
}

/**
 * ADDITIONAL EXAMPLES
 */

// Future with multiple then() calls
Future<int> processNumber(int n) {
  return Future.value(n)
      .then((value) => value * 2)
      .then((value) => value + 10)
      .then((value) => value ~/ 2);
}

// Future with error recovery
Future<String> fetchWithRetry() {
  return fetchDataWithError().catchError((error) {
    print('Retrying...');
    return Future.delayed(Duration(milliseconds: 500), () => 'Retry successful');
  });
}

// Future with conditional logic
Future<String> fetchDataConditionally(bool shouldFail) {
  if (shouldFail) {
    return Future.error('Requested failure');
  }
  return Future.value('Success');
}

// Future.microtask
void demonstrateMicrotask() {
  print('1. Synchronous');
  
  Future.microtask(() {
    print('3. Microtask');
  });
  
  Future(() {
    print('4. Future');
  });
  
  print('2. Synchronous');
}

// Future with completer
Future<String> createCustomFuture() {
  Completer<String> completer = Completer<String>();
  
  // Simulate async operation
  Future.delayed(Duration(seconds: 1), () {
    completer.complete('Custom future completed');
  });
  
  return completer.future;
}

// Future with error handling and recovery
Future<String> robustFuture() {
  return Future<String>.delayed(Duration(milliseconds: 500), () {
    throw Exception('Error occurred');
  })
      .then<String>((value) => value)
      .catchError<String>((error) {
        print('Handling error: $error');
        return 'Default value';
      })
      .whenComplete(() => print('Operation finished'));
}

