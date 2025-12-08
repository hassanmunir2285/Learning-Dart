/**
 * ASYNC / AWAIT IN DART
 * 
 * WHAT IS ASYNC/AWAIT?
 * async/await is syntactic sugar that makes asynchronous code
 * look and behave like synchronous code.
 * 
 * KEY CONCEPTS:
 * 
 * 1. ASYNC KEYWORD:
 *    - Marks a function as asynchronous
 *    - Function returns a Future
 *    - Syntax: Future<Type> functionName() async { }
 *    - Or: void functionName() async { }
 * 
 * 2. AWAIT KEYWORD:
 *    - Waits for a Future to complete
 *    - Can only be used in async functions
 *    - Syntax: var result = await futureFunction();
 *    - Pauses execution until Future completes
 * 
 * 3. ERROR HANDLING:
 *    - Use try-catch with await
 *    - Errors are caught like synchronous code
 *    - Much cleaner than .then().catchError()
 * 
 * 4. BENEFITS:
 *    - Readable code (looks synchronous)
 *    - Easy error handling
 *    - Sequential execution flow
 *    - Better debugging experience
 * 
 * 5. ASYNC GENERATORS:
 *    - Stream generators using async*
 *    - Yield values asynchronously
 *    - Syntax: Stream<Type> functionName() async* { }
 * 
 * WHEN TO USE:
 * - Any asynchronous operation
 * - Network requests
 * - File I/O
 * - Database operations
 * - When you need to wait for results
 */

void main() async {
  print('=== ASYNC / AWAIT IN DART ===\n');
  
  // 1. BASIC ASYNC/AWAIT
  print('--- Basic async/await ---');
  String result = await fetchData();
  print('Result: $result');
  
  // 2. ASYNC FUNCTION
  print('\n--- Async Function ---');
  await demonstrateAsyncFunction();
  
  // 3. ERROR HANDLING WITH ASYNC/AWAIT
  print('\n--- Error Handling ---');
  await demonstrateErrorHandling();
  
  // 4. SEQUENTIAL EXECUTION
  print('\n--- Sequential Execution ---');
  await demonstrateSequentialExecution();
  
  // 5. PARALLEL EXECUTION
  print('\n--- Parallel Execution ---');
  await demonstrateParallelExecution();
  
  // 6. ASYNC GENERATORS
  print('\n--- Async Generators ---');
  await demonstrateAsyncGenerators();
  
  // 7. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  await demonstratePracticalExamples();
}

/**
 * Basic async function
 */
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Data fetched';
}

/**
 * Demonstrate async function
 */
Future<void> demonstrateAsyncFunction() async {
  print('Starting async operation...');
  await Future.delayed(Duration(milliseconds: 500));
  print('Async operation completed');
}

/**
 * Error handling with async/await
 */
Future<void> demonstrateErrorHandling() async {
  try {
    String data = await fetchDataWithError();
    print('Data: $data');
  } catch (e) {
    print('Error caught: $e');
  } finally {
    print('Error handling completed');
  }
}

Future<String> fetchDataWithError() async {
  await Future.delayed(Duration(milliseconds: 500));
  throw Exception('Simulated error');
}

/**
 * Sequential execution
 */
Future<void> demonstrateSequentialExecution() async {
  print('Step 1: Starting...');
  String step1 = await performStep1();
  print('Step 1 result: $step1');
  
  print('Step 2: Starting...');
  String step2 = await performStep2(step1);
  print('Step 2 result: $step2');
  
  print('Step 3: Starting...');
  String step3 = await performStep3(step2);
  print('Final result: $step3');
}

Future<String> performStep1() async {
  await Future.delayed(Duration(milliseconds: 300));
  return 'Step 1 completed';
}

Future<String> performStep2(String input) async {
  await Future.delayed(Duration(milliseconds: 300));
  return '$input -> Step 2 completed';
}

Future<String> performStep3(String input) async {
  await Future.delayed(Duration(milliseconds: 300));
  return '$input -> Step 3 completed';
}

/**
 * Parallel execution
 */
Future<void> demonstrateParallelExecution() async {
  // Start all futures at once
  Future<String> future1 = fetchUserData();
  Future<String> future2 = fetchProductData();
  Future<String> future3 = fetchOrderData();
  
  // Wait for all to complete
  List<String> results = await Future.wait([future1, future2, future3]);
  print('All data fetched: $results');
  
  // Or await individually (still parallel if started together)
  String user = await future1;
  String product = await future2;
  String order = await future3;
  print('User: $user, Product: $product, Order: $order');
}

