void saturdayPractice() {
  // Car car1 = Car("Honda", 125); // object creation
  // car1.brand = "Toyota";
  // car1.speed = 80;
  // car1.drive(); // Toyota is driving at 80 km/h
  // var _ali = "Student";
  // Car.namedConstructor_1("Honda", 125);
  //
  // Car car2 = Car.namedConstructor_2("Yamaha", 100);
  // Car.namedConstructor_2('CD', 70);
  //
  //
  // car2.vcd;
  // print(car2.vcd);
  // car2.Hassan = "white";

  // Dog d = Dog();
  // d.eat();  // inherited
  // d.bark(); // own method

  // Shape draw1 = Shape();
  // draw1.draw();
  //
  // Shape draw2 = Circle();
  // draw2.draw();
  //
  // Shape draw3 = Square();
  // draw3.draw();


  // Vehicle v = Vehicle(); Can't create the abject of abstract class.
  Vehicle v1 = Bike();
  Vehicle v2 = Truck();
  v1.stop();
  v2.stop();
  v1.move();
  v2.move();
}


// **** Abstract Class **** //
abstract class Vehicle {
  void move(); // abstract method (no body) & is required in all its child classes
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


// **** Inheritance **** //
class Animal {    // Parent class
  void eat() => print("Animal is eating");
}

class Dog extends Animal {     // Child class
  void bark() => print("Dog is barking");
}



// **** Polymorphism **** //
class Shape {   // Parent class
  void draw() => print("Drawing shape");
}

class Circle extends Shape {   // Child class
  @override
  void draw() => print("Drawing circle");
}

class Square extends Shape {   // Child class
  @override
  void draw ( ) => print("Drawing square");
}









class Car {
  String brand = "Unknown";
  int speed = 0;

  String _color = "yellow" ;

  String get vcd => _color;

  set Hassan( String y) {
    if(y == "white"){
      print("color of car is not yellow");
    }
  }

  Car(this.brand, this.speed) {
    print("Hello! I am Default Constructor with brand $brand and power $speed");
  } // Default Constructor

  Car.namedConstructor_1(this.brand, this.speed) {
    print("Hello! I am Named Constructor 1 with brand $brand and power $speed");
  }

  Car.namedConstructor_2(this.brand, this.speed) {
    print("Hello! I am Named Constructor 2 with brand $brand and power $speed");
  }

  void drive() {
    print("$brand is driving at $speed km/h");
  }
}







