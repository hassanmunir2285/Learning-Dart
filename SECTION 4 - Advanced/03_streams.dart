/**
 * STREAMS IN DART
 * 
 * WHAT IS A STREAM?
 * A Stream is a sequence of asynchronous events.
 * It's like a Future, but instead of a single value, it provides multiple values over time.
 * 
 * KEY CONCEPTS:
 * 
 * 1. STREAM BASICS:
 *    - Represents sequence of asynchronous events
 *    - Can emit multiple values
 *    - Can emit errors
 *    - Can be closed
 * 
 * 2. LISTENING TO STREAMS:
 *    - listen(): Subscribe to stream events
 *    - onData: Handle data events
 *    - onError: Handle error events
 *    - onDone: Handle completion
 *    - cancel(): Stop listening
 * 
 * 3. STREAM METHODS:
 *    - map(): Transform each event
 *    - where(): Filter events
 *    - take(): Take first N events
 *    - skip(): Skip first N events
 *    - listen(): Subscribe to stream
 * 
 * 4. CREATING STREAMS:
 *    - Stream.fromIterable(): From list
 *    - Stream.periodic(): Periodic events
 *    - Stream.fromFuture(): From single future
 *    - StreamController: Manual control
 * 
 * 5. ASYNC GENERATORS:
 *    - async*: Create stream from function
 *    - yield: Emit value to stream
 *    - yield*: Emit another stream
 * 
 * USE CASES:
 * - Real-time data (chat, notifications)
 * - File reading (line by line)
 * - User input events
 * - WebSocket connections
 * - Event-driven programming
 */

import 'dart:async';

void main() async {
  print('=== STREAMS IN DART ===\n');
  
  // 1. BASIC STREAM
  print('--- Basic Stream ---');
  await demonstrateBasicStream();
  
  // 2. STREAM FROM ITERABLE
  print('\n--- Stream from Iterable ---');
  await demonstrateStreamFromIterable();
  
  // 3. STREAM.PERIODIC
  print('\n--- Stream.periodic() ---');
  await demonstrateStreamPeriodic();
  
  // 4. STREAM METHODS
  print('\n--- Stream Methods ---');
  await demonstrateStreamMethods();
  
  // 5. ASYNC GENERATOR
  print('\n--- Async Generator (async*) ---');
  await demonstrateAsyncGenerator();
  
  // 6. STREAM TRANSFORMATIONS
  print('\n--- Stream Transformations ---');
  await demonstrateStreamTransformations();
  
  // 7. STREAM BROADCAST
  print('\n--- Stream Broadcast ---');
  await demonstrateStreamBroadcast();
  
  // 8. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  await demonstratePracticalExamples();
}

/**
 * Basic stream demonstration
 */
Future<void> demonstrateBasicStream() async {
  Stream<int> stream = Stream.fromIterable([1, 2, 3, 4, 5]);
  
  stream.listen(
    (value) => print('Received: $value'),
    onError: (error) => print('Error: $error'),
    onDone: () => print('Stream completed'),
  );
  
  await Future.delayed(Duration(milliseconds: 100));
}

/**
 * Stream from iterable
 */
Future<void> demonstrateStreamFromIterable() async {
  List<String> names = ['Alice', 'Bob', 'Charlie', 'David'];
  Stream<String> nameStream = Stream.fromIterable(names);
  
  await for (String name in nameStream) {
    print('Name: $name');
  }
}

/**
 * Stream.periodic
 */
Future<void> demonstrateStreamPeriodic() async {
  Stream<int> periodicStream = Stream.periodic(
    Duration(milliseconds: 500),
    (count) => count
  ).take(5); // Take only first 5 values
  
  await for (int value in periodicStream) {
    print('Periodic value: $value');
  }
}

/**
 * Stream methods
 */
Future<void> demonstrateStreamMethods() async {
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
  
  // map(): Transform values
  Stream<String> mapped = numbers.map((n) => 'Number $n');
  print('Mapped stream:');
  await for (String value in mapped.take(3)) {
    print('  $value');
  }
  
  // where(): Filter values
  Stream<int> evens = Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
      .where((n) => n % 2 == 0);
  print('\nEven numbers:');
  await for (int value in evens) {
    print('  $value');
  }
  
  // take(): Take first N values
  Stream<int> firstThree = Stream.fromIterable([1, 2, 3, 4, 5]).take(3);
  print('\nFirst 3 values:');
  await for (int value in firstThree) {
    print('  $value');
  }
  
  // skip(): Skip first N values
  Stream<int> skipped = Stream.fromIterable([1, 2, 3, 4, 5]).skip(2);
  print('\nAfter skipping 2:');
  await for (int value in skipped) {
    print('  $value');
  }
}

/**
 * Async generator (async*)
 */
Future<void> demonstrateAsyncGenerator() async {
  Stream<int> numberStream = generateNumbers(5);
  
  await for (int number in numberStream) {
    print('Generated: $number');
  }
}

Stream<int> generateNumbers(int count) async* {
  for (int i = 1; i <= count; i++) {
    await Future.delayed(Duration(milliseconds: 300));
    yield i;
  }
}

