/**
 * INHERITANCE IN DART
 * 
 * WHAT IS INHERITANCE?
 * Inheritance is a mechanism where a new class (child/derived class)
 * acquires the properties and methods of an existing class (parent/base class).
 * 
 * KEY CONCEPTS:
 * 
 * 1. Parent Class (Base Class/Superclass):
 *    - The class being inherited from
 *    - Contains common properties and methods
 * 
 * 2. Child Class (Derived Class/Subclass):
 *    - The class that inherits from parent
 *    - Can add new properties and methods
 *    - Can override parent methods
 * 
 * 3. extends Keyword:
 *    - Used to create inheritance relationship
 *    - Syntax: class Child extends Parent { }
 * 
 * 4. super Keyword:
 *    - Refers to parent class
 *    - Used to call parent constructor: super()
 *    - Used to call parent methods: super.methodName()
 *    - Used to access parent properties: super.propertyName
 * 
 * TYPES OF INHERITANCE:
 * 
 * 1. Single Inheritance:
 *    - Child inherits from one parent
 *    - Dart supports single inheritance
 * 
 * 2. Multilevel Inheritance:
 *    - A → B → C (chain of inheritance)
 *    - Class B inherits from A, C inherits from B
 * 
 * 3. Hierarchical Inheritance:
 *    - Multiple children inherit from one parent
 *    - Parent → Child1, Child2, Child3
 * 
 * 4. Multiple Inheritance:
 *    - ❌ NOT directly supported in Dart
 *    - Use Mixins or Interfaces instead
 * 
 * BENEFITS:
 * - Code Reusability
 * - Method Overriding
 * - Polymorphism
 * - Code Organization
 */

void main() {
  print('=== INHERITANCE IN DART ===\n');
  
  // Single Inheritance
  print('--- Single Inheritance ---');
  Dog d = Dog();
  d.eat();  // inherited from Animal
  d.bark(); // own method
  
  // Multilevel Inheritance → A → B → C
  print('\n--- Multilevel Inheritance ---');
  LivingThing l1 = Human();
  l1.breathe(); // from LivingThing
  Human h2 = Male();
  h2.eat();     // from Human
  h2.breathe(); // from LivingThing (inherited through Human)
  
  // Hierarchical Inheritance → One parent → multiple children
  print('\n--- Hierarchical Inheritance ---');
  Car c = Car();
  Bike b = Bike();
  
  c.drive(); // Car's own method
  c.move();  // inherited from Vehicle
  b.ride();  // Bike's own method
  b.move();  // inherited from Vehicle
  
  // Inheritance with super keyword
  print('\n--- Using super Keyword ---');
  Student student = Student(101, "Alice", 20);
  student.greet();
  student.show();
  
  // Method overriding
  print('\n--- Method Overriding ---');
  Animal animal = Animal();
  Dog dog = Dog();
  
  animal.eat(); // Parent method
  dog.eat();   // Overridden method (if overridden)
}

/**
 * Single Inheritance
 * Child class inherits from one parent class
 */
class Animal {
  // Parent class
  void eat() => print("Animal is eating");
  
  void sleep() => print("Animal is sleeping");
}

class Dog extends Animal {
  // Child class
  void bark() => print("Dog is barking");
  
  // Can override parent methods
  @override
  void eat() {
    super.eat(); // Call parent method
    print("Dog is eating dog food");
  }
}

/**
 * Multilevel Inheritance → A → B → C
 * Chain of inheritance
 */
class LivingThing {
  void breathe() => print("Breathing...");
  
  void grow() => print("Growing...");
}

class Human extends LivingThing {
  void eat() => print("Eating...");
  
  void think() => print("Thinking...");
}

class Male extends Human {
  void bark() => print("Barking...");
  
  // Has access to all parent methods
  // breathe() from LivingThing
  // eat(), think() from Human
  // bark() own method
}

/**
 * Hierarchical Inheritance
 * One parent → multiple children
 */
class Vehicle {
  void move() => print("Moving...");
  
  void stop() => print("Stopped");
}

class Car extends Vehicle {
  void drive() => print("Car driving");
  
  @override
  void move() {
    super.move();
    print("Car is moving on road");
  }
}

class Bike extends Vehicle {
  void ride() => print("Bike riding");
  
  @override
  void move() {
    super.move();
    print("Bike is moving on road");
  }
}

/**
 * Multiple Inheritance ❌
 * Dart does not support multiple inheritance directly
 * (like class C extends A, B).
 * Instead, it uses Mixins or Interfaces.
 */

/**
 * Inheritance with super keyword
 * Demonstrates accessing parent members
 */
class Person {
  // Parent class
  String name;
  int age;
  
  Person(this.name, this.age);
  
  String message = "Hi from Parent";
  
  void greet() => print("Hello from Parent");
  
  void introduce() {
    print("I am $name, $age years old");
  }
}

class Student extends Person {
  // Child Class
  int rollNo;
  String message = "Hi from Child";
  
  // Pass parameters to parent's constructor using super()
  Student(this.rollNo, String name, int age) : super(name, age);
  
  @override
  void greet() {
    super.greet(); // calls Parent's greet()
    print("Hello from Child"); // then Child's own logic
  }
  
  void show() {
    print("Name: $name, Roll No: $rollNo, Age: $age");
    print(this.message);  // Child's message
    print(super.message); // Parent's message
    
    // Can call parent methods
    super.introduce();
  }
}

/**
 * ADDITIONAL EXAMPLES
 */

// Shape hierarchy
class Shape {
  String color;
  
  Shape(this.color);
  
  void draw() => print("Drawing shape");
  
  double calculateArea() => 0.0;
}

class Circle extends Shape {
  double radius;
  
  Circle(this.radius, String color) : super(color);
  
  @override
  void draw() {
    print("Drawing circle with radius $radius");
  }
  
  @override
  double calculateArea() {
    return 3.14159 * radius * radius;
  }
}

class Rectangle extends Shape {
  double width;
  double height;
  
  Rectangle(this.width, this.height, String color) : super(color);
  
  @override
  void draw() {
    print("Drawing rectangle ${width}x$height");
  }
  
  @override
  double calculateArea() {
    return width * height;
  }
}

// Employee hierarchy
class Employee {
  String name;
  double salary;
  
  Employee(this.name, this.salary);
  
  void displayInfo() {
    print("Employee: $name, Salary: \$$salary");
  }
  
  void work() => print("$name is working");
}

class Manager extends Employee {
  String department;
  
  Manager(String name, double salary, this.department) : super(name, salary);
  
  @override
  void displayInfo() {
    super.displayInfo();
    print("Department: $department");
  }
  
  void manage() => print("$name is managing $department");
}

class Developer extends Employee {
  String programmingLanguage;
  
  Developer(String name, double salary, this.programmingLanguage)
      : super(name, salary);
  
  @override
  void displayInfo() {
    super.displayInfo();
    print("Language: $programmingLanguage");
  }
  
  void code() => print("$name is coding in $programmingLanguage");
}
