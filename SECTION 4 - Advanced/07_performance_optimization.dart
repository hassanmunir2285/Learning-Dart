/**
 * PERFORMANCE OPTIMIZATION IN DART
 * 
 * WHAT IS PERFORMANCE OPTIMIZATION?
 * Performance optimization involves improving the speed, efficiency,
 * and resource usage of Dart applications.
 * 
 * KEY CONCEPTS:
 * 
 * 1. PROFILING:
 *    - Identify bottlenecks
 *    - Measure execution time
 *    - Analyze memory usage
 *    - Use DevTools for profiling
 * 
 * 2. OPTIMIZATION TECHNIQUES:
 *    - Avoid unnecessary computations
 *    - Use efficient data structures
 *    - Minimize object creation
 *    - Cache expensive operations
 * 
 * 3. MEMORY OPTIMIZATION:
 *    - Reuse objects when possible
 *    - Avoid memory leaks
 *    - Use const constructors
 *    - Dispose resources properly
 * 
 * 4. ALGORITHM OPTIMIZATION:
 *    - Choose right data structures
 *    - Optimize loops
 *    - Use efficient algorithms
 *    - Avoid premature optimization
 * 
 * 5. ASYNC OPTIMIZATION:
 *    - Use async/await properly
 *    - Avoid blocking operations
 *    - Parallelize when possible
 *    - Use isolates for CPU-intensive tasks
 * 
 * OPTIMIZATION PRINCIPLES:
 * - Measure before optimizing
 * - Optimize bottlenecks, not everything
 * - Balance readability and performance
 * - Profile, don't guess
 */

void main() {
  print('=== PERFORMANCE OPTIMIZATION IN DART ===\n');
  
  // 1. PROFILING AND MEASUREMENT
  print('--- Profiling and Measurement ---');
  demonstrateProfiling();
  
  // 2. OBJECT CREATION OPTIMIZATION
  print('\n--- Object Creation Optimization ---');
  demonstrateObjectCreation();
  
  // 3. COLLECTION OPTIMIZATION
  print('\n--- Collection Optimization ---');
  demonstrateCollectionOptimization();
  
  // 4. STRING OPTIMIZATION
  print('\n--- String Optimization ---');
  demonstrateStringOptimization();
  
  // 5. LOOP OPTIMIZATION
  print('\n--- Loop Optimization ---');
  demonstrateLoopOptimization();
  
  // 6. CACHING
  print('\n--- Caching ---');
  demonstrateCaching();
  
  // 7. ASYNC OPTIMIZATION
  print('\n--- Async Optimization ---');
  demonstrateAsyncOptimization();
  
  // 8. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  demonstratePracticalExamples();
}

/**
 * Profiling and measurement
 */
void demonstrateProfiling() {
  // Measure execution time
  Stopwatch stopwatch = Stopwatch()..start();
  
  // Simulate work
  int sum = 0;
  for (int i = 0; i < 1000000; i++) {
    sum += i;
  }
  
  stopwatch.stop();
  print('Execution time: ${stopwatch.elapsedMilliseconds}ms');
  print('Sum: $sum');
  
  // Memory usage (conceptual)
  print('\nMemory profiling tips:');
  print('1. Use DevTools for detailed analysis');
  print('2. Monitor heap size');
  print('3. Check for memory leaks');
  print('4. Profile on target devices');
}

/**
 * Object creation optimization
 */
void demonstrateObjectCreation() {
  print('--- Using const constructors ---');
  
  // Good: const objects (created at compile time)
  const String constant = 'Constant string';
  const List<int> constantList = [1, 2, 3];
  
  print('Const objects are created once and reused');
  
  print('\n--- Object pooling ---');
  
  var pool = ObjectPool<StringBuffer>(() => StringBuffer());
  var buffer = pool.acquire();
  buffer.write('Hello');
  print('Buffer: $buffer');
  pool.release(buffer);
}

/**
 * Collection optimization
 */
