import '../week2/sundayPractice.dart';

void tuesdayPractice() {
  // String test = " tom";
  // print(test);
  //
  // Person p = Person(20, "Hassan");
  // Person p1 = Person.gymer("Hamza");
  //
  // print(p.PN);
  // p.cellNum = "123456789";
  // print(p.PN);

  // Dog d = Dog();
  // d.bark();
  // d.eat();
  //
  // Male m = Male();
  // m.breathe();
  // m.eat();
  // m.bark();


  Car c = Car();
  Bike b = Bike();

  c.drive();
  c.move();
  b.ride();
  b.move();

  LivingThing l1 = Human();
  l1.breathe();
  Human h2 = Male();
  h2.eat();

}

// **** Types of Inheritance ****

// **** Single Inheritance **** //
class Animal {
  // Parent class
  void eat() {
    print("Animal is eating");
  }
}

class Dog extends Animal {
  // Child class
  void bark() => print("Dog is barking");
}

// **** Multilevel Inheritance → A → B → C ****

class LivingThing {
  void breathe() => print("Breathing...");
}

class Human extends LivingThing {
  void eat() => print("Eating...");
}

class Male extends Human {
  void bark() => print("Barking...");
}


// Hierarchical Inheritance → One parent → multiple children.

class Vehicle {
  void move() => print("Moving...");
}

class Car extends Vehicle {
  void drive() => print("Car driving");
}

class Bike extends Vehicle {
  void ride() => print("Bike riding");
}


/*
Multiple Inheritance ❌
👉 Dart does not support multiple inheritance directly (like class C extends A, B).
Instead, it uses Mixins or Interfaces.
 */



//  **** Class Basic Components *****
class Person {
  String? name;
  int? age;

  String? _phoneNumber;

  Person(this.age, this.name) {} // Default Constructor

  Person.gymer(this.name) {} // Named Constructor

  String? get PN => _phoneNumber; // Getter

  set cellNum(String n) {
    // Setter
    _phoneNumber = n;
  }
}
