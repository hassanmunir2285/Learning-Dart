/**
 * CLASS MODIFIERS IN DART 3
 * 
 * WHAT ARE CLASS MODIFIERS?
 * Class modifiers are keywords that control how classes can be used,
 * extended, implemented, or mixed in. They provide better API design
 * and prevent misuse of your classes.
 * 
 * KEY MODIFIERS:
 * 
 * 1. FINAL CLASS:
 *    - Cannot be extended or implemented
 *    - Prevents inheritance
 *    - Use for utility classes
 * 
 * 2. SEALED CLASS:
 *    - Closed set of subclasses
 *    - All subclasses must be in same library
 *    - Enables exhaustiveness checking
 * 
 * 3. BASE CLASS:
 *    - Can be extended, not implemented
 *    - Subclasses must use base, final, or sealed
 *    - Prevents implementation outside library
 * 
 * 4. INTERFACE CLASS:
 *    - Can be implemented, not extended
 *    - Forces implementation of all members
 *    - Use for contracts
 * 
 * 5. MIXIN CLASS:
 *    - Can be used as mixin
 *    - Can also be extended or implemented
 *    - Flexible usage
 * 
 * 6. ABSTRACT CLASS:
 *    - Cannot be instantiated
 *    - Can have abstract methods
 *    - Can be extended or implemented
 * 
 * COMBINING MODIFIERS:
 * - abstract final class
 * - abstract sealed class
 * - abstract base class
 * - abstract interface class
 * 
 * USE CASES:
 * - API design
 * - Library boundaries
 * - Preventing misuse
 * - Better type safety
 */

void main() {
  print('=== CLASS MODIFIERS IN DART 3 ===\n');
  
  // 1. FINAL CLASS
  print('--- Final Class ---');
  demonstrateFinalClass();
  
  // 2. SEALED CLASS
  print('\n--- Sealed Class ---');
  demonstrateSealedClass();
  
  // 3. BASE CLASS
  print('\n--- Base Class ---');
  demonstrateBaseClass();
  
  // 4. INTERFACE CLASS
  print('\n--- Interface Class ---');
  demonstrateInterfaceClass();
  
  // 5. MIXIN CLASS
  print('\n--- Mixin Class ---');
  demonstrateMixinClass();
  
  // 6. COMBINED MODIFIERS
  print('\n--- Combined Modifiers ---');
  demonstrateCombinedModifiers();
}

/**
 * Final class demonstration
 */
void demonstrateFinalClass() {
  // Final class cannot be extended
  final logger = FinalLogger();
  logger.log('Message');
  
  // ❌ This would cause error:
  // class ExtendedLogger extends FinalLogger {} // Error!
}

final class FinalLogger {
  void log(String message) {
    print('LOG: $message');
  }
}

/**
 * Sealed class demonstration
 */
void demonstrateSealedClass() {
  // Sealed class with known subclasses
  Shape shape = Circle(5.0);
  print('Area: ${calculateArea(shape)}');
  
  shape = Rectangle(3.0, 4.0);
  print('Area: ${calculateArea(shape)}');
}

sealed class Shape {}

class Circle extends Shape {
  final double radius;
  Circle(this.radius);
}

class Rectangle extends Shape {
  final double width;
  final double height;
  Rectangle(this.width, this.height);
}

double calculateArea(Shape shape) => switch (shape) {
  Circle(radius: var r) => 3.14159 * r * r,
  Rectangle(width: var w, height: var h) => w * h,
};

/**
 * Base class demonstration
 */
void demonstrateBaseClass() {
  // Base class can be extended
  BaseAnimal animal = BaseDog();
  animal.makeSound();
}

base class BaseAnimal {
  void makeSound() {
    print('Animal makes sound');
  }
}

base class BaseDog extends BaseAnimal {
  @override
  void makeSound() {
    print('Woof!');
  }
}

/**
 * Interface class demonstration
 */
void demonstrateInterfaceClass() {
  // Interface class can be implemented
  Printer printer = ConsolePrinter();
  printer.print('Hello');
}

abstract interface class Printer {
  void print(String message);
}

class ConsolePrinter implements Printer {
  @override
  void print(String message) {
    print('Console: $message');
  }
}

/**
 * Mixin class demonstration
 */
void demonstrateMixinClass() {
  // Mixin class can be used as mixin
  MyClass obj = MyClass();
  obj.fly();
  obj.swim();
}

mixin class Flyable {
  void fly() {
    print('Flying...');
  }
}

mixin class Swimmable {
  void swim() {
    print('Swimming...');
  }
}

class MyClass with Flyable, Swimmable {}

/**
 * Combined modifiers
 */
void demonstrateCombinedModifiers() {
  // Abstract final class
  // Abstract sealed class
  // Abstract base class
  // Abstract interface class
  
  print('Combined modifiers:');
  print('- abstract final: Cannot be instantiated or extended');
  print('- abstract sealed: Abstract with closed subclasses');
  print('- abstract base: Abstract, can be extended');
  print('- abstract interface: Abstract, can be implemented');
}

/**
 * ADDITIONAL EXAMPLES
 */

// Abstract final class
abstract final class Utility {
  static void helper() {
    print('Helper method');
  }
}

// Sealed class (already abstract, no need for abstract keyword)
sealed class State {}

class LoadingState extends State {}
class LoadedState extends State {}
class ErrorState extends State {}

// Abstract base class
abstract base class BaseService {
  void initialize();
}

base class DatabaseService extends BaseService {
  @override
  void initialize() {
    print('Database initialized');
  }
}

// Abstract interface class
abstract interface class Repository {
  void save();
  void load();
}

class FileRepository implements Repository {
  @override
  void save() => print('Saving to file');
  
  @override
  void load() => print('Loading from file');
}

