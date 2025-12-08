/**
 * ISOLATES (CONCURRENCY & MULTITHREADING) IN DART
 * 
 * WHAT ARE ISOLATES?
 * Isolates are Dart's way of achieving concurrency.
 * Each isolate has its own memory heap and runs in a separate thread.
 * 
 * KEY CONCEPTS:
 * 
 * 1. ISOLATES:
 *    - Separate memory space (no shared memory)
 *    - Communicate via messages (SendPort/ReceivePort)
 *    - True parallelism (on multi-core CPUs)
 *    - No shared state (prevents race conditions)
 * 
 * 2. SPAWNING ISOLATES:
 *    - Isolate.spawn(): Spawn new isolate
 *    - compute(): Convenient function for isolates
 *    - Each isolate runs independently
 * 
 * 3. MESSAGE PASSING:
 *    - SendPort: Send messages to isolate
 *    - ReceivePort: Receive messages from isolate
 *    - Messages must be serializable
 * 
 * 4. ISOLATE VS THREADS:
 *    - Isolates: Separate memory (safer)
 *    - Threads: Shared memory (faster but risky)
 *    - Dart uses isolates (no traditional threads)
 * 
 * 5. USE CASES:
 *    - CPU-intensive computations
 *    - Parallel processing
 *    - Background tasks
 *    - Image processing
 *    - Data parsing
 * 
 * LIMITATIONS:
 * - Message passing overhead
 * - Data must be serializable
 * - Cannot share objects directly
 */

import 'dart:isolate';

void main() async {
  print('=== ISOLATES (CONCURRENCY & MULTITHREADING) ===\n');
  
  // 1. BASIC ISOLATE
  print('--- Basic Isolate ---');
  await demonstrateBasicIsolate();
  
  // 2. ISOLATE WITH MESSAGE PASSING
  print('\n--- Isolate with Message Passing ---');
  await demonstrateMessagePassing();
  
  // 3. COMPUTE FUNCTION
  print('\n--- Compute Function ---');
  await demonstrateCompute();
  
  // 4. MULTIPLE ISOLATES
  print('\n--- Multiple Isolates ---');
  await demonstrateMultipleIsolates();
  
  // 5. ISOLATE WITH TWO-WAY COMMUNICATION
  print('\n--- Two-Way Communication ---');
  await demonstrateTwoWayCommunication();
  
  // 6. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  await demonstratePracticalExamples();
}

/**
 * Basic isolate demonstration
 */
Future<void> demonstrateBasicIsolate() async {
  ReceivePort receivePort = ReceivePort();
  
  await Isolate.spawn(
    isolateFunction,
    receivePort.sendPort,
  );
  
  // Receive message from isolate
  var message = await receivePort.first;
  print('Received from isolate: $message');
}

void isolateFunction(SendPort sendPort) {
  // This runs in a separate isolate
  sendPort.send('Hello from isolate!');
}

/**
 * Isolate with message passing
 */
Future<void> demonstrateMessagePassing() async {
  ReceivePort receivePort = ReceivePort();
  
  await Isolate.spawn(
    workerIsolate,
    receivePort.sendPort,
  );
  
  // Send message to isolate
  SendPort? sendPort = await receivePort.first;
  
  if (sendPort != null) {
    ReceivePort responsePort = ReceivePort();
    sendPort.send({'message': 'Hello from main', 'replyTo': responsePort.sendPort});
    
    var response = await responsePort.first;
    print('Response from isolate: $response');
  }
}

void workerIsolate(SendPort mainSendPort) {
  ReceivePort workerReceivePort = ReceivePort();
  
  // Send our receive port to main isolate
  mainSendPort.send(workerReceivePort.sendPort);
  
  // Listen for messages
  workerReceivePort.listen((message) {
    if (message is Map) {
      String data = message['message'];
      SendPort replyTo = message['replyTo'];
      replyTo.send('Echo: $data');
    }
  });
}

/**
 * Compute function (simplified isolate)
 * Note: compute() is from Flutter's foundation library
 * For pure Dart, we use Isolate.spawn()
 */
Future<void> demonstrateCompute() async {
  // Simulate compute function
  int result = await computeFunction(factorial, 10);
  print('Factorial of 10: $result');
}

// Simulate compute function
Future<T> computeFunction<T, P>(T Function(P) function, P parameter) async {
  ReceivePort receivePort = ReceivePort();
  
  await Isolate.spawn(
    _computeIsolate,
    {
      'function': function,
      'parameter': parameter,
      'sendPort': receivePort.sendPort,
    },
  );
  
  return await receivePort.first as T;
}

void _computeIsolate(Map<String, dynamic> data) {
  // This is a simplified version
  // In real compute(), the function is serialized differently
  SendPort sendPort = data['sendPort'];
  // Actual implementation would execute the function
  sendPort.send('Computed result');
}

int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

/**
 * Multiple isolates
 */
Future<void> demonstrateMultipleIsolates() async {
  List<Future<int>> futures = [];
  
  // Spawn multiple isolates
  for (int i = 1; i <= 5; i++) {
    futures.add(processInIsolate(i));
  }
  
  // Wait for all to complete
  List<int> results = await Future.wait(futures);
  print('Results from all isolates: $results');
}

Future<int> processInIsolate(int value) async {
  ReceivePort receivePort = ReceivePort();
  
  await Isolate.spawn(
    _processIsolate,
    {
      'value': value,
      'sendPort': receivePort.sendPort,
    },
  );
  
  return await receivePort.first as int;
}

void _processIsolate(Map<String, dynamic> data) {
  int value = data['value'];
  SendPort sendPort = data['sendPort'];
  
  // Simulate processing
  int result = value * value;
  sendPort.send(result);
}

