/**
 * STREAM CONTROLLERS IN DART
 * 
 * WHAT IS A STREAM CONTROLLER?
 * A StreamController gives you full control over a stream.
 * You can manually add events, errors, and close the stream.
 * 
 * KEY CONCEPTS:
 * 
 * 1. STREAM CONTROLLER:
 *    - Creates and manages a stream
 *    - Allows manual event emission
 *    - Provides stream and sink
 * 
 * 2. STREAM VS SINK:
 *    - stream: For listening (reading)
 *    - sink: For adding events (writing)
 * 
 * 3. TYPES OF STREAM CONTROLLERS:
 *    - Single-subscription: Only one listener allowed
 *    - Broadcast: Multiple listeners allowed
 * 
 * 4. STREAM CONTROLLER METHODS:
 *    - add(): Add data event
 *    - addError(): Add error event
 *    - close(): Close the stream
 *    - stream: Get the stream
 *    - sink: Get the sink
 * 
 * 5. USE CASES:
 *    - Custom event systems
 *    - Data transformation pipelines
 *    - Real-time data broadcasting
 *    - Manual stream creation
 * 
 * BEST PRACTICES:
 * - Always close controllers when done
 * - Handle errors properly
 * - Use broadcast for multiple listeners
 * - Don't add events after closing
 */

import 'dart:async';

void main() async {
  print('=== STREAM CONTROLLERS IN DART ===\n');
  
  // 1. BASIC STREAM CONTROLLER
  print('--- Basic Stream Controller ---');
  await demonstrateBasicController();
  
  // 2. SINGLE-SUBSCRIPTION CONTROLLER
  print('\n--- Single-Subscription Controller ---');
  await demonstrateSingleSubscription();
  
  // 3. BROADCAST CONTROLLER
  print('\n--- Broadcast Controller ---');
  await demonstrateBroadcastController();
  
  // 4. STREAM CONTROLLER WITH ERRORS
  print('\n--- Stream Controller with Errors ---');
  await demonstrateControllerWithErrors();
  
  // 5. STREAM CONTROLLER METHODS
  print('\n--- Stream Controller Methods ---');
  await demonstrateControllerMethods();
  
  // 6. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  await demonstratePracticalExamples();
}

/**
 * Basic stream controller
 */
Future<void> demonstrateBasicController() async {
  StreamController<String> controller = StreamController<String>();
  
  // Listen to stream
  controller.stream.listen(
    (data) => print('Received: $data'),
    onError: (error) => print('Error: $error'),
    onDone: () => print('Stream closed'),
  );
  
  // Add events
  controller.add('Event 1');
  controller.add('Event 2');
  controller.add('Event 3');
  
  // Close controller
  await controller.close();
}

/**
 * Single-subscription controller
 * Only one listener allowed
 */
Future<void> demonstrateSingleSubscription() async {
  StreamController<int> controller = StreamController<int>();
  
  // First listener (allowed)
  controller.stream.listen((value) => print('Listener 1: $value'));
  
  // Second listener would cause error
  // controller.stream.listen((value) => print('Listener 2: $value')); // Error!
  
  controller.add(1);
  controller.add(2);
  
  await controller.close();
}

/**
 * Broadcast controller
 * Multiple listeners allowed
 */
Future<void> demonstrateBroadcastController() async {
  StreamController<String> controller = StreamController<String>.broadcast();
  
  // Multiple listeners (allowed)
  controller.stream.listen((value) => print('Listener 1: $value'));
  controller.stream.listen((value) => print('Listener 2: $value'));
  controller.stream.listen((value) => print('Listener 3: $value'));
  
  // Add events (all listeners receive them)
  controller.add('Broadcast message 1');
  controller.add('Broadcast message 2');
  
  await Future.delayed(Duration(milliseconds: 100));
  await controller.close();
}

/**
 * Stream controller with errors
 */
Future<void> demonstrateControllerWithErrors() async {
  StreamController<int> controller = StreamController<int>();
  
  controller.stream.listen(
    (value) => print('Value: $value'),
    onError: (error) => print('Error received: $error'),
    onDone: () => print('Done'),
  );
  
  controller.add(1);
  controller.add(2);
  controller.addError('Something went wrong');
  controller.add(3);
  
  await controller.close();
}

/**
 * Stream controller methods
 */
Future<void> demonstrateControllerMethods() async {
  StreamController<String> controller = StreamController<String>();
  
  // Using sink
  controller.sink.add('Using sink.add()');
  controller.sink.add('Another message');
  
  // Using controller directly
  controller.add('Using controller.add()');
  
  // Check if closed
  print('Is closed: ${controller.isClosed}');
  print('Has listener: ${controller.hasListener}');
  
  // Listen to stream
  controller.stream.listen((value) => print('Received: $value'));
  
  await Future.delayed(Duration(milliseconds: 100));
  await controller.close();
}

/**
 * Practical examples
 */
