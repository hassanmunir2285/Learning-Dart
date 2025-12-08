/**
 * ENHANCED ENUMS (METHODS INSIDE ENUMS – DART 3)
 * 
 * WHAT ARE ENHANCED ENUMS?
 * Enhanced enums (Dart 3+) allow enums to have:
 * - Fields (properties)
 * - Constructors
 * - Methods
 * - Getters
 * - Implement interfaces
 * 
 * KEY FEATURES:
 * 
 * 1. Fields in Enum:
 *    - Each enum value can have associated data
 *    - Syntax: enumValue(field1, field2)
 * 
 * 2. Constructors:
 *    - Can have constructors to initialize fields
 *    - Must be const constructor
 *    - Syntax: const EnumName(this.field1, this.field2)
 * 
 * 3. Methods:
 *    - Can define methods inside enum
 *    - Methods can access enum fields
 *    - Can override toString()
 * 
 * 4. Getters:
 *    - Can define computed properties
 *    - Use get keyword
 * 
 * 5. Extensions:
 *    - Can add functionality using extensions
 *    - Useful for adding methods without modifying enum
 * 
 * BENEFITS:
 * - More powerful than basic enums
 * - Can store data with enum values
 * - Better encapsulation
 * - Type-safe constants with behavior
 */

void main() {
  print('=== ENHANCED ENUMS (DART 3) ===\n');
  
  // 1. Fields in Enum
  print('===== 1. Fields in Enum =====');
  print("Apple color: ${Fruit.apple.color}");
  print("Banana calories: ${Fruit.banana.calories}");
  print("Mango color: ${Fruit.mango.color}");
  
  // 2. Extension on Enum
  print("\n===== 2. Extension on Enum =====");
  print("Is Monday weekend? ${Day.monday.isWeekend}");
  print("Is Sunday weekend? ${Day.sunday.isWeekend}");
  print("Is Friday weekend? ${Day.friday.isWeekend}");
  
  // 3. Enum Constructor (Planet)
  print("\n===== 3. Enum Constructor (Planet) =====");
  print("Earth mass: ${Planet.earth.mass} kg");
  print("Earth radius: ${Planet.earth.radius} m");
  print("Earth gravity: ${Planet.earth.surfaceGravity} m/s²");
  
  // 4. Variable Declaration
  print("\n===== 4. Variable Declaration =====");
  const G = 6.67300e-11; // no type, Dart infers double
  var number = 100;      // inferred as int
  final pi = 3.14159;    // inferred as double
  print("G = $G, number = $number, pi = $pi");
  
  // 5. Getter Example
  print("\n===== 5. Getter Example =====");
  Rectangle rect = Rectangle(10, 5);
  print("Rectangle area: ${rect.area}");
  
  // Enum with fields and methods
  print("\n===== 6. Enum with Methods =====");
  VehicleType v = VehicleType.bike;
  v.showDetails(); // Bike has 2 wheels and 0 doors.
  
  VehicleType car = VehicleType.car;
  car.showDetails();
  
  // Using enum methods
  print("\n===== 7. Using Enum Methods =====");
  HttpStatus status = HttpStatus.ok;
  print("Status: ${status.code} - ${status.message}");
  print("Is success: ${status.isSuccess}");
  
  HttpStatus error = HttpStatus.notFound;
  print("Status: ${error.code} - ${error.message}");
  print("Is success: ${error.isSuccess}");
}

/**
 * Enum with Fields
 * Each enum value has associated data
 */
enum Fruit {
  // Fields in Enum (color, calories)
  apple("Red", 52),
  banana("Yellow", 89),
  mango("Green/Yellow", 60);
  
  final String color;
  final int calories;
  
  // Constructor must be const
  const Fruit(this.color, this.calories);
  
  // Can add methods
  String getDescription() {
    return "$name is $color and has $calories calories";
  }
}

/**
 * Enum for Extension Example
 * Basic enum that we'll extend
 */
enum Day {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

/**
 * Extension to add functionality to enum
 * Adds computed property using 'this'
 */
extension DayExtension on Day {
  bool get isWeekend => this == Day.saturday || this == Day.sunday;
  
  bool get isWeekday => !isWeekend;
  
