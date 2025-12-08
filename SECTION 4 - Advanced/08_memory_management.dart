/**
 * MEMORY MANAGEMENT IN DART
 * 
 * WHAT IS MEMORY MANAGEMENT?
 * Memory management involves controlling how memory is allocated,
 * used, and freed in Dart applications.
 * 
 * KEY CONCEPTS:
 * 
 * 1. GARBAGE COLLECTION:
 *    - Automatic memory management
 *    - Dart uses generational garbage collector
 *    - Young generation (new objects)
 *    - Old generation (long-lived objects)
 * 
 * 2. MEMORY LEAKS:
 *    - Objects not freed when no longer needed
 *    - Common causes: Streams, timers, closures
 *    - Prevention: Proper disposal and cleanup
 * 
 * 3. MEMORY OPTIMIZATION:
 *    - Use const constructors
 *    - Reuse objects when possible
 *    - Dispose resources properly
 *    - Avoid unnecessary object creation
 * 
 * 4. RESOURCE MANAGEMENT:
 *    - Close streams and controllers
 *    - Cancel timers and subscriptions
 *    - Dispose file handles
 *    - Release native resources
 * 
 * 5. MEMORY PROFILING:
 *    - Use DevTools for analysis
 *    - Monitor heap size
 *    - Identify memory leaks
 *    - Track object allocation
 * 
 * BEST PRACTICES:
 * - Always dispose resources
 * - Use weak references when appropriate
 * - Monitor memory usage
 * - Profile regularly
 */

import 'dart:async';

void main() {
  print('=== MEMORY MANAGEMENT IN DART ===\n');
  
  // 1. GARBAGE COLLECTION
  print('--- Garbage Collection ---');
  demonstrateGarbageCollection();
  
  // 2. MEMORY LEAKS
  print('\n--- Memory Leaks ---');
  demonstrateMemoryLeaks();
  
  // 3. RESOURCE DISPOSAL
  print('\n--- Resource Disposal ---');
  demonstrateResourceDisposal();
  
  // 4. OBJECT REUSE
  print('\n--- Object Reuse ---');
  demonstrateObjectReuse();
  
  // 5. WEAK REFERENCES
  print('\n--- Weak References ---');
  demonstrateWeakReferences();
  
  // 6. MEMORY PROFILING
  print('\n--- Memory Profiling ---');
  demonstrateMemoryProfiling();
  
  // 7. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  demonstratePracticalExamples();
}

/**
 * Garbage collection
 */
void demonstrateGarbageCollection() {
  print('Dart uses automatic garbage collection:');
  print('1. Young generation: New objects');
  print('2. Old generation: Long-lived objects');
  print('3. Automatic cleanup when objects are unreachable');
  
  // Objects become eligible for GC when unreachable
  {
    String temp = 'Temporary object';
    print('Created: $temp');
  } // temp is now eligible for GC
  
  print('Object is now eligible for garbage collection');
  
  // Force GC (not recommended in production)
  // Note: There's no direct way to force GC in Dart
  print('\nGC runs automatically when needed');
}

/**
 * Memory leaks
 */
void demonstrateMemoryLeaks() {
  print('Common memory leak causes:');
  
  // 1. Stream subscriptions not cancelled
  print('\n1. Stream subscriptions:');
  StreamController<int> controller = StreamController<int>();
  StreamSubscription<int>? subscription = controller.stream.listen((value) {
    print('Value: $value');
  });
  
  // Always cancel subscriptions
  subscription.cancel();
  controller.close();
  print('Subscription cancelled and controller closed');
  
  // 2. Timers not cancelled
  print('\n2. Timers:');
  Timer? timer = Timer.periodic(Duration(seconds: 1), (t) {
    print('Timer tick');
  });
  
  // Always cancel timers
  timer.cancel();
  print('Timer cancelled');
  
  // 3. Closures holding references
  print('\n3. Closures:');
  DataHolder holder = DataHolder();
  holder.process();
  print('Be careful with closures holding large references');
}

