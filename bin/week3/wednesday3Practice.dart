void wednesday3Practice() {
  //   int numberTest = 27;
  //   print(numberTest);
  //
  //
  //
  // calculator londa= calculator();
  // print(londa.sum(10, 20)); //
  // print(londa.sum(10, 20, 30));

  // Animal d = Dog();
  // Animal c = Cat();
  // d.sound();
  // c.sound();

  // Vehicle vc = Vehicle();  can't create object Because it is abstract class
  // Bike b = Bike();
  // b.stop();
  // b.move();
  // Truck t = Truck();
  // t.stop();
  // t.move();
  //
  // Vehicle vb = Bike();
  // vb.move();
  // vb.stop();
  //
  // var vt = Truck();
  // vt.move();
  // vt.stop();

  // AllInOne device = AllInOne();
  // device.printData();  // Printing...
  // device.scanData();   // Scanning...
  //
  // Printer p = AllInOne();
  // p.printData();  // Printing...
  // // p.scanData(); ❌ not allowed, because p is Printer type only
  //
  // Scanner s = AllInOne();
  // s.scanData();   // Scanning...
  // // s.printData(); ❌ not allowed, because s is Scanner type only
  //
  // var device1 = AllInOne();
  // device1.printData();  // Printing...
  // device1.scanData();   // Scanning...

  // Duck d = Duck();
  // d.fly();   // Flying...
  // d.swim();  // Swimming...
  // d.quack(); // Quacking...

  //  Fly fl = Fly();      ❌ not allowed, because Fly is a mixin

  // print(MathHelper.pi);
  // print(MathHelper.square(5));
  // print(MathHelper.square(12));

  // Box obj = Box(10);
  // print(obj.length);

  Student s1 = Student(23, "Tom", 42);
  s1.greet();
  s1.show();
}

/*
| Keyword   | Refers To      | Use Case                                          |
| --------- | -------------- | ------------------------------------------------- |
| **this**  | Current object | Access current object’s properties & methods      |
| **super** | Parent class   | Access parent’s properties, methods, constructors |

 */

// **** Super Keywork ****

class Person {
  // Parent class
  String name;
  int age;

  Person(this.name, this.age);

  String message = "Hi from Parent";

  void greet() => print("Hello from Parent");
}

class Student extends Person {
  // Child Class
  int rollNo;
  String message = "Hi from Child";

  // Pass name to parent's constructor using super()
  Student(this.rollNo, String name, int age) : super(name, age);

  @override
  void greet() {
    super.greet(); // calls Parent's greet()
    print("Hello from Child"); // then Child's own logic
  }

  void show() {
    print("Name: $name, Roll No: $rollNo and age : $age");
    print(this.message); // Child's message
    print(super.message); // Parent's message
  }
}

// **** This Keyword ****
class Box {
  int length;

  // Box(int length1) {
  //   this.length = length1; // ❌ confusing! assigns parameter to itself
  // }

  Box(this.length);
}

// **** Static Members *****

class MathHelper {
  static const pi = 3.14;

  static int square(int x) => x * x;
}

//  **** Mixins **** //

mixin Fly {
  // Parent mixin 1
  void fly() => print("Flying...");
}
mixin Swim {
  // Parent mixin 2
  void swim() => print("Swimming...");
}

class Duck with Fly, Swim {
  void quack() => print("Quacking...");

  void fly() => print("Flying with wings...");
}

//  **** Interface (Multiple Inheritance & Multiple Parents)**** //
class Printer {
  // Parent class 1
  void printData() {}
}

class Scanner {
  // Parent class 2
  void scanData() {}
}

class AllInOne implements Printer, Scanner {
  // Child class
  @override
  void printData() => print("Printing...");

  @override
  void scanData() => print("Scanning...");
}

// **** Abstract Class **** //
abstract class Vehicle {
  void
  move(); // abstract method (no body) & is required in all its child classes
  void stop() => print("Vehicle stopped"); // normal method
}

class Bike extends Vehicle {
  @override
  void move() => print("Bike is moving");
}

class Truck extends Vehicle {
  @override
  void move() => print("Truck is moving");

  @override
  void stop() => print("Truck stopped");
}

/*
Types of Polymorphism

1. Compile-time (Static Polymorphism)
In some languages → done via method overloading (same method name, different parameters).
Dart ❌ does not support true method overloading.
But we can simulate it using optional/named parameters.

2. Runtime (Dynamic Polymorphism)
Achieved by method overriding in Dart.
 */

// ****Compile-time (Static Polymorphism)****

class calculator {
  int sum(int a, int b, [int? c]) {
    if (c != null) {
      return a + b + c;
    } else {
      return a + b;
    }
  }
}

// **** Runtime (Dynamic Polymorphism) ****

class Animal {
  void sound() => print("Animal makes a sound");
}

class Dog extends Animal {
  @override
  void sound() => print("Dog barks");
}

class Cat extends Animal {
  @override
  void sound() => print("Cat meows");
}
