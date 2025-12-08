/**
 * GENERICS IN DART
 * 
 * WHAT ARE GENERICS?
 * Generics allow you to write code that works with different types
 * while maintaining type safety.
 * 
 * KEY CONCEPTS:
 * 
 * 1. GENERIC CLASSES:
 *    - Classes that can work with any type
 *    - Syntax: class ClassName<T> { }
 *    - T is a type parameter (can be any name)
 * 
 * 2. GENERIC METHODS:
 *    - Methods that can work with different types
 *    - Syntax: ReturnType methodName<T>(T param) { }
 * 
 * 3. TYPE PARAMETERS:
 *    - Placeholders for types (T, E, K, V are common)
 *    - Can have constraints using 'extends'
 *    - Can have multiple type parameters
 * 
 * 4. TYPE CONSTRAINTS:
 *    - Restrict generic types
 *    - Syntax: class ClassName<T extends BaseClass> { }
 *    - Ensures type has certain properties
 * 
 * BENEFITS:
 * - Type Safety: Compile-time type checking
 * - Code Reusability: Write once, use with multiple types
 * - Performance: No runtime type checking overhead
 * - Better IDE Support: Autocomplete and error detection
 * 
 * COMMON USE CASES:
 * - Collections (List<T>, Map<K,V>)
 * - Data structures (Stack<T>, Queue<T>)
 * - Repositories and services
 * - API responses
 */

void main() {
  print('=== GENERICS IN DART ===\n');
  
  simpleGenricClass();
  simpleGenricFunction();
  multipleTypeParameters();
  genericInheritance();
  genericMethodInClass();
  genericCollection();
  grnericVsDynamic();
  genericWithCovarient();
  genericExamples();
  
  // Additional examples
  print('\n--- Additional Examples ---');
  demonstrateAdditionalExamples();
}

/**
 * Simple Generic Class
 * Box that can hold any type
 */
class Box<P> {
  P value;
  Box(this.value);
  
  void show() {
    print("Value: $value, Type: ${value.runtimeType}");
  }
  
  P getValue() => value;
  
  void setValue(P newValue) {
    value = newValue;
  }
}

void simpleGenricClass() {
  print('--- Simple Generic Class ---');
  var intBox = Box<int>(10);
  intBox.show(); // Value: 10, Type: int
  
  var stringBox = Box<String>("Hello");
  stringBox.show(); // Value: Hello, Type: String
  
  var boolBox = Box<bool>(true);
  boolBox.show(); // Value: true, Type: bool
}

/**
 * Simple Generic Function
 * Function that works with any type
 */
T identity<T>(T value) {
  return value;
}

void simpleGenricFunction() {
  print('\n--- Simple Generic Function ---');
  print(identity(100));         // 100
  print(identity<String>("Hi")); // Hi
  print(identity<bool>(true));   // true
  print(identity<double>(3.14)); // 3.14
}

/**
 * Multiple Type Parameters
 * Class with multiple generic types
 */
class Pair<K, V> {
  // K and V are two different type parameters
  K key;
  V value;
  
  Pair(this.key, this.value);
  
  @override
  String toString() => 'Pair($key, $value)';
}

void multipleTypeParameters() {
  print('\n--- Multiple Type Parameters ---');
  var pair = Pair<int, String>(1, "One");
  print("${pair.key} → ${pair.value}"); // 1 → One
  
  var obj = Pair<bool, double>(false, 3.14);
  print("${obj.key} and ${obj.value}"); // false → 3.14
  
  var nameAge = Pair<String, int>("Alice", 25);
  print("${nameAge.key} is ${nameAge.value} years old");
}

/**
 * Generic with Inheritance
 * Constraining generic types
 */
class Animal {
  void sound() => print("Some sound");
}

class Dog extends Animal {
  @override
  void sound() => print("Bark");
}

class Cat extends Animal {
  @override
  void sound() => print("Meow");
}

class AnimalBox<T extends Animal> {
  T voice;
  AnimalBox(this.voice);
  
  void makeSound() {
    voice.sound();
  }
}

void genericInheritance() {
  print('\n--- Generic with Inheritance ---');
  var dogBox = AnimalBox<Dog>(Dog());
  AnimalBox<Dog> dogBox1 = AnimalBox<Dog>(Dog());
  var dogBox2 = AnimalBox(Dog()); // Type inferred
  
  dogBox.makeSound(); // Bark
  
  var catBox = AnimalBox<Cat>(Cat());
  catBox.makeSound(); // Meow
  
  var animalBox = AnimalBox(Animal());
  animalBox.makeSound(); // Some sound
  
  // var box = AnimalBox<int>(10); ❌ ERROR: int doesn't extend Animal
}

/**
 * Generic Method in Class
 * Method with generic type parameter
 */
class Printer {
  void printItem<T>(T item) {
    print("Item: $item, Type: ${item.runtimeType}");
  }
  
  // Multiple generic methods
  <T, U> void printPair(T first, U second) {
    print("Pair: ($first, $second)");
  }
}

void genericMethodInClass() {
  print('\n--- Generic Method in Class ---');
  var printerObj = Printer();
  printerObj.printItem<int>(42);
  printerObj.printItem<String>("Hello");
  printerObj.printItem<bool>(true);
  
  printerObj.printPair<String, int>("Age", 25);
}

