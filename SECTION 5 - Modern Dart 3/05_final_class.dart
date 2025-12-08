/**
 * FINAL CLASS IN DART 3
 * 
 * WHAT IS A FINAL CLASS?
 * A final class cannot be extended or implemented outside of its library.
 * It's perfect for utility classes, value objects, or classes where
 * you want to prevent inheritance.
 * 
 * KEY CHARACTERISTICS:
 * 
 * 1. CANNOT BE EXTENDED:
 *    - No subclasses allowed
 *    - Prevents inheritance
 *    - Use for utility classes
 * 
 * 2. CANNOT BE IMPLEMENTED:
 *    - Cannot be used as interface
 *    - Prevents implementation
 * 
 * 3. CAN BE INSTANTIATED:
 *    - Can create objects
 *    - Normal class usage
 * 
 * 4. USE CASES:
 *    - Utility classes
 *    - Value objects
 *    - Classes that shouldn't be extended
 *    - API boundaries
 * 
 * WHEN TO USE:
 * - When you want to prevent inheritance
 * - For utility classes with static methods
 * - For classes that are complete and shouldn't be modified
 * - To enforce API boundaries
 */

void main() {
  print('=== FINAL CLASS IN DART 3 ===\n');
  
  // 1. BASIC FINAL CLASS
  print('--- Basic Final Class ---');
  demonstrateBasicFinalClass();
  
  // 2. FINAL CLASS WITH STATIC METHODS
  print('\n--- Final Class with Static Methods ---');
  demonstrateFinalClassWithStatic();
  
  // 3. FINAL CLASS IN INHERITANCE CHAIN
  print('\n--- Final Class in Inheritance Chain ---');
  demonstrateFinalClassInChain();
  
  // 4. FINAL CLASS AS VALUE OBJECT
  print('\n--- Final Class as Value Object ---');
  demonstrateFinalClassValueObject();
}

/**
 * Basic final class
 */
void demonstrateBasicFinalClass() {
  // Create instance of final class
  Logger logger = Logger();
  logger.log('Hello from final class!');
  logger.breathe();
  
  // Final class works normally
  print('Final class can be instantiated and used normally');
}

// Final class - cannot be extended
final class Logger implements Animal {
  void log(String message) {
    print('LOG: $message');
  }
  
  @override
  void breathe() {
    print('Breathing...');
  }
}

// Base class that final class can implement
base class Animal {
  void breathe() {
    print('Breathing...');
  }
}

/**
 * Final class with static methods
 */
void demonstrateFinalClassWithStatic() {
  // Use static methods
  Utility.showMessage('Hello from Utility!');
  Utility.helper();
  
  // Cannot extend, but can use static methods
  print('Static methods work normally');
}

final class Utility {
  // Static method
  static void showMessage(String msg) {
    print('UTIL: $msg');
  }
  
  static void helper() {
    print('Helper method');
  }
  
  // Cannot be extended, perfect for utilities
}

/**
 * Final class in inheritance chain
 */
void demonstrateFinalClassInChain() {
  // Sealed class at top
  // Base class in middle
  // Final class at bottom
  
  Dog dog = Dog();
  dog.bark();
  dog.feedYoung();
  
  Cat cat = Cat();
  cat.meow();
  cat.feedYoung();
}

// Sealed class - closed hierarchy
sealed class Animal2 {}

// Base class - can be extended
base class Mammal extends Animal2 {
  void feedYoung() {
    print('Feeding milk...');
  }
}

// Final class - cannot be extended further
final class Dog extends Mammal {
  void bark() {
    print('Woof!');
  }
}

final class Cat extends Mammal {
  void meow() {
    print('Meow!');
  }
}

/**
 * Final class as value object
 */
void demonstrateFinalClassValueObject() {
  Point p1 = Point(10, 20);
  Point p2 = Point(10, 20);
  
  print('Point 1: $p1');
  print('Point 2: $p2');
  print('Equal: ${p1 == p2}');
  print('Hash: ${p1.hashCode}');
}

// Final class as immutable value object
final class Point {
  final int x;
  final int y;
  
  Point(this.x, this.y);
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Point && runtimeType == other.runtimeType &&
      x == other.x && y == other.y;
  
  @override
  int get hashCode => x.hashCode ^ y.hashCode;
  
  @override
  String toString() => 'Point($x, $y)';
}

/**
 * ADDITIONAL EXAMPLES
 */

// Final class for configuration
final class AppConfig {
  final String apiUrl;
  final String apiKey;
  
  AppConfig(this.apiUrl, this.apiKey);
  
  static AppConfig development() {
    return AppConfig('http://localhost:3000', 'dev-key');
  }
  
  static AppConfig production() {
    return AppConfig('https://api.example.com', 'prod-key');
  }
}

// Final class for constants
final class Constants {
  static const String appName = 'MyApp';
  static const int maxRetries = 3;
  static const Duration timeout = Duration(seconds: 30);
  
  // Private constructor prevents instantiation
  Constants._();
}

// Final class for errors
final class ValidationError {
  final String message;
  final String field;
  
  ValidationError(this.message, this.field);
  
  @override
  String toString() => 'ValidationError($field): $message';
}
