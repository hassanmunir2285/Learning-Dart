/**
 * POLYMORPHISM IN DART
 * 
 * WHAT IS POLYMORPHISM?
 * Polymorphism means "many forms".
 * It allows objects of different classes to be treated as objects of a common parent class.
 * The same interface can be used for different underlying forms.
 * 
 * KEY CONCEPTS:
 * 
 * 1. Method Overriding:
 *    - Child class provides its own implementation of parent method
 *    - Uses @override annotation
 *    - Runtime polymorphism
 * 
 * 2. Runtime Polymorphism (Dynamic Polymorphism):
 *    - Method to call is determined at runtime
 *    - Achieved through method overriding
 *    - Parent reference can point to child objects
 * 
 * 3. Compile-time Polymorphism (Static Polymorphism):
 *    - Method to call is determined at compile time
 *    - Dart doesn't support true method overloading
 *    - Can simulate using optional/named parameters
 * 
 * TYPES OF POLYMORPHISM:
 * 
 * 1. Runtime (Dynamic) Polymorphism:
 *    - Method overriding
 *    - Parent reference, child object
 *    - Actual method called depends on object type
 * 
 * 2. Compile-time (Static) Polymorphism:
 *    - Method overloading (not directly supported in Dart)
 *    - Simulated using optional parameters
 *    - Method to call determined by parameters
 * 
 * BENEFITS:
 * - Code Flexibility
 * - Extensibility
 * - Maintainability
 * - Interface-based programming
 */

void main() {
  print('=== POLYMORPHISM IN DART ===\n');
  
  // Runtime Polymorphism (Dynamic Polymorphism)
  print('--- Runtime Polymorphism ---');
  Animal d = Dog();  // Parent reference, child object
  Animal c = Cat();  // Parent reference, child object
  
  d.sound(); // Calls Dog's sound() method
  c.sound(); // Calls Cat's sound() method
  
  // Polymorphism with Shape class
  print('\n--- Shape Polymorphism ---');
  Shape draw1 = Shape();
  draw1.draw();
  
  Shape draw2 = Circle();  // Parent reference, child object
  draw2.draw();             // Calls Circle's draw() method
  
  Shape draw3 = Square();   // Parent reference, child object
  draw3.draw();             // Calls Square's draw() method
  
  // List of different shapes (polymorphism in collections)
  print('\n--- Polymorphism in Collections ---');
  List<Shape> shapes = [
    Shape(),
    Circle(),
    Square(),
    Rectangle()
  ];
  
  for (Shape shape in shapes) {
    shape.draw(); // Calls appropriate draw() method for each
  }
  
  // Compile-time Polymorphism (Static Polymorphism) - using optional parameters
  print('\n--- Compile-time Polymorphism (Simulated) ---');
  Calculator calc = Calculator();
  print('Sum of 10 and 20: ${calc.sum(10, 20)}');
  print('Sum of 10, 20, and 30: ${calc.sum(10, 20, 30)}');
  print('Sum of 10, 20, 30, and 40: ${calc.sum(10, 20, 30, 40)}');
}

/**
 * Runtime Polymorphism Example
 * Method overriding with Shape hierarchy
 */
class Shape {
  // Parent class
  void draw() => print("Drawing shape");
  
  double calculateArea() => 0.0;
}

class Circle extends Shape {
  // Child class
  @override
  void draw() => print("Drawing circle");
  
  @override
  double calculateArea() {
    return 3.14159 * 5 * 5; // Example calculation
  }
}

class Square extends Shape {
  // Child class
  @override
  void draw() => print("Drawing square");
  
  @override
  double calculateArea() {
    return 10 * 10; // Example calculation
  }
}

class Rectangle extends Shape {
  @override
  void draw() => print("Drawing rectangle");
  
  @override
  double calculateArea() {
    return 10 * 5; // Example calculation
  }
}

/**
 * Types of Polymorphism
 * 
 * 1. Compile-time (Static Polymorphism)
 *    In some languages → done via method overloading
 *    (same method name, different parameters).
 *    Dart ❌ does not support true method overloading.
 *    But we can simulate it using optional/named parameters.
 * 
 * 2. Runtime (Dynamic Polymorphism)
 *    Achieved by method overriding in Dart.
 */

/**
 * Compile-time Polymorphism (Simulated)
 * Using optional parameters to simulate method overloading
 */
class Calculator {
  // Simulates method overloading using optional parameters
  int sum(int a, int b, [int? c, int? d]) {
    int result = a + b;
    if (c != null) {
      result += c;
    }
    if (d != null) {
      result += d;
    }
    return result;
  }
  
  // Alternative using named parameters
  int multiply(int a, int b, {int? c, int? d}) {
    int result = a * b;
    if (c != null) {
      result *= c;
    }
    if (d != null) {
      result *= d;
    }
    return result;
  }
}

/**
 * Runtime Polymorphism (Dynamic Polymorphism)
 * Method overriding with Animal hierarchy
 */
class Animal {
  void sound() => print("Animal makes a sound");
  
  void move() => print("Animal is moving");
  
  void eat() => print("Animal is eating");
}

class Dog extends Animal {
  @override
  void sound() => print("Dog barks");
  
  @override
  void move() => print("Dog runs");
  
  // Can add new methods
  void fetch() => print("Dog fetches ball");
}

class Cat extends Animal {
  @override
  void sound() => print("Cat meows");
  
  @override
  void move() => print("Cat walks silently");
  
  // Can add new methods
  void climb() => print("Cat climbs tree");
}

/**
 * ADDITIONAL EXAMPLES
 */

// Payment system polymorphism
abstract class PaymentMethod {
  void processPayment(double amount);
  
  void refund(double amount) => print("Processing refund of \$$amount");
}

class CreditCard extends PaymentMethod {
  @override
  void processPayment(double amount) {
    print("Processing credit card payment of \$$amount");
  }
}

class PayPal extends PaymentMethod {
  @override
  void processPayment(double amount) {
    print("Processing PayPal payment of \$$amount");
  }
}

class BankTransfer extends PaymentMethod {
  @override
  void processPayment(double amount) {
    print("Processing bank transfer of \$$amount");
  }
}

// Employee polymorphism
class Employee {
  String name;
  
  Employee(this.name);
  
  void work() => print("$name is working");
  
  double calculateSalary() => 0.0;
}

class FullTimeEmployee extends Employee {
  double monthlySalary;
  
  FullTimeEmployee(String name, this.monthlySalary) : super(name);
  
  @override
  void work() => print("$name is working full-time");
  
  @override
  double calculateSalary() => monthlySalary;
}

class PartTimeEmployee extends Employee {
  double hourlyRate;
  int hoursWorked;
  
  PartTimeEmployee(String name, this.hourlyRate, this.hoursWorked)
      : super(name);
  
  @override
  void work() => print("$name is working part-time");
  
  @override
  double calculateSalary() => hourlyRate * hoursWorked;
}

// Using polymorphism
void demonstratePolymorphism() {
  // Same interface, different implementations
  List<Employee> employees = [
    FullTimeEmployee("Alice", 5000),
    PartTimeEmployee("Bob", 20, 40),
    FullTimeEmployee("Charlie", 6000)
  ];
  
  for (Employee emp in employees) {
    emp.work();
    print("Salary: \$${emp.calculateSalary()}");
  }
}
