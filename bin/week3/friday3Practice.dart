void friday3Practice(){


  // int number = 15;
  //
  // if (number > 0) {
  //   print("The number is positive");
  //
  // }
  //
  // if (number % 2 == 1) {
  //   print("The number is odd");
  // }
  //
  // if (number > 10) {
  //   print("The number is greater than 10");
  //   return;
  // }
  //
  // print("number is less than 100");
  // if (number < 100) {
  //   print("The number is less than 100");
  // }

// final int num = 20;
// const int num2 = 20;
//
// final int num3;
// const int num4;
//
// int num5;
// int num6 = 20;
//
// num6 = 30;
// num = 30;
// num2 = 30;
//
//  final ali;


  print("===== 1. Fields in Enum =====");
  print("Apple color: ${Fruit.apple.color}");
  print("Banana calories: ${Fruit.banana.calories}");

  print("\n===== 2. this in Extension =====");
  print("Is Monday weekend? ${Day.monday.isWeekend}");
  print("Is Sunday weekend? ${Day.sunday.isWeekend}");

  print("\n===== 3. Enum Constructor (Planet) =====");
  print("Earth mass: ${Planet.earth.mass}");
  print("Earth gravity: ${Planet.earth.surfaceGravity}");

  print("\n===== 4. Variable Declaration =====");
  const G = 6.67300e-11; // no type, Dart infers double
  var number = 100;      // inferred as int
  final pi = 3.14159;    // inferred as double
  print("G = $G, number = $number, pi = $pi");

  print("\n===== 5. Getter Example =====");
  Rectangle rect = Rectangle(10, 5);
  print("Rectangle area: ${rect.area}");

}


// ===============================
// ENUM & RELATED CONCEPTS IN DART
// ===============================

enum Fruit {
  // 🔹 Fields in Enum (color, calories)
  apple("Red", 52),
  banana("Yellow", 89),
  mango("Green/Yellow", 60);

  final String color;
  final int calories;

  const Fruit(this.color, this.calories);
}

// 🔹 Enum for Extension Example
enum Day { monday, tuesday, wednesday, thursday, friday, saturday, sunday }

// Add custom methods to enum using Extension
extension DayExtension on Day {
  bool get isWeekend => this == Day.saturday || this == Day.sunday;
}

// 🔹 Enum with Constructor (Planets)
enum Planet {
  mercury(3.303e+23, 2.4397e6),
  earth(5.976e+24, 6.37814e6),
  mars(6.421e+23, 3.3972e6);

  final double mass;   // kilograms
  final double radius; // meters

  const Planet(this.mass, this.radius);

  // Getter for surface gravity
  double get surfaceGravity {
    const G = 6.67300e-11; // Variable without explicit type (auto double)
    return G * mass / (radius * radius);
  }
}

// 🔹 Getter Example with Class
class Rectangle {
  final int width;
  final int height;

  Rectangle(this.width, this.height);

  // Computed Getter
  int get area => width * height;
}


