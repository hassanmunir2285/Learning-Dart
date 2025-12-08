/**
 * MIXIN CLASS IN DART 3
 * 
 * WHAT IS A MIXIN CLASS?
 * A mixin class can be used as both a regular class and a mixin.
 * It provides flexibility to use the same class in different ways.
 * 
 * KEY CHARACTERISTICS:
 * 
 * 1. CAN BE USED AS MIXIN:
 *    - Can be mixed into other classes
 *    - Use with keyword
 *    - Code reuse through composition
 * 
 * 2. CAN BE EXTENDED:
 *    - Can be used as regular class
 *    - Normal inheritance
 * 
 * 3. CAN BE IMPLEMENTED:
 *    - Can be used as interface
 *    - Must implement all members
 * 
 * 4. FLEXIBLE USAGE:
 *    - Same class, multiple uses
 *    - Adapts to different needs
 *    - Versatile design pattern
 * 
 * USE CASES:
 * - Reusable functionality
 * - Cross-cutting concerns
 * - Multiple inheritance simulation
 * - Feature composition
 * 
 * WHEN TO USE:
 * - When you need functionality in multiple classes
 * - For cross-cutting concerns
 * - When you want flexibility
 * - For feature composition
 */

void main() {
  print('=== MIXIN CLASS IN DART 3 ===\n');
  
  // 1. BASIC MIXIN CLASS
  print('--- Basic Mixin Class ---');
  demonstrateBasicMixinClass();
  
  // 2. MIXIN CLASS AS MIXIN
  print('\n--- Mixin Class as Mixin ---');
  demonstrateMixinClassAsMixin();
  
  // 3. MIXIN CLASS AS REGULAR CLASS
  print('\n--- Mixin Class as Regular Class ---');
  demonstrateMixinClassAsClass();
  
  // 4. MULTIPLE MIXIN CLASSES
  print('\n--- Multiple Mixin Classes ---');
  demonstrateMultipleMixinClasses();
}

/**
 * Basic mixin class
 */
void demonstrateBasicMixinClass() {
  // Mixin class can be used as mixin
  Bird bird = Bird();
  bird.fly();
  
  // Or as regular class
  Flyable flyable = Flyable();
  flyable.fly();
}

// Mixin class - can be used as mixin or class
mixin class Flyable {
  void fly() {
    print('Flying...');
  }
}

// Use as mixin
class Bird with Flyable {}

/**
 * Mixin class as mixin
 */
void demonstrateMixinClassAsMixin() {
  // Use mixin class as mixin
  Duck duck = Duck();
  duck.fly();
  duck.swim();
  
  // Multiple mixins
  FlyingFish fish = FlyingFish();
  fish.fly();
  fish.swim();
}

mixin class Swimmable {
  void swim() {
    print('Swimming...');
  }
}

// Use multiple mixin classes
class Duck with Flyable, Swimmable {}

class FlyingFish with Flyable, Swimmable {}

/**
 * Mixin class as regular class
 */
void demonstrateMixinClassAsClass() {
  // Use mixin class as regular class
  Logger logger = Logger();
  logger.log('Message');
  
  // Can extend it
  FileLogger fileLogger = FileLogger();
  fileLogger.log('File message');
  fileLogger.logToFile('File log');
}

mixin class Logger {
  void log(String message) {
    print('LOG: $message');
  }
}

// Extend mixin class
class FileLogger extends Logger {
  void logToFile(String message) {
    print('File: $message');
  }
}

/**
 * Multiple mixin classes
 */
void demonstrateMultipleMixinClasses() {
  // Combine multiple mixin classes
  SuperHero hero = SuperHero();
  hero.fly();
  hero.swim();
  hero.run();
  hero.fight();
}

mixin class Runnable {
  void run() {
    print('Running...');
  }
}

mixin class Fightable {
  void fight() {
    print('Fighting...');
  }
}

// Combine multiple mixin classes
class SuperHero with Flyable, Swimmable, Runnable, Fightable {}

/**
 * ADDITIONAL EXAMPLES
 */

// Mixin class for validation
mixin class Validatable {
  bool validate(String value) {
    return value.isNotEmpty;
  }
  
  String? getErrorMessage(String value) {
    return value.isEmpty ? 'Value cannot be empty' : null;
  }
}

// Use validation mixin
class FormField with Validatable {
  String value = '';
  
  bool isValid() {
    return validate(value);
  }
}

// Mixin class for serialization
abstract mixin class Serializable {
  Map<String, dynamic> toJson();
  
  void fromJson(Map<String, dynamic> json);
}

// Mixin class for caching
mixin class Cacheable {
  final Map<String, dynamic> _cache = {};
  
  T? getCached<T>(String key) => _cache[key] as T?;
  
  void setCached(String key, dynamic value) {
    _cache[key] = value;
  }
  
  void clearCache() => _cache.clear();
}

// Combine multiple mixin classes
class DataService with Serializable, Cacheable {
  @override
  Map<String, dynamic> toJson() => {};
  
  @override
  void fromJson(Map<String, dynamic> json) {}
}