Future<String> fetchUserData() async {
  await Future.delayed(Duration(milliseconds: 500));
  return 'User data';
}

Future<String> fetchProductData() async {
  await Future.delayed(Duration(milliseconds: 500));
  return 'Product data';
}

Future<String> fetchOrderData() async {
  await Future.delayed(Duration(milliseconds: 500));
  return 'Order data';
}

/**
 * Async generators
 */
Future<void> demonstrateAsyncGenerators() async {
  await for (int value in generateNumbers()) {
    print('Generated: $value');
    if (value >= 5) break; // Stop after 5 values
  }
}

Stream<int> generateNumbers() async* {
  for (int i = 1; i <= 10; i++) {
    await Future.delayed(Duration(milliseconds: 200));
    yield i;
  }
}

/**
 * Practical examples
 */
Future<void> demonstratePracticalExamples() async {
  // Example 1: Fetching multiple resources
  await fetchMultipleResources();
  
  // Example 2: Processing with retry
  await processWithRetry();
  
  // Example 3: Timeout handling
  await handleTimeout();
}

Future<void> fetchMultipleResources() async {
  print('\n--- Fetching Multiple Resources ---');
  try {
    List<Future<Map<String, dynamic>>> futures = [
      fetchResource('users'),
      fetchResource('products'),
      fetchResource('orders')
    ];
    
    List<Map<String, dynamic>> results = await Future.wait(futures);
    print('Fetched ${results.length} resources');
  } catch (e) {
    print('Error fetching resources: $e');
  }
}

Future<Map<String, dynamic>> fetchResource(String resource) async {
  await Future.delayed(Duration(milliseconds: 300));
  return {'resource': resource, 'data': 'Sample data'};
}

Future<void> processWithRetry() async {
  print('\n--- Processing with Retry ---');
  int maxRetries = 3;
  int attempt = 0;
  
  while (attempt < maxRetries) {
    try {
      String result = await processData();
      print('Success: $result');
      return;
    } catch (e) {
      attempt++;
      print('Attempt $attempt failed: $e');
      if (attempt < maxRetries) {
        await Future.delayed(Duration(milliseconds: 500));
      }
    }
  }
  print('All retry attempts failed');
}

Future<String> processData() async {
  await Future.delayed(Duration(milliseconds: 200));
  // Simulate random failure
  if (DateTime.now().millisecond % 2 == 0) {
    throw Exception('Processing failed');
  }
  return 'Processing successful';
}

Future<void> handleTimeout() async {
  print('\n--- Handling Timeout ---');
  try {
    String result = await fetchSlowData().timeout(
      Duration(seconds: 1),
      onTimeout: () => 'Timeout: Using default value'
    );
    print('Result: $result');
  } catch (e) {
    print('Error: $e');
  }
}

Future<String> fetchSlowData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Slow data';
}

/**
 * ADDITIONAL EXAMPLES
 */

// Async function with return value
Future<int> calculateSum(int a, int b) async {
  await Future.delayed(Duration(milliseconds: 100));
  return a + b;
}

// Async function with multiple awaits
Future<String> complexAsyncOperation() async {
  String step1 = await performAsyncStep1();
  String step2 = await performAsyncStep2(step1);
  String step3 = await performAsyncStep3(step2);
  return step3;
}

Future<String> performAsyncStep1() async {
  await Future.delayed(Duration(milliseconds: 200));
  return 'Step1';
}

Future<String> performAsyncStep2(String input) async {
  await Future.delayed(Duration(milliseconds: 200));
  return '$input-Step2';
}

Future<String> performAsyncStep3(String input) async {
  await Future.delayed(Duration(milliseconds: 200));
  return '$input-Step3';
}

// Async function in class
class DataService {
  Future<Map<String, dynamic>> fetchUser(int id) async {
    await Future.delayed(Duration(milliseconds: 300));
    return {'id': id, 'name': 'User $id'};
  }
  
  Future<List<Map<String, dynamic>>> fetchAllUsers() async {
    List<Future<Map<String, dynamic>>> futures = [];
    for (int i = 1; i <= 5; i++) {
      futures.add(fetchUser(i));
    }
    return await Future.wait(futures);
  }
}

// Async with conditional logic
Future<String> fetchDataConditionally(bool useCache) async {
  if (useCache) {
    return await getCachedData();
  } else {
    return await fetchFreshData();
  }
}

Future<String> getCachedData() async {
  await Future.delayed(Duration(milliseconds: 100));
  return 'Cached data';
}

Future<String> fetchFreshData() async {
  await Future.delayed(Duration(milliseconds: 500));
  return 'Fresh data';
}