/**
 * Generic Collections
 * Built-in generic collections
 */
void genericCollection() {
  print('\n--- Generic Collections ---');
  List<int> numbers = [1, 2, 3];
  Map<String, double> prices = {"Apple": 2.5, "Banana": 1.2};
  Set<num> flags = {1, 2.5, 3};
  
  numbers.add(4);
  prices["Orange"] = 1.8;
  flags.add(4.6);
  
  print('Numbers: $numbers');
  print('Prices: $prices');
  print('Flags: $flags');
}

/**
 * Generic vs Dynamic
 * Type safety comparison
 */
void grnericVsDynamic() {
  print('\n--- Generic vs Dynamic ---');
  T echo<T>(T value) => value;
  
  dynamic echoDynamic(dynamic value) => value;
  
  // Generic: Type-safe
  int result1 = echo<int>(10);
  String result2 = echo<String>("Hello");
  print('Generic - result1: $result1 (${result1.runtimeType})');
  print('Generic - result2: $result2 (${result2.runtimeType})');
  
  // Dynamic: Not type-safe
  var result3 = echoDynamic("Hello");
  var result4 = echoDynamic(20);
  print('Dynamic - result3: $result3 (${result3.runtimeType})');
  print('Dynamic - result4: $result4 (${result4.runtimeType})');
}

/**
 * Generic with Covariant
 * Covariant keyword for type variance
 */
class Animals {
  void sound(String name) => print('Some sound');
}

class Dogs extends Animals {
  @override
  void sound(String name1) => print('Bark');
}

// Generic Shelter
class Shelter<T extends Animals> {
  void add(covariant T animal) {
    print('Animal of type ${animal.runtimeType} added');
  }
}

// DogShelter specialized for Dogs
class DogShelter extends Shelter<Dogs> {
  @override
  void add(Dogs dog) {
    print('Dog added');
  }
}

void genericWithCovarient() {
  print('\n--- Generic with Covariant ---');
  var animalShelter = Shelter<Animals>();
  animalShelter.add(Animals()); // ✅ Animal of type Animals added
  
  var dogShelter = DogShelter();
  dogShelter.add(Dogs()); // ✅ Dog added
}

/**
 * Generic Repository Pattern
 */
class Repository<T> {
  List<T> _items = [];
  
  void add(T item) => _items.add(item);
  
  List<T> getAll() => _items;
  
  T? findById(bool Function(T) predicate) {
    try {
      return _items.firstWhere(predicate);
    } catch (e) {
      return null;
    }
  }
  
  void remove(T item) => _items.remove(item);
  
  int get count => _items.length;
}

/**
 * Generic API Response
 */
class ApiResponse<T> extends Object {
  final T? data;       // nullable: success will carry data, error won't
  final String? error; // nullable: error will carry a message, success won't
  
  // Named constructor for success
  ApiResponse.success(this.data) : error = null;
  
  // Named constructor for error
  ApiResponse.error(this.error) : data = null;
  
  bool get isSuccess => error == null;
  bool get isError => error != null;
  
  @override
  String toString() => isSuccess
      ? 'ApiResponse.success(data: $data)'
      : 'ApiResponse.error(error: $error)';
}

void genericExamples() {
  print('\n--- Generic Examples ---');
  
  // Repository example
  var userRepo = Repository<String>();
  userRepo.add("Alice");
  userRepo.add("Bob");
  print('Repository items: ${userRepo.getAll()}');
  print('Count: ${userRepo.count}');
  
  // API Response example
  final ok = ApiResponse<int>.success(42);
  final fail = ApiResponse<int>.error('Not found');
  
  print('\nAPI Responses:');
  print(ok);   // ApiResponse.success(data: 42)
  print(fail); // ApiResponse.error(error: Not found)
  
  if (ok.isSuccess) {
    print('Data: ${ok.data}');
  }
}

/**
 * Additional Examples
 */
void demonstrateAdditionalExamples() {
  // Stack data structure
  Stack<int> intStack = Stack<int>();
  intStack.push(1);
  intStack.push(2);
  intStack.push(3);
  print('Stack: ${intStack.pop()}'); // 3
  
  // Cache with generics
  Cache<String, String> cache = Cache<String, String>();
  cache.set('key1', 'value1');
  print('Cache get: ${cache.get('key1')}');
  
  // Optional wrapper
  Optional<int> optional = Optional.some(42);
  print('Optional value: ${optional.value}');
}

/**
 * Generic Stack Implementation
 */
class Stack<T> {
  List<T> _items = [];
  
  void push(T item) => _items.add(item);
  
  T? pop() => _items.isEmpty ? null : _items.removeLast();
  
  T? peek() => _items.isEmpty ? null : _items.last;
  
  bool get isEmpty => _items.isEmpty;
  
  int get length => _items.length;
}

/**
 * Generic Cache
 */
class Cache<K, V> {
  Map<K, V> _cache = {};
  
  void set(K key, V value) => _cache[key] = value;
  
  V? get(K key) => _cache[key];
  
  void clear() => _cache.clear();
  
  bool containsKey(K key) => _cache.containsKey(key);
}

/**
 * Generic Optional
 */
class Optional<T> {
  final T? _value;
  
  Optional.some(this._value);
  Optional.none() : _value = null;
  
  T? get value => _value;
  bool get isSome => _value != null;
  bool get isNone => _value == null;
}