/**
 * Stream transformations
 */
Future<void> demonstrateStreamTransformations() async {
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4, 5]);
  
  // Chain transformations
  Stream<String> result = numbers
      .where((n) => n > 2)        // Filter: [3, 4, 5]
      .map((n) => n * 2)          // Transform: [6, 8, 10]
      .map((n) => 'Value: $n');   // Transform: ['Value: 6', ...]
  
  print('Transformed stream:');
  await for (String value in result) {
    print('  $value');
  }
}

/**
 * Stream broadcast (multiple listeners)
 */
Future<void> demonstrateStreamBroadcast() async {
  StreamController<int> controller = StreamController<int>.broadcast();
  Stream<int> broadcastStream = controller.stream;
  
  // First listener
  broadcastStream.listen((value) => print('Listener 1: $value'));
  
  // Second listener
  broadcastStream.listen((value) => print('Listener 2: $value'));
  
  // Emit values
  controller.add(1);
  controller.add(2);
  controller.add(3);
  
  await Future.delayed(Duration(milliseconds: 100));
  controller.close();
}

/**
 * Practical examples
 */
Future<void> demonstratePracticalExamples() async {
  // Example 1: Countdown timer
  await countdownTimer(5);
  
  // Example 2: Processing file lines
  await processFileLines();
  
  // Example 3: Event stream
  await eventStream();
}

/**
 * Countdown timer stream
 */
Future<void> countdownTimer(int seconds) async {
  print('\n--- Countdown Timer ---');
  Stream<int> timer = Stream.periodic(
    Duration(seconds: 1),
    (count) => seconds - count
  ).take(seconds + 1);
  
  await for (int remaining in timer) {
    if (remaining > 0) {
      print('Time remaining: $remaining seconds');
    } else {
      print('Time\'s up!');
    }
  }
}

/**
 * Process file lines (simulated)
 */
Future<void> processFileLines() async {
  print('\n--- Processing File Lines ---');
  List<String> lines = ['Line 1', 'Line 2', 'Line 3', 'Line 4', 'Line 5'];
  Stream<String> lineStream = Stream.fromIterable(lines);
  
  int lineNumber = 1;
  await for (String line in lineStream) {
    print('Processing line $lineNumber: $line');
    await Future.delayed(Duration(milliseconds: 200));
    lineNumber++;
  }
}

/**
 * Event stream example
 */
Future<void> eventStream() async {
  print('\n--- Event Stream ---');
  StreamController<String> eventController = StreamController<String>();
  
  // Listen to events
  eventController.stream.listen((event) {
    print('Event received: $event');
  });
  
  // Emit events
  eventController.add('User logged in');
  await Future.delayed(Duration(milliseconds: 100));
  
  eventController.add('Data updated');
  await Future.delayed(Duration(milliseconds: 100));
  
  eventController.add('User logged out');
  await Future.delayed(Duration(milliseconds: 100));
  
  eventController.close();
}

/**
 * ADDITIONAL EXAMPLES
 */

// Stream with error handling
Stream<int> streamWithErrors() async* {
  for (int i = 1; i <= 5; i++) {
    if (i == 3) {
      throw Exception('Error at $i');
    }
    yield i;
  }
}

// Stream subscription management
void demonstrateSubscription() {
  Stream<int> stream = Stream.periodic(
    Duration(milliseconds: 500),
    (count) => count
  );
  
  late StreamSubscription<int> subscription;
  subscription = stream.listen(
    (value) {
      print('Value: $value');
      if (value >= 5) {
        subscription.cancel(); // Cancel subscription
      }
    },
    onError: (error) => print('Error: $error'),
    onDone: () => print('Done'),
  );
}

// Stream with buffer
Future<void> demonstrateBufferedStream() async {
  StreamController<int> controller = StreamController<int>();
  
  // Add values
  for (int i = 1; i <= 10; i++) {
    controller.add(i);
  }
  
  // Listen with buffer
  controller.stream.listen(
    (value) => print('Buffered: $value'),
    onDone: () => print('Stream closed'),
  );
  
  await Future.delayed(Duration(milliseconds: 100));
  controller.close();
}

// Stream combining
Future<void> demonstrateStreamCombining() async {
  Stream<int> stream1 = Stream.fromIterable([1, 2, 3]);
  Stream<int> stream2 = Stream.fromIterable([4, 5, 6]);
  
  // Combine streams
  Stream<int> combined = Stream.fromFuture(
    Future.wait([stream1.toList(), stream2.toList()])
  ).asyncExpand((lists) => Stream.fromIterable(lists.expand((list) => list)));
  
  print('Combined stream:');
  await for (int value in combined) {
    print('  $value');
  }
}

// Stream with distinct values
Future<void> demonstrateDistinctStream() async {
  Stream<int> numbers = Stream.fromIterable([1, 2, 2, 3, 3, 3, 4, 5]);
  
  Stream<int> distinct = numbers.distinct();
  print('Distinct values:');
  await for (int value in distinct) {
    print('  $value');
  }
}

