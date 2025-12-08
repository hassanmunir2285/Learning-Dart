/**
 * ABSTRACTION: ABSTRACT CLASSES & INTERFACES IN DART
 * 
 * WHAT IS ABSTRACTION?
 * Abstraction is the process of hiding implementation details
 * and showing only essential features.
 * 
 * ABSTRACT CLASSES:
 * - Cannot be instantiated directly
 * - Can contain abstract methods (no implementation)
 * - Can contain concrete methods (with implementation)
 * - Must be extended by child classes
 * - Child classes must implement all abstract methods
 * 
 * INTERFACES:
 * - In Dart, any class can act as an interface
 * - Use 'implements' keyword instead of 'extends'
 * - Must implement ALL methods (even if they have implementation)
 * - Allows multiple inheritance (implementing multiple interfaces)
 * - No code sharing, only contract definition
 * 
 * KEY DIFFERENCES:
 * 
 * Abstract Class:
 * - Use 'extends' keyword
 * - Can have both abstract and concrete methods
 * - Can have instance variables
 * - Supports code reuse
 * - Single inheritance
 * 
 * Interface:
 * - Use 'implements' keyword
 * - Must implement all methods
 * - No code sharing
 * - Multiple inheritance possible
 * - Defines contract only
 * 
 * WHEN TO USE:
 * - Abstract Class: When you want to share code and define contract
 * - Interface: When you only want to define contract (no code sharing)
 */

void main() {
  print('=== ABSTRACTION IN DART ===\n');
  
  // Abstract class - cannot instantiate directly
  print('--- Abstract Class ---');
  // Vehicle v = Vehicle(); ❌ ERROR: Cannot create object of abstract class
  
  Vehicle v1 = Bike();
  Vehicle v2 = Truck();
  
  v1.stop();  // Concrete method from abstract class
  v2.stop();  // Concrete method from abstract class
  v1.move();   // Abstract method implemented in Bike
  v2.move();   // Abstract method implemented in Truck
  
  // Interface example - using implements for multiple inheritance
  print('\n--- Interface (Multiple Inheritance) ---');
  AllInOne device = AllInOne();
  device.printData();  // Printing...
  device.scanData();   // Scanning...
  
  // Polymorphism with interfaces
  Printer p = AllInOne();
  p.printData();  // Printing...
  // p.scanData(); ❌ ERROR: p is Printer type only
  
  Scanner s = AllInOne();
  s.scanData();   // Scanning...
  // s.printData(); ❌ ERROR: s is Scanner type only
  
  var device1 = AllInOne();
  device1.printData();  // Printing...
  device1.scanData();   // Scanning...
  
  // Additional examples
  print('\n--- Additional Examples ---');
  Shape circle = Circle();
  Shape rectangle = Rectangle();
  
  circle.draw();
  print('Circle area: ${circle.calculateArea()}');
  
  rectangle.draw();
  print('Rectangle area: ${rectangle.calculateArea()}');
}

/**
 * Abstract Class Example
 * Cannot be instantiated, must be extended
 */
abstract class Vehicle {
  // Abstract method (no body) - must be implemented in child classes
  void move();
  
  // Concrete method (has body) - can be used as-is or overridden
  void stop() => print("Vehicle stopped");
  
  // Can have more concrete methods
  void start() => print("Vehicle started");
  
  // Can have instance variables
  String? model;
  int? year;
}

class Bike extends Vehicle {
  @override
  void move() => print("Bike is moving");
  
  // Can override concrete methods
  @override
  void stop() => print("Bike stopped");
}

class Truck extends Vehicle {
  @override
  void move() => print("Truck is moving");
  
  @override
  void stop() => print("Truck stopped");
  
  // Can add own methods
  void loadCargo() => print("Truck is loading cargo");
}

/**
 * Interface Example (Multiple Inheritance)
 * Using 'implements' for multiple inheritance
 */
class Printer {
  // Parent class 1 (acts as interface)
  void printData() {
    print("Default print implementation");
  }
}

class Scanner {
  // Parent class 2 (acts as interface)
  void scanData() {
    print("Default scan implementation");
  }
}

class AllInOne implements Printer, Scanner {
  // Child class implementing multiple interfaces
  @override
  void printData() => print("Printing...");
  
  @override
  void scanData() => print("Scanning...");
  
  // Must implement ALL methods, even if parent has implementation
}

/**
 * ADDITIONAL EXAMPLES
 */

// Abstract class for shapes
abstract class Shape {
  String color;
  
  Shape(this.color);
  
  // Abstract method - must be implemented
  double calculateArea();
  
  // Abstract method - must be implemented
  void draw();
  
  // Concrete method - can be used as-is
  void setColor(String newColor) {
    color = newColor;
    print("Color changed to $newColor");
  }
  
  // Concrete method
  String getColor() => color;
}

class Circle extends Shape {
  double radius;
  
  Circle(this.radius, String color) : super(color);
  
  @override
  double calculateArea() {
    return 3.14159 * radius * radius;
  }
  
  @override
  void draw() {
    print("Drawing circle with radius $radius and color $color");
  }
}

class Rectangle extends Shape {
  double width;
  double height;
  
  Rectangle(this.width, this.height, String color) : super(color);
  
  @override
  double calculateArea() {
    return width * height;
  }
  
  @override
  void draw() {
    print("Drawing rectangle ${width}x$height with color $color");
  }
}

// Interface example: Payment methods
class PaymentProcessor {
  void processPayment(double amount) {
    print("Processing payment of \$$amount");
  }
}

class RefundProcessor {
  void processRefund(double amount) {
    print("Processing refund of \$$amount");
  }
}

class PaymentGateway implements PaymentProcessor, RefundProcessor {
  @override
  void processPayment(double amount) {
    print("Gateway: Processing payment of \$$amount");
  }
  
  @override
  void processRefund(double amount) {
    print("Gateway: Processing refund of \$$amount");
  }
}

// Abstract class with both abstract and concrete methods
abstract class Animal {
  String name;
  
  Animal(this.name);
  
  // Abstract method
  void makeSound();
  
  // Abstract method
  void move();
  
  // Concrete method
  void eat() => print("$name is eating");
  
  // Concrete method
  void sleep() => print("$name is sleeping");
  
  // Concrete method
  void displayInfo() {
    print("Animal: $name");
  }
}

class Dog extends Animal {
  Dog(String name) : super(name);
  
  @override
  void makeSound() => print("$name barks");
  
  @override
  void move() => print("$name runs");
  
  // Can add own methods
  void fetch() => print("$name fetches ball");
}

class Cat extends Animal {
  Cat(String name) : super(name);
  
  @override
  void makeSound() => print("$name meows");
  
  @override
  void move() => print("$name walks");
  
  // Can add own methods
  void climb() => print("$name climbs tree");
}