/**
 * Resource disposal
 */
void demonstrateResourceDisposal() {
  print('Proper resource disposal:');
  
  // Using try-finally
  Resource resource = Resource('MyResource');
  try {
    resource.use();
  } finally {
    resource.dispose();
  }
  
  // Using using pattern
  print('\nUsing pattern:');
  usingResource(() {
    print('Resource is available here');
  });
}

// Disposable interface
abstract class Disposable {
  void dispose();
}

// Resource class
class Resource implements Disposable {
  final String _name;
  bool _disposed = false;
  
  Resource(this._name);
  
  void use() {
    if (_disposed) throw StateError('Resource disposed');
    print('Using $_name');
  }
  
  @override
  void dispose() {
    if (!_disposed) {
      print('Disposing $_name');
      _disposed = true;
    }
  }
}

// Using pattern helper
void usingResource(void Function() action) {
  Resource resource = Resource('TemporaryResource');
  try {
    action();
  } finally {
    resource.dispose();
  }
}

/**
 * Object reuse
 */
void demonstrateObjectReuse() {
  print('Object reuse patterns:');
  
  // StringBuffer pool
  var bufferPool = ObjectPool<StringBuffer>(
    () => StringBuffer(),
    (buffer) => buffer.clear(),
  );
  
  StringBuffer buffer = bufferPool.acquire();
  buffer.write('Hello');
  print('Buffer: ${buffer.toString()}');
  bufferPool.release(buffer);
  
  // Reuse buffer
  StringBuffer buffer2 = bufferPool.acquire();
  print('Reused buffer (empty): ${buffer2.toString()}');
  bufferPool.release(buffer2);
}

/**
 * Weak references
 * Note: Dart doesn't have built-in weak references
 * This is a conceptual example
 */
void demonstrateWeakReferences() {
  print('Weak references (conceptual):');
  print('''
Weak references allow objects to be garbage collected
even if there's a reference to them.

Use cases:
- Caching without preventing GC
- Observer patterns
- Event listeners

Note: Dart doesn't have built-in weak references,
but you can implement similar patterns.
''');
  
  String data = 'Some data';
  WeakReference<String> weakRef = WeakReference(data);
  print('Weak reference target: ${weakRef.target}');
  
  data = 'New data'; // Original may be GC'd
  print('After reassignment, weak ref may be null');
}

/**
 * Memory profiling
 */
void demonstrateMemoryProfiling() {
  print('Memory profiling techniques:');
  
  print('''
1. Use DevTools:
   - Memory tab
   - Heap snapshots
   - Allocation tracking

2. Monitor heap size:
   - Track memory usage over time
   - Identify growth patterns
   - Find memory leaks

3. Profile on target devices:
   - Test on actual hardware
   - Consider device limitations
   - Optimize for target platform

4. Use memory profilers:
   - DevTools memory profiler
   - Observatory (legacy)
   - Custom memory tracking
''');
  
  MemoryTracker.allocate(100);
  MemoryTracker.allocate(200);
  MemoryTracker.free(100);
  print('Current memory: ${MemoryTracker.current} bytes');
}

/**
 * Practical examples
 */
void demonstratePracticalExamples() {
  print('--- Example 1: Stream Management ---');
  
  StreamManager manager = StreamManager();
  StreamController<String> controller = StreamController<String>();
  manager.subscribe(controller.stream, (data) => print('Data: $data'));
  
  controller.add('Test');
  manager.dispose();
  controller.close();
  
  print('\n--- Example 2: Timer Management ---');
  
  TimerManager timerManager = TimerManager();
  timerManager.addPeriodic(Duration(milliseconds: 100), (t) {
    print('Timer tick');
    if (timerManager._timers.length > 0) {
      timerManager.dispose();
    }
  });
  
  print('\n--- Example 3: Resource Manager ---');
  
  ResourceManager resourceManager = ResourceManager();
  resourceManager.add(Resource('Resource1'));
  resourceManager.add(Resource('Resource2'));
  resourceManager.dispose();
}