void demonstrateCollectionOptimization() {
  print('--- Pre-allocate capacity ---');
  
  // Good: Pre-allocate if size is known
  List<int> list = List.filled(1000, 0);
  print('Pre-allocated list with 1000 elements');
  
  // Good: Specify initial capacity
  List<int> dynamicList = []..length = 1000;
  print('Dynamic list with initial capacity');
  
  print('\n--- Efficient lookups ---');
  
  // Use Set for O(1) lookups
  Set<int> numberSet = {1, 2, 3, 4, 5};
  print('Set lookup: ${numberSet.contains(3)}'); // O(1)
  
  // Use Map for key-value lookups
  Map<String, int> map = {'a': 1, 'b': 2, 'c': 3};
  print('Map lookup: ${map['b']}'); // O(1)
  
  print('\n--- Avoid unnecessary operations ---');
  
  // Bad: Multiple iterations
  List<int> numbers = [1, 2, 3, 4, 5];
  // numbers.where((n) => n > 2).map((n) => n * 2).toList(); // Multiple passes
  
  // Good: Single iteration
  List<int> result = [];
  for (int n in numbers) {
    if (n > 2) {
      result.add(n * 2);
    }
  }
  print('Single pass result: $result');
}

/**
 * String optimization
 */
void demonstrateStringOptimization() {
  print('--- String concatenation ---');
  
  // Bad: Multiple concatenations (creates new strings)
  String bad = '';
  for (int i = 0; i < 10; i++) {
    bad += 'Item $i '; // Creates new string each time
  }
  print('Bad concatenation (creates many objects)');
  
  // Good: Use StringBuffer
  StringBuffer buffer = StringBuffer();
  for (int i = 0; i < 10; i++) {
    buffer.write('Item $i ');
  }
  String good = buffer.toString();
  print('Good: Using StringBuffer');
  
  // Good: Use join()
  List<String> items = List.generate(10, (i) => 'Item $i');
  String best = items.join(' ');
  print('Best: Using join()');
  
  print('\n--- String interpolation ---');
  
  // Good: String interpolation
  String name = 'John';
  int age = 30;
  String message = 'Name: $name, Age: $age';
  print(message);
}

/**
 * Loop optimization
 */
void demonstrateLoopOptimization() {
  print('--- Efficient loops ---');
  
  List<int> numbers = List.generate(1000, (i) => i);
  
  // Good: Use for-in for iteration
  int sum1 = 0;
  for (int n in numbers) {
    sum1 += n;
  }
  print('For-in loop sum: $sum1');
  
  // Good: Use forEach for side effects
  int sum2 = 0;
  numbers.forEach((n) => sum2 += n);
  print('ForEach sum: $sum2');
  
  // Good: Use where/map for transformations
  List<int> evens = numbers.where((n) => n % 2 == 0).toList();
  print('Even numbers count: ${evens.length}');
  
  print('\n--- Avoid nested loops when possible ---');
  
  // Bad: O(n²) nested loop
  List<int> list1 = [1, 2, 3];
  List<int> list2 = [4, 5, 6];
  
  // Good: Use Set for lookups
  Set<int> set2 = list2.toSet();
  List<int> common = list1.where((n) => set2.contains(n)).toList();
  print('Common elements: $common');
}

/**
 * Caching
 */
void demonstrateCaching() {
  print('--- Simple cache ---');
  
  // Expensive computation
  int expensiveOperation(int n) {
    // Simulate expensive computation
    return n * n;
  }
  
  var cache = SimpleCache<int, int>(expensiveOperation);
  print('First call (computes): ${cache.get(5)}');
  print('Second call (cached): ${cache.get(5)}');
  
  print('\n--- LRU Cache ---');
  
  var lruCache = LRUCache<String, int>(3);
  lruCache.put('a', 1);
  lruCache.put('b', 2);
  lruCache.put('c', 3);
  print('Cache size: ${lruCache._cache.length}');
  lruCache.put('d', 4); // Removes 'a'
  print('After adding d, cache contains a: ${lruCache.get('a')}');
}

/**
 * Async optimization
 */
void demonstrateAsyncOptimization() {
  print('--- Parallel execution ---');
  
  parallelExecution();
  
  print('\n--- Avoid blocking ---');
  
  // Bad: Blocking operation
  // sleep(Duration(seconds: 1)); // Blocks entire thread
  
  // Good: Non-blocking
  // await Future.delayed(Duration(seconds: 1)); // Non-blocking
}

/**
 * Practical examples
 */
