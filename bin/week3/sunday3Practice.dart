void sunday3Practice() {
  // Enums demo
  enum1();
  enum2();
  enum3();

  // ❌ ERROR: Cannot do this
  // Shape s = Shape();

  // ✅ Create subclass objects instead
  Circle c = Circle(5);
  print("Circle radius: ${c.radius}");

  Square sq = Square(4);
  print("Square side: ${sq.side}");

  // ✅ Using base class directly
  Animal1 a = Animal1();
  a.breathe();

  // ✅ Using subclass
  Dog1 d = Dog1();
  d.breathe(); // inherited from Animal1
  d.bark(); // Dog1’s own method

  // ✅ Using final class
  Logger logger = Logger();
  logger.log("Hello from final class!");
  logger.breathe();

  // ✅ Using combined sealed/base/final example
  Dog2 dog = Dog2();
  dog.bark();
  dog.feedYoung();
  // Dog3 obj = Mammal();   Can't create an object of sealed class, you need to extent this class to some normal class to call its functions
  // obj.feedYoung();
  Utility.showMessage("Hello from Utility final class!");
  print("\n\n");
  factoryConstructor();
  singletonClass();
}

// ******** Factory Constructor ********
class Shape1 {
  // Factory constructor
  factory Shape1(String type) {
    if (type == "circle") {
      return Circle1();
    }
    if (type == "square") {
      return Square1();
    }
    throw ArgumentError("Invalid shape type: $type");
    // instead of returning null, throw error
  }

  // Add a normal (generative) constructor
  Shape1._(); // This is private constructor with name "_"
  // you can also write it as below
  Shape1._privateNamedConstructor();
}

class Circle1 extends Shape1 {
  Circle1() : super._() {
    print("Circle1 constructor called");
  } // Call the private generative constructor
  // Circle1() : super._privateNamedConstructor();  // can't call two parents constructor in child class
}

class Square1 extends Shape1 {
  // Square1() : super._(); // Call the private generative constructor
  Square1() : super._privateNamedConstructor() {
    print("Square1 constructor called");
  }
}

void factoryConstructor() {
  Shape1 s = Shape1("square");
  print(s.runtimeType); // Circle1
}

//  *********** Singleton Class (using factory) ********
class Database {
  // In the below line we are creating instance of class, which is private, static and final
  static final Database _instance = Database._internal();

  Database._internal(); // private named constructor

  factory Database() {
    // factory constructor
    return _instance; // always return some instance
  }

  void query(String sql) {
    print("Executing $sql");
  }
}

void singletonClass() {
  var db1 = Database();
  var db2 = Database();
  Database db3 = Database();
  db3.query("Hamza");
  print(db3);
  print(db1 == db2 && db2 == db3); // true → only one instance
}

///     ************ Enum from Basic to Advance *************      ///

enum Days { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

void enum1() {
  String dayName = "Thursday";
  Days today = Days.Thursday;

  if (today.name == dayName) {
    print("Mid of the week!");
  }
}

enum VehicleType {
  car("Car", 4, 4),
  bike("Bike", 2, 0), // Fields
  truck("Truck", 6, 2);

  final String name;
  final int wheels; // variables
  final int doors;

  const VehicleType(this.name, this.wheels, this.doors); // Default constructor

  void showDetails() {
    print("$name has $wheels wheels and $doors doors."); // normal function
  }
}

void enum2() {
  VehicleType v = VehicleType.bike;
  v.showDetails(); // Bike has 2 wheels and 0 doors
}

enum Status { success, error, loading }

void enum3() {
  Status s = Status.success;
  print("Value of s : $s");
  print(s.name);

  switch (s.name) {
    case "success":
      print("Data loaded successfully!");
      break;
    case "error":
      print("Something went wrong!");
      break;
    case "loading":
      print("Loading data...");
      break;
    default:
      print("Unknown status!");
  }
}

//  ************ Sealed Classes *************
sealed class Shape {}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);
}

class Square extends Shape {
  final double side;

  Square(this.side);
}

// ************ Base Class *************
base class Animal1 {
  //   sub class of base class can be extanded, implemented and mixin
  void breathe() => print("Breathing...");
}

base class Dog1 extends Animal1 {
  /// always use keyword of base  ,final ,sealed in child or sub class//
  void bark() => print("Woof!");
}

// ************ Final Class *************
final class Logger implements Animal1 {
  // final class ki child class nahi ho skta
  void log(String message) {
    print("LOG: $message"); //
  }

  @override
  void breathe() => print("Breathing...");
}

// ************ Combined Example(sealed , final , base class) *************
sealed class Animal2 {}

base class Mammal extends Animal2 {
  void feedYoung() => print("Feeding milk...");
}

final class Dog2 extends Mammal {
  void bark() => print("Woof!");
}

sealed class Dog3 implements Mammal, Dog2, Animal2 {
  @override
  void feedYoung() => print("Feeding milk of Dog3...");
}

final class Utility extends Mammal {
  static void showMessage(String msg) => print("UTIL: $msg");
}
