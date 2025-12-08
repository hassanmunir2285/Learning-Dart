/**
 * CONSTRUCTORS IN DART: DEFAULT, NAMED, AND FACTORY
 * 
 * WHAT IS A CONSTRUCTOR?
 * A constructor is a special method used to initialize objects.
 * It is called when an object is created.
 * 
 * TYPES OF CONSTRUCTORS:
 * 
 * 1. DEFAULT CONSTRUCTOR:
 *    - Also called generative constructor
 *    - Has the same name as the class
 *    - Can have parameters
 *    - Syntax: ClassName(parameters) { code }
 *    - Short form: ClassName(this.property1, this.property2)
 * 
 * 2. NAMED CONSTRUCTORS:
 *    - Multiple constructors with different names
 *    - Used for different ways of creating objects
 *    - Syntax: ClassName.constructorName(parameters) { code }
 *    - Examples: ClassName.fromJson(), ClassName.empty()
 * 
 * 3. FACTORY CONSTRUCTORS:
 *    - Can return instances of the class or subclasses
 *    - Can return cached instances (Singleton pattern)
 *    - Can return null (though not recommended)
 *    - Syntax: factory ClassName(parameters) { return instance; }
 *    - Must return an instance
 * 
 * CONSTRUCTOR FEATURES:
 * - Initializer List: Executes before constructor body
 * - Redirecting Constructors: Redirect to another constructor
 * - Constant Constructors: For compile-time constants
 * - Private Constructors: For Singleton pattern
 * 
 * CONSTRUCTOR VS METHOD:
 * - Constructor has same name as class
 * - Constructor has no return type
 * - Constructor is called automatically on object creation
 * - Method can have any name and return type
 */

void main() {
  print('=== CONSTRUCTORS IN DART ===\n');
  
  // Default constructor
  print('--- Default Constructor ---');
  Car car1 = Car("Honda", 125);
  car1.brand = "Toyota";
  car1.speed = 80;
  car1.drive();
  
  // Named constructors
  print('\n--- Named Constructors ---');
  Car.namedConstructor_1("Honda", 125);
  Car car2 = Car.namedConstructor_2("Yamaha", 100);
  Car.namedConstructor_2('CD', 70);
  
  car2.vcd;
  print('Car color: ${car2.vcd}');
  car2.Hassan = "white";
  
  // Person class with default and named constructors
  print('\n--- Person with Multiple Constructors ---');
  Person p = Person(20, "Hassan");
  Person p1 = Person.gymer("Hamza");
  
  print('Phone number: ${p.PN}');
  p.cellNum = "123456789";
  print('Phone number after setting: ${p.PN}');
  
  // Factory constructor example
  print('\n--- Factory Constructor ---');
  factoryConstructor();
  
  // Singleton class example
  print('\n--- Singleton Pattern ---');
  singletonClass();
  
  // Additional examples
  print('\n--- Additional Examples ---');
  Rectangle rect1 = Rectangle(10, 5);
  Rectangle rect2 = Rectangle.square(10);
  Rectangle rect3 = Rectangle.fromList([15, 20]);
  
  rect1.displayInfo();
  rect2.displayInfo();
  rect3.displayInfo();
}

/**
 * Factory Constructor Example
 * Creates different shape types based on input
 */
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
  }
  
  // Private constructors (cannot be called directly)
  Shape1._(); // Private constructor with name "_"
  Shape1._privateNamedConstructor();
}

class Circle1 extends Shape1 {
  Circle1() : super._() {
    print("Circle1 constructor called");
  }
}

class Square1 extends Shape1 {
  Square1() : super._privateNamedConstructor() {
    print("Square1 constructor called");
  }
}

void factoryConstructor() {
  Shape1 s = Shape1("square");
  print('Shape type: ${s.runtimeType}');
}

/**
 * Singleton Class (using factory)
 * Ensures only one instance exists
 */
class Database {
  // Private static instance
  static final Database _instance = Database._internal();
  
  // Private named constructor
  Database._internal(); // Cannot be called from outside
  
  // Factory constructor - always returns same instance
  factory Database() {
    return _instance; // Always return the same instance
  }
  
  void query(String sql) {
    print("Executing $sql");
  }
}

void singletonClass() {
  var db1 = Database();
  var db2 = Database();
  Database db3 = Database();
  
  db3.query("SELECT * FROM users");
  print('db1: $db1');
  print('db2: $db2');
  print('db3: $db3');
  print('All same instance: ${db1 == db2 && db2 == db3}'); // true
}

/**
 * Car class with different constructors
 */
class Car {
  String brand = "Unknown";
  int speed = 0;
  
  String _color = "yellow"; // Private property
  
  // Getter for color
  String get vcd => _color;
  
  // Setter for color
  set Hassan(String y) {
    if (y == "white") {
      print("color of car is not yellow");
    }
  }
  
  // Default Constructor
  Car(this.brand, this.speed) {
    print("Hello! I am Default Constructor with brand $brand and power $speed");
  }
  
  // Named Constructor 1
  Car.namedConstructor_1(this.brand, this.speed) {
    print("Hello! I am Named Constructor 1 with brand $brand and power $speed");
  }
  
  // Named Constructor 2
  Car.namedConstructor_2(this.brand, this.speed) {
    print("Hello! I am Named Constructor 2 with brand $brand and power $speed");
  }
  
  void drive() {
    print("$brand is driving at $speed km/h");
  }
}

/**
 * Person class with constructors
 */
class Person {
  String? name;
  int? age;
  
  String? _phoneNumber; // Private property
  
  // Default Constructor
  Person(this.age, this.name) {}
  
  // Named Constructor
  Person.gymer(this.name) {}
  
  // Getter
  String? get PN => _phoneNumber;
  
  // Setter
  set cellNum(String n) {
    _phoneNumber = n;
  }
}

/**
 * Simple person class with constructor
 */
class person {
  String name;
  int age;
  
  person(this.name, this.age); // Constructor
}

/**
 * ADDITIONAL EXAMPLES
 */

// Rectangle with multiple constructors
class Rectangle {
  double width;
  double height;
  
  // Default constructor
  Rectangle(this.width, this.height);
  
  // Named constructor: Create square
  Rectangle.square(double side) : width = side, height = side;
  
  // Named constructor: From list
  Rectangle.fromList(List<double> dimensions)
      : width = dimensions[0],
        height = dimensions[1];
  
  // Named constructor: Empty rectangle
  Rectangle.empty() : width = 0, height = 0;
  
  double get area => width * height;
  
  void displayInfo() {
    print('Rectangle: ${width}x$height, Area: $area');
  }
}

// Student with factory constructor
class Student {
  String name;
  int age;
  
  // Private constructor
  Student._(this.name, this.age);
  
  // Factory constructor: From map
  factory Student.fromMap(Map<String, dynamic> map) {
    return Student._(map['name'], map['age']);
  }
  
  // Factory constructor: Default student
  factory Student.defaultStudent() {
    return Student._('Unknown', 0);
  }
  
  void displayInfo() {
    print('Student: $name, Age: $age');
  }
}

// Product with factory constructor for caching
class Product {
  final String id;
  final String name;
  final double price;
  
  // Cache of products
  static final Map<String, Product> _cache = {};
  
  // Private constructor
  Product._(this.id, this.name, this.price);
  
  // Factory constructor with caching
  factory Product(String id, String name, double price) {
    if (_cache.containsKey(id)) {
      return _cache[id]!;
    }
    final product = Product._(id, name, price);
    _cache[id] = product;
    return product;
  }
  
  void displayInfo() {
    print('Product: $name (ID: $id), Price: \$$price');
  }
}