void demonstratePracticalExamples() {
  print('--- Example 1: Efficient search ---');
  
  // Use Set for O(1) lookup
  Set<String> largeSet = Set.from(List.generate(10000, (i) => 'item_$i'));
  bool found = largeSet.contains('item_5000');
  print('Found in Set: $found');
  
  print('\n--- Example 2: Batch processing ---');
  
  // Process in batches
  List<int> data = List.generate(1000, (i) => i);
  int batchSize = 100;
  
  for (int i = 0; i < data.length; i += batchSize) {
    List<int> batch = data.sublist(i, (i + batchSize).clamp(0, data.length));
    // Process batch
    print('Processing batch ${i ~/ batchSize + 1}');
  }
  
  print('\n--- Example 3: Lazy evaluation ---');
  
  // Use Iterable for lazy evaluation
  Iterable<int> numbers = List.generate(1000000, (i) => i);
  int firstLarge = numbers.where((n) => n > 1000).first;
  print('First large number: $firstLarge');
}

// Helper functions for async optimization
Future<void> parallelExecution() async {
  // Start all futures at once
  Future<String> future1 = fetchData1();
  Future<String> future2 = fetchData2();
  Future<String> future3 = fetchData3();
  
  // Wait for all (parallel)
  List<String> results = await Future.wait([future1, future2, future3]);
  print('Parallel results: $results');
}

Future<String> fetchData1() async {
  await Future.delayed(Duration(milliseconds: 300));
  return 'Data 1';
}

Future<String> fetchData2() async {
  await Future.delayed(Duration(milliseconds: 300));
  return 'Data 2';
}

Future<String> fetchData3() async {
  await Future.delayed(Duration(milliseconds: 300));
  return 'Data 3';
}

// Class definitions
class ObjectPool<T> {
  final List<T> _pool = [];
  final T Function() _factory;
  
  ObjectPool(this._factory);
  
  T acquire() {
    if (_pool.isNotEmpty) {
      return _pool.removeLast();
    }
    return _factory();
  }
  
  void release(T obj) {
    _pool.add(obj);
  }
}

class SimpleCache<K, V> {
  final Map<K, V> _cache = {};
  final V Function(K) _compute;
  
  SimpleCache(this._compute);
  
  V get(K key) {
    return _cache.putIfAbsent(key, () => _compute(key));
  }
  
  void clear() => _cache.clear();
}

class LRUCache<K, V> {
  final int _capacity;
  final Map<K, V> _cache = {};
  final List<K> _order = [];
  
  LRUCache(this._capacity);
  
  V? get(K key) {
    if (_cache.containsKey(key)) {
      _order.remove(key);
      _order.add(key);
      return _cache[key];
    }
    return null;
  }
  
  void put(K key, V value) {
    if (_cache.containsKey(key)) {
      _order.remove(key);
    } else if (_cache.length >= _capacity) {
      K oldest = _order.removeAt(0);
      _cache.remove(oldest);
    }
    _cache[key] = value;
    _order.add(key);
  }
}

/**
 * ADDITIONAL EXAMPLES
 */

// Performance monitoring
class PerformanceMonitor {
  final Map<String, Stopwatch> _timers = {};
  
  void start(String name) {
    _timers[name] = Stopwatch()..start();
  }
  
  void stop(String name) {
    _timers[name]?.stop();
    print('$name: ${_timers[name]?.elapsedMilliseconds}ms');
  }
}

// Efficient data structure selection
void demonstrateDataStructureSelection() {
  print('''
Data Structure Selection:

1. List: Use for ordered data, indexed access
2. Set: Use for unique values, fast lookup
3. Map: Use for key-value pairs, fast lookup
4. Queue: Use for FIFO operations
5. LinkedList: Use for frequent insertions/deletions
''');
}

// Memory-efficient patterns
class MemoryEfficient {
  // Use final for immutable data
  final String _data;
  
  MemoryEfficient(this._data);
  
  // Reuse objects
  static final MemoryEfficient _instance = MemoryEfficient('shared');
  static MemoryEfficient get shared => _instance;
}

// Algorithm complexity awareness
void demonstrateComplexity() {
  print('''
Algorithm Complexity:

O(1): Constant time - Best
O(log n): Logarithmic - Very good
O(n): Linear - Good
O(n log n): Linearithmic - Acceptable
O(n²): Quadratic - Avoid for large n
O(2ⁿ): Exponential - Avoid
''');
}