  String get dayName => name[0].toUpperCase() + name.substring(1);
}

/**
 * Enum with Constructor (Planets)
 * Demonstrates enum with multiple fields and computed getter
 */
enum Planet {
  mercury(3.303e+23, 2.4397e6),
  earth(5.976e+24, 6.37814e6),
  mars(6.421e+23, 3.3972e6);
  
  final double mass;   // kilograms
  final double radius; // meters
  
  const Planet(this.mass, this.radius);
  
  // Getter for surface gravity (computed property)
  double get surfaceGravity {
    const G = 6.67300e-11; // Gravitational constant
    return G * mass / (radius * radius);
  }
  
  // Method to get planet info
  String getInfo() {
    return "$name: mass=${mass}e+23 kg, radius=${radius}e+6 m, gravity=${surfaceGravity.toStringAsFixed(2)} m/s²";
  }
}

/**
 * Getter Example with Class
 * Demonstrates computed getters
 */
class Rectangle {
  final int width;
  final int height;
  
  Rectangle(this.width, this.height);
  
  // Computed Getter
  int get area => width * height;
  
  int get perimeter => 2 * (width + height);
}

/**
 * Enum with fields and methods
 * Complete example with constructor and methods
 */
enum VehicleType {
  car("Car", 4, 4),
  bike("Bike", 2, 0),
  truck("Truck", 6, 2);
  
  final String name;
  final int wheels;
  final int doors;
  
  const VehicleType(this.name, this.wheels, this.doors);
  
  // Method inside enum
  void showDetails() {
    print("$name has $wheels wheels and $doors doors.");
  }
  
  // Getter
  String get description => "$name with $wheels wheels";
  
  // Method with logic
  bool canCarryPassengers(int count) {
    return count <= doors;
  }
}

/**
 * ADDITIONAL EXAMPLES
 */

// HTTP Status enum with methods
enum HttpStatus {
  ok(200, "OK"),
  created(201, "Created"),
  badRequest(400, "Bad Request"),
  unauthorized(401, "Unauthorized"),
  notFound(404, "Not Found"),
  serverError(500, "Internal Server Error");
  
  final int code;
  final String message;
  
  const HttpStatus(this.code, this.message);
  
  bool get isSuccess => code >= 200 && code < 300;
  
  bool get isError => code >= 400;
  
  String get fullStatus => "$code $message";
}

// User role enum with permissions
enum UserRole {
  guest(0, ["read"]),
  user(1, ["read", "write"]),
  moderator(2, ["read", "write", "moderate"]),
  admin(3, ["read", "write", "moderate", "admin"]);
  
  final int level;
  final List<String> permissions;
  
  const UserRole(this.level, this.permissions);
  
  bool hasPermission(String permission) {
    return permissions.contains(permission);
  }
  
  bool canAccess(UserRole requiredRole) {
    return level >= requiredRole.level;
  }
  
  String get roleName => name[0].toUpperCase() + name.substring(1);
}

// Order status enum with transitions
enum OrderStatus {
  pending("Pending", ["processing", "cancelled"]),
  processing("Processing", ["shipped", "cancelled"]),
  shipped("Shipped", ["delivered"]),
  delivered("Delivered", []),
  cancelled("Cancelled", []);
  
  final String displayName;
  final List<String> allowedTransitions;
  
  const OrderStatus(this.displayName, this.allowedTransitions);
  
  bool canTransitionTo(OrderStatus newStatus) {
    return allowedTransitions.contains(newStatus.name);
  }
  
  void transitionTo(OrderStatus newStatus) {
    if (canTransitionTo(newStatus)) {
      print("Order status changed from $displayName to ${newStatus.displayName}");
    } else {
      print("Cannot transition from $displayName to ${newStatus.displayName}");
    }
  }
}

// Priority enum with color coding
enum Priority {
  low("Low", "green"),
  medium("Medium", "yellow"),
  high("High", "orange"),
  urgent("Urgent", "red");
  
  final String label;
  final String color;
  
  const Priority(this.label, this.color);
  
  int get numericValue {
    switch (this) {
      case Priority.low:
        return 1;
      case Priority.medium:
        return 2;
      case Priority.high:
        return 3;
      case Priority.urgent:
        return 4;
    }
  }
  
  bool isHigherThan(Priority other) {
    return numericValue > other.numericValue;
  }
  
  String get formattedLabel => "[$color]$label[/$color]";
}