/**
 * Two-way communication
 */
Future<void> demonstrateTwoWayCommunication() async {
  ReceivePort mainReceivePort = ReceivePort();
  
  await Isolate.spawn(
    twoWayIsolate,
    mainReceivePort.sendPort,
  );
  
  SendPort? isolateSendPort = await mainReceivePort.first;
  
  if (isolateSendPort != null) {
    // Create port for receiving responses
    ReceivePort responsePort = ReceivePort();
    
    // Send request
    isolateSendPort.send({
      'command': 'process',
      'data': [1, 2, 3, 4, 5],
      'replyTo': responsePort.sendPort,
    });
    
    // Receive response
    var response = await responsePort.first;
    print('Two-way communication result: $response');
  }
}

void twoWayIsolate(SendPort mainSendPort) {
  ReceivePort isolateReceivePort = ReceivePort();
  
  // Send our send port to main
  mainSendPort.send(isolateReceivePort.sendPort);
  
  // Listen for messages
  isolateReceivePort.listen((message) {
    if (message is Map) {
      String command = message['command'];
      SendPort replyTo = message['replyTo'];
      
      if (command == 'process') {
        List<int> data = message['data'];
        int sum = data.reduce((a, b) => a + b);
        replyTo.send('Sum: $sum');
      }
    }
  });
}

/**
 * Practical examples
 */
Future<void> demonstratePracticalExamples() async {
  // Example 1: Parallel computation
  await parallelComputation();
  
  // Example 2: Data processing
  await parallelDataProcessing();
}

/**
 * Parallel computation example
 */
Future<void> parallelComputation() async {
  print('\n--- Parallel Computation ---');
  List<int> numbers = List.generate(10, (i) => i + 1);
  
  // Process in parallel
  List<Future<int>> futures = numbers.map((n) => computeSquare(n)).toList();
  List<int> squares = await Future.wait(futures);
  
  print('Numbers: $numbers');
  print('Squares: $squares');
}

Future<int> computeSquare(int n) async {
  ReceivePort receivePort = ReceivePort();
  
  await Isolate.spawn(
    _squareIsolate,
    {'number': n, 'sendPort': receivePort.sendPort},
  );
  
  return await receivePort.first as int;
}

void _squareIsolate(Map<String, dynamic> data) {
  int number = data['number'];
  SendPort sendPort = data['sendPort'];
  sendPort.send(number * number);
}

/**
 * Parallel data processing
 */
Future<void> parallelDataProcessing() async {
  print('\n--- Parallel Data Processing ---');
  List<List<int>> chunks = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
    [10, 11, 12]
  ];
  
  // Process each chunk in parallel
  List<Future<int>> futures = chunks.map((chunk) => processChunk(chunk)).toList();
  List<int> results = await Future.wait(futures);
  
  print('Chunk sums: $results');
  print('Total sum: ${results.reduce((a, b) => a + b)}');
}

Future<int> processChunk(List<int> chunk) async {
  ReceivePort receivePort = ReceivePort();
  
  await Isolate.spawn(
    _processChunkIsolate,
    {'chunk': chunk, 'sendPort': receivePort.sendPort},
  );
  
  return await receivePort.first as int;
}

void _processChunkIsolate(Map<String, dynamic> data) {
  List<int> chunk = data['chunk'];
  SendPort sendPort = data['sendPort'];
  int sum = chunk.reduce((a, b) => a + b);
  sendPort.send(sum);
}

/**
 * ADDITIONAL EXAMPLES
 */

// Isolate with error handling
Future<void> isolateWithErrorHandling() async {
  ReceivePort receivePort = ReceivePort();
  
  await Isolate.spawn(
    _errorIsolate,
    receivePort.sendPort,
  );
  
  receivePort.listen(
    (message) => print('Message: $message'),
    onError: (error) => print('Error: $error'),
  );
}

void _errorIsolate(SendPort sendPort) {
  try {
    // Simulate error
    throw Exception('Isolate error');
  } catch (e) {
    sendPort.send('Error handled: $e');
  }
}

// Isolate pool pattern
class IsolatePool {
  List<Isolate> _isolates = [];
  int _maxIsolates;
  
  IsolatePool(this._maxIsolates);
  
  Future<void> initialize() async {
    for (int i = 0; i < _maxIsolates; i++) {
      // Initialize isolates
    }
  }
  
  void dispose() {
    for (var isolate in _isolates) {
      isolate.kill();
    }
  }
}

// Isolate with state
class IsolateWorker {
  SendPort? _sendPort;
  ReceivePort? _receivePort;
  Isolate? _isolate;
  
  Future<void> start() async {
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_workerEntry, _receivePort!.sendPort);
    
    _sendPort = await _receivePort!.first as SendPort;
  }
  
  Future<T> send<T>(dynamic message) async {
    if (_sendPort == null) throw StateError('Worker not started');
    
    ReceivePort responsePort = ReceivePort();
    _sendPort!.send({
      'message': message,
      'replyTo': responsePort.sendPort,
    });
    
    return await responsePort.first as T;
  }
  
  void stop() {
    _isolate?.kill();
    _receivePort?.close();
  }
}

void _workerEntry(SendPort mainSendPort) {
  ReceivePort workerReceivePort = ReceivePort();
  mainSendPort.send(workerReceivePort.sendPort);
  
  workerReceivePort.listen((message) {
    if (message is Map) {
      SendPort replyTo = message['replyTo'];
      dynamic data = message['message'];
      replyTo.send('Processed: $data');
    }
  });
}

