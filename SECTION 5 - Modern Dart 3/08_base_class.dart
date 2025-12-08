/**
 * BASE CLASS IN DART 3
 * 
 * WHAT IS A BASE CLASS?
 * A base class can be extended but not implemented outside of its library.
 * It's designed for inheritance hierarchies where you want to allow
 * extension but control implementation.
 * 
 * KEY CHARACTERISTICS:
 * 
 * 1. CAN BE EXTENDED:
 *    - Subclasses can extend it
 *    - Inheritance is allowed
 *    - Code reuse through extension
 * 
 * 2. CANNOT BE IMPLEMENTED:
 *    - Cannot be used as interface outside library
 *    - Prevents external implementation
 *    - Maintains library boundaries
 * 
 * 3. SUBCLASSES MUST USE MODIFIERS:
 *    - Subclasses must be base, final, or sealed
 *    - Maintains modifier chain
 *    - Prevents breaking the hierarchy
 * 
 * 4. USE CASES:
 *    - Class hierarchies
 *    - Framework base classes
 *    - Library boundaries
 *    - Controlled inheritance
 * 
 * WHEN TO USE:
 * - When you want to allow inheritance
 * - For framework base classes
 * - When you need library boundaries
 * - For controlled class hierarchies
 */

void main() {
  print('=== BASE CLASS IN DART 3 ===\n');
  
  // 1. BASIC BASE CLASS
  print('--- Basic Base Class ---');
  demonstrateBasicBaseClass();
  
  // 2. BASE CLASS INHERITANCE CHAIN
  print('\n--- Base Class Inheritance Chain ---');
  demonstrateBaseClassInheritance();
  
  // 3. BASE CLASS WITH ABSTRACT METHODS
  print('\n--- Base Class with Abstract Methods ---');
  demonstrateBaseClassAbstract();
  
  // 4. BASE CLASS FOR FRAMEWORKS
  print('\n--- Base Class for Frameworks ---');
  demonstrateBaseClassFramework();
}

/**
 * Basic base class
 */
void demonstrateBasicBaseClass() {
  // Base class can be instantiated
  Animal animal = Animal();
  animal.breathe();
  
  // Base class can be extended
  Dog dog = Dog();
  dog.breathe(); // Inherited from Animal
  dog.bark();    // Dog's own method
}

// Base class - can be extended, not implemented outside library
base class Animal {
  void breathe() {
    print('Breathing...');
  }
}

// Subclass must use base, final, or sealed
base class Dog extends Animal {
  void bark() {
    print('Woof!');
  }
}

/**
 * Base class inheritance chain
 */
void demonstrateBaseClassInheritance() {
  // Multi-level inheritance
  Mammal mammal = Mammal();
  mammal.breathe();
  mammal.feedYoung();
  
  Dog2 dog = Dog2();
  dog.breathe();
  dog.feedYoung();
  dog.bark();
  
  Cat cat = Cat();
  cat.breathe();
  cat.feedYoung();
  cat.meow();
}

// Base class hierarchy
base class Animal2 {
  void breathe() {
    print('Breathing...');
  }
}

base class Mammal extends Animal2 {
  void feedYoung() {
    print('Feeding milk...');
  }
}

// Final class extending base
final class Dog2 extends Mammal {
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
 * Base class with abstract methods
 */
void demonstrateBaseClassAbstract() {
  // Abstract base class
  Shape circle = Circle(5.0);
  Shape rectangle = Rectangle(3.0, 4.0);
  
  print('Circle area: ${circle.calculateArea()}');
  print('Rectangle area: ${rectangle.calculateArea()}');
}

// Abstract base class
abstract base class Shape {
  double calculateArea();
  
  void draw() {
    print('Drawing shape...');
  }
}

base class Circle extends Shape {
  final double radius;
  Circle(this.radius);
  
  @override
  double calculateArea() {
    return 3.14159 * radius * radius;
  }
}

base class Rectangle extends Shape {
  final double width;
  final double height;
  Rectangle(this.width, this.height);
  
  @override
  double calculateArea() {
    return width * height;
  }
}

/**
 * Base class for frameworks
 */
void demonstrateBaseClassFramework() {
  // Framework base class pattern
  Widget button = Button('Click me');
  Widget text = Text('Hello');
  
  button.render();
  text.render();
}

// Framework base class
abstract base class Widget {
  void render();
  
  void update() {
    print('Updating widget...');
  }
}

base class Button extends Widget {
  final String label;
  Button(this.label);
  
  @override
  void render() {
    print('Rendering button: $label');
  }
}

base class Text extends Widget {
  final String content;
  Text(this.content);
  
  @override
  void render() {
    print('Rendering text: $content');
  }
}

/**
 * ADDITIONAL EXAMPLES
 */

// Base class for services
abstract base class Service {
  void initialize();
  void start();
  void stop();
  
  bool get isRunning;
}

base class DatabaseService extends Service {
  bool _running = false;
  
  @override
  void initialize() {
    print('Initializing database...');
  }
  
  @override
  void start() {
    _running = true;
    print('Database started');
  }
  
  @override
  void stop() {
    _running = false;
    print('Database stopped');
  }
  
  @override
  bool get isRunning => _running;
}

// Base class for models
abstract base class Model {
  final String id;
  final DateTime createdAt;
  
  Model(this.id) : createdAt = DateTime.now();
  
  Map<String, dynamic> toJson();
  
  @override
  String toString() => 'Model(id: $id, created: $createdAt)';
}

base class User extends Model {
  final String name;
  final String email;
  
  User(super.id, this.name, this.email);
  
  @override
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
    'createdAt': createdAt.toIso8601String(),
  };
}