Future<void> demonstratePracticalExamples() async {
  // Example 1: Event bus
  await demonstrateEventBus();
  
  // Example 2: Data processor
  await demonstrateDataProcessor();
  
  // Example 3: Real-time updates
  await demonstrateRealTimeUpdates();
}

/**
 * Event bus example
 */
Future<void> demonstrateEventBus() async {
  print('\n--- Event Bus Example ---');
  StreamController<Map<String, dynamic>> eventBus =
      StreamController<Map<String, dynamic>>.broadcast();
  
  // Subscribe to events
  eventBus.stream.listen((event) {
    print('Event: ${event['type']} - ${event['data']}');
  });
  
  // Emit events
  eventBus.add({'type': 'user_login', 'data': 'User logged in'});
  await Future.delayed(Duration(milliseconds: 100));
  
  eventBus.add({'type': 'data_update', 'data': 'Data updated'});
  await Future.delayed(Duration(milliseconds: 100));
  
  await eventBus.close();
}

/**
 * Data processor example
 */
Future<void> demonstrateDataProcessor() async {
  print('\n--- Data Processor Example ---');
  StreamController<int> inputController = StreamController<int>();
  StreamController<int> outputController = StreamController<int>();
  
  // Process input stream
  inputController.stream
      .map((value) => value * 2)
      .where((value) => value > 5)
      .listen((value) {
    outputController.add(value);
  });
  
  // Listen to output
  outputController.stream.listen((value) {
    print('Processed value: $value');
  });
  
  // Add input values
  for (int i = 1; i <= 10; i++) {
    inputController.add(i);
  }
  
  await Future.delayed(Duration(milliseconds: 100));
  await inputController.close();
  await outputController.close();
}

/**
 * Real-time updates example
 */
Future<void> demonstrateRealTimeUpdates() async {
  print('\n--- Real-time Updates Example ---');
  StreamController<int> updateController =
      StreamController<int>.broadcast();
  
  // Multiple subscribers
  updateController.stream.listen((value) {
    print('Subscriber 1: Update $value');
  });
  
  updateController.stream.listen((value) {
    print('Subscriber 2: Update $value');
  });
  
  // Simulate real-time updates
  for (int i = 1; i <= 5; i++) {
    updateController.add(i);
    await Future.delayed(Duration(milliseconds: 300));
  }
  
  await updateController.close();
}

/**
 * ADDITIONAL EXAMPLES
 */

// Stream controller with transformation
class DataTransformer {
  StreamController<int> _inputController = StreamController<int>();
  StreamController<String> _outputController = StreamController<String>();
  
  DataTransformer() {
    _inputController.stream
        .map((value) => 'Transformed: $value')
        .listen(_outputController.add);
  }
  
  Stream<String> get output => _outputController.stream;
  Sink<int> get input => _inputController.sink;
  
  void dispose() {
    _inputController.close();
    _outputController.close();
  }
}

// Stream controller with buffering
class BufferedStreamController<T> {
  StreamController<T> _controller = StreamController<T>();
  List<T> _buffer = [];
  bool _isBuffering = true;
  
  BufferedStreamController() {
    _controller.stream.listen((value) {
      if (_isBuffering) {
        _buffer.add(value);
      }
    });
  }
  
  void startBuffering() => _isBuffering = true;
  
  void stopBuffering() {
    _isBuffering = false;
    // Emit buffered values
    for (T value in _buffer) {
      _controller.add(value);
    }
    _buffer.clear();
  }
  
  void add(T value) => _controller.add(value);
  Stream<T> get stream => _controller.stream;
  void close() => _controller.close();
}

// Stream controller with error recovery
class ResilientStreamController<T> {
  StreamController<T> _controller = StreamController<T>();
  int _errorCount = 0;
  static const int maxErrors = 3;
  
  ResilientStreamController() {
    _controller.stream.listen(
      (value) {
        _errorCount = 0; // Reset on success
        print('Success: $value');
      },
      onError: (error) {
        _errorCount++;
        print('Error $_errorCount: $error');
        if (_errorCount >= maxErrors) {
          print('Max errors reached. Closing stream.');
          _controller.close();
        }
      },
    );
  }
  
  void add(T value) => _controller.add(value);
  void addError(Object error) => _controller.addError(error);
  Stream<T> get stream => _controller.stream;
  void close() => _controller.close();
}

// Stream controller with rate limiting
class RateLimitedController<T> {
  StreamController<T> _controller = StreamController<T>();
  DateTime? _lastEmit;
  Duration _minInterval;
  
  RateLimitedController(this._minInterval) {
    _controller.stream.listen((value) {
      DateTime now = DateTime.now();
      if (_lastEmit == null ||
          now.difference(_lastEmit!) >= _minInterval) {
        print('Emitted: $value');
        _lastEmit = now;
      } else {
        print('Rate limited: $value');
      }
    });
  }
  
  void add(T value) => _controller.add(value);
  Stream<T> get stream => _controller.stream;
  void close() => _controller.close();
}