// Class definitions
class DataHolder {
  final List<int> _data = List.generate(1000, (i) => i);
  
  void process() {
    // Closure holds reference to _data
    Timer(Duration(seconds: 1), () {
      print('Data length: ${_data.length}');
    });
  }
}

class ObjectPool<T> {
  final List<T> _pool = [];
  final T Function() _factory;
  final void Function(T)? _reset;
  
  ObjectPool(this._factory, [this._reset]);
  
  T acquire() {
    if (_pool.isNotEmpty) {
      return _pool.removeLast();
    }
    return _factory();
  }
  
  void release(T obj) {
    _reset?.call(obj);
    _pool.add(obj);
  }
}

class MemoryTracker {
  static int _allocated = 0;
  static int _freed = 0;
  
  static void allocate(int size) {
    _allocated += size;
    print('Allocated: $_allocated bytes');
  }
  
  static void free(int size) {
    _freed += size;
    print('Freed: $_freed bytes');
  }
  
  static int get current => _allocated - _freed;
}

class StreamManager {
  final List<StreamSubscription> _subscriptions = [];
  
  void subscribe<T>(Stream<T> stream, void Function(T) onData) {
    _subscriptions.add(stream.listen(onData));
  }
  
  void dispose() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();
    print('All subscriptions cancelled');
  }
}

class TimerManager {
  final List<Timer> _timers = [];
  
  Timer addPeriodic(Duration duration, void Function(Timer) callback) {
    Timer timer = Timer.periodic(duration, callback);
    _timers.add(timer);
    return timer;
  }
  
  void dispose() {
    for (var timer in _timers) {
      timer.cancel();
    }
    _timers.clear();
    print('All timers cancelled');
  }
}

class ResourceManager implements Disposable {
  final List<Disposable> _resources = [];
  
  void add(Disposable resource) {
    _resources.add(resource);
  }
  
  @override
  void dispose() {
    for (var resource in _resources.reversed) {
      resource.dispose();
    }
    _resources.clear();
    print('All resources disposed');
  }
}

/**
 * ADDITIONAL EXAMPLES
 */

// Finalizer pattern (Dart 2.17+)
class FinalizableResource {
  final String _name;
  
  FinalizableResource(this._name) {
    // Register finalizer
    // Finalizer.attach(this, _name, (name) => cleanup(name));
  }
  
  static void cleanup(String name) {
    print('Cleaning up: $name');
  }
}

// Memory-efficient collection
class MemoryEfficientList<T> {
  final List<T?> _data = [];
  int _size = 0;
  
  void add(T item) {
    if (_size < _data.length) {
      _data[_size] = item;
    } else {
      _data.add(item);
    }
    _size++;
  }
  
  void clear() {
    // Null out references to help GC
    for (int i = 0; i < _size; i++) {
      _data[i] = null;
    }
    _size = 0;
  }
  
  T? operator [](int index) => _data[index];
}

// Lazy initialization
class LazyResource {
  String? _data;
  
  String get data {
    _data ??= _loadData();
    return _data!;
  }
  
  String _loadData() {
    print('Loading data...');
    return 'Loaded data';
  }
  
  void clear() {
    _data = null; // Allow GC
  }
}

// Memory-aware cache
class MemoryAwareCache<K, V> {
  final Map<K, V> _cache = {};
  final int _maxSize;
  
  MemoryAwareCache(this._maxSize);
  
  V? get(K key) => _cache[key];
  
  void put(K key, V value) {
    if (_cache.length >= _maxSize && !_cache.containsKey(key)) {
      // Remove oldest (simple FIFO)
      K firstKey = _cache.keys.first;
      _cache.remove(firstKey);
    }
    _cache[key] = value;
  }
  
  void clear() {
    _cache.clear();
  }
}

