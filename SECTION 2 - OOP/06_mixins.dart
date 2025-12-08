/**
 * MIXINS IN DART
 * 
 * WHAT IS A MIXIN?
 * A mixin is a way to reuse code in multiple class hierarchies.
 * It allows you to add functionality to a class without inheritance.
 * 
 * KEY CONCEPTS:
 * 
 * 1. mixin Keyword:
 *    - Used to define a mixin
 *    - Syntax: mixin MixinName { code }
 * 
 * 2. with Keyword:
 *    - Used to apply mixins to a class
 *    - Syntax: class ClassName with Mixin1, Mixin2 { }
 * 
 * 3. Multiple Mixins:
 *    - A class can use multiple mixins
 *    - Applied in order (left to right)
 *    - Later mixins can override earlier ones
 * 
 * 4. Mixin Restrictions:
 *    - Cannot be instantiated directly
 *    - Cannot extend classes (but can use 'on' keyword)
 *    - Can contain methods, properties, and getters/setters
 * 
 * MIXIN VS INHERITANCE:
 * 
 * Inheritance (extends):
 * - "is-a" relationship
 * - Single inheritance only
 * - Child class is a type of parent class
 * 
 * Mixin (with):
 * - "has-a" relationship (capability)
 * - Multiple mixins allowed
 * - Adds functionality without "is-a" relationship
 * 
 * WHEN TO USE MIXINS:
 * - When you want to share code across unrelated classes
 * - When you need multiple inheritance-like behavior
 * - When functionality is optional/can be added
 * - For cross-cutting concerns (logging, validation, etc.)
 * 
 * MIXIN WITH 'on' KEYWORD:
 * - Restricts mixin to specific classes
 * - Syntax: mixin MixinName on ClassName { }
 * - Can only be used with classes that extend ClassName
 */

void main() {
  print('=== MIXINS IN DART ===\n');
  
  // Basic mixin usage
  print('--- Basic Mixin Usage ---');
  Duck d = Duck();
  d.fly();   // From Fly mixin
  d.swim();  // From Swim mixin
  d.quack(); // Duck's own method
  
  // Mixin cannot be instantiated
  // Fly fl = Fly(); ❌ ERROR: Cannot instantiate mixin
  
  // Multiple mixins
  print('\n--- Multiple Mixins ---');
  SuperDuck sd = SuperDuck();
  sd.fly();
  sd.swim();
  sd.run();
  sd.quack();
  
  // Mixin with 'on' keyword
  print('\n--- Mixin with Restriction (on keyword) ---');
  FlyingBird bird = FlyingBird();
  bird.fly();
  bird.eat();
  
  // Practical examples
  print('\n--- Practical Examples ---');
  Car car = Car();
  car.start();
  car.drive();
  car.stop();
  car.log("Car operation");
  
  Bicycle bike = Bicycle();
  bike.start();
  bike.ride();
  bike.stop();
  bike.log("Bicycle operation");
}

/**
 * Basic Mixins
 * Simple mixins for adding capabilities
 */
mixin Fly {
  // Mixin 1
  void fly() => print("Flying...");
  
  // Can have multiple methods
  void takeOff() => print("Taking off...");
  
  void land() => print("Landing...");
}

mixin Swim {
  // Mixin 2
  void swim() => print("Swimming...");
  
  void dive() => print("Diving...");
  
  void surface() => print("Surfacing...");
}

class Duck with Fly, Swim {
  // Class using multiple mixins
  void quack() => print("Quacking...");
  
  // Can override mixin methods
  @override
  void fly() => print("Flying with wings...");
}

/**
 * Multiple Mixins Example
 */
mixin Run {
  void run() => print("Running...");
}

class SuperDuck with Fly, Swim, Run {
  // Using three mixins
  void quack() => print("Super quacking...");
}

/**
 * Mixin with 'on' Keyword
 * Restricts mixin to specific class hierarchy
 */
class Animal {
  void eat() => print("Eating...");
}

mixin Flying on Animal {
  // Can only be used with Animal or its subclasses
  void fly() => print("Flying high...");
  
  // Can use methods from Animal
  void flyAndEat() {
    fly();
    eat(); // From Animal
  }
}

class FlyingBird extends Animal with Flying {
  // Must extend Animal to use Flying mixin
  void chirp() => print("Chirping...");
}

/**
 * PRACTICAL EXAMPLES
 */

// Logging mixin
mixin Logger {
  void log(String message) {
    print("[LOG] ${DateTime.now()}: $message");
  }
  
  void error(String message) {
    print("[ERROR] ${DateTime.now()}: $message");
  }
  
  void info(String message) {
    print("[INFO] ${DateTime.now()}: $message");
  }
}

// Validation mixin
mixin Validator {
  bool validateEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
  
  bool validateAge(int age) {
    return age >= 0 && age <= 150;
  }
  
  bool validateNotEmpty(String value) {
    return value.trim().isNotEmpty;
  }
}

// Serializable mixin
mixin Serializable {
  Map<String, dynamic> toJson() {
    return {};
  }
  
  void fromJson(Map<String, dynamic> json) {
    // Implementation
  }
}

// Vehicle with logging
class Car with Logger {
  void start() => print("Car started");
  
  void drive() => print("Car is driving");
  
  void stop() {
    stop();
    log("Car stopped");
  }
}

class Bicycle with Logger {
  void start() => print("Bicycle ready");
  
  void ride() => print("Bicycle is being ridden");
  
  void stop() {
    print("Bicycle stopped");
    log("Bicycle stopped");
  }
}

// User with validation
class User with Validator {
  String? email;
  int? age;
  String? name;
  
  bool setEmail(String email) {
    if (validateEmail(email)) {
      this.email = email;
      return true;
    }
    return false;
  }
  
  bool setAge(int age) {
    if (validateAge(age)) {
      this.age = age;
      return true;
    }
    return false;
  }
}

// Product with serialization
class Product with Serializable {
  String name;
  double price;
  
  Product(this.name, this.price);
  
  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }
  
  @override
  void fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
  }
}

// Mixin composition
mixin Timestamped {
  DateTime createdAt = DateTime.now();
  
  String get timestamp => createdAt.toString();
}

mixin Identifiable {
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  
  String get identifier => id;
}

class Document with Timestamped, Identifiable, Logger {
  String content;
  
  Document(this.content) {
    log("Document created: $id");
  }
  
  void update(String newContent) {
    content = newContent;
    log("Document updated: $id");
  }
}
