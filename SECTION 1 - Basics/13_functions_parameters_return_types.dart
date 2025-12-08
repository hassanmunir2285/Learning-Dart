/**
 * FUNCTIONS: PARAMETERS & RETURN TYPES
 * 
 * PARAMETER TYPES:
 * 
 * 1. REQUIRED PARAMETERS:
 *    - Must be provided when calling the function
 *    - Syntax: functionName(type param1, type param2)
 *    - All parameters are required by default
 * 
 * 2. OPTIONAL POSITIONAL PARAMETERS:
 *    - Enclosed in square brackets []
 *    - Can be omitted when calling
 *    - Syntax: functionName(type param1, [type? param2])
 *    - Must be nullable or have default values
 * 
 * 3. OPTIONAL NAMED PARAMETERS:
 *    - Enclosed in curly braces {}
 *    - Called by name, not position
 *    - Syntax: functionName(type param1, {type? param2})
 *    - Use 'required' keyword to make them mandatory
 * 
 * 4. DEFAULT PARAMETERS:
 *    - Provide default values for optional parameters
 *    - Syntax: functionName([type param = defaultValue])
 *    - Used when parameter is not provided
 * 
 * RETURN TYPES:
 * - void: No return value
 * - int, double, String, bool: Primitive types
 * - List, Map, Set: Collection types
 * - Custom classes: User-defined types
 * - Can return null if return type is nullable
 */

import 'dart:io';

void main() {
  print('=== FUNCTIONS: PARAMETERS & RETURN TYPES ===\n');
  
  // Function with no parameters
  findPerimeter();
  
  // Function with required parameters
  findPerameter(4, 3);
  
  // Function with required parameters (all must be provided)
  print('');
  printCities('Lahore', 'Shahaniya', 'Doha');
  
  // Function with optional positional parameters
  print('');
  printCountries('Pakistan'); // Only first parameter
  printCountries('Pakistan', 'India'); // Two parameters
  printCountries('Pakistan', 'India', 'Bangladesh'); // All parameters
  
  // Function with optional named parameters
  print(findVolume(10, 5, height: 20));
  
  // Required positional parameters
  requiredpositional(2, 'hamza');
  
  // Required named parameters
  requiredname(age: 15, name: 'Ali');
  
  // Optional positional parameters
  positionalPerameter(24, 'Tom');
  positionalPerameter(24); // Second parameter omitted
  
  // Optional named parameters
  namePerameter(age: 15, city: 'Ali');
  namePerameter(city: 'Karachi'); // age omitted
  
  // Default optional positional
  defaultOptionalposition(5);
  defaultOptionalposition(); // Uses default values
  
  // Default optional named
  defaultOptionalname(add: 10);
  defaultOptionalname(); // Uses default value
}

/**
 * Function with no parameters
 * Calculates and prints perimeter
 */
void findPerimeter() {
  int length = 4;
  int breadth = 3;
  int perimeter = 2 * (length + breadth);
  print('Perimeter is: $perimeter');
  print('');
}

/**
 * Function with required parameters
 * Uses arrow function syntax (shorthand)
 * 
 * @param length Length of rectangle
 * @param breadth Breadth of rectangle
 */
void findPerameter(int length, int breadth) =>
    print('The parameter is ${2 * (length + breadth)}');

/**
 * Required parameters - all parameters must be provided
 * In required parameters, we write all parameters given,
 * like in this example there are 3 parameters
 * 
 * @param name1 First city name
 * @param name2 Second city name
 * @param name3 Third city name
 */
void printCities(String name1, String name2, String name3) {
  print('City 1: $name1');
  print('City 2: $name2');
  print('City 3: $name3');
}

/**
 * Optional positional parameters - parameters in square brackets are optional
 * In optional parameters, we use square brackets for parameters that can be null
 * 
 * Parameters have two types:
 * 1. Required
 * 2. Optional
 * 
 * Optional parameters have 3 more types:
 * 2(a) Positional
 * 2(b) Named
 * 2(c) Default
 * 
 * @param name1 First country (required)
 * @param name2 Second country (optional)
 * @param name3 Third country (optional)
 */
void printCountries(String name1, [String? name2, String? name3]) {
  print('Country 1: $name1');
  print('Country 2: $name2');
  print('Country 3: $name3');
}

/**
 * Optional named parameters - use curly braces and 'required' keyword
 * Named parameters are called by name, making code more readable
 * 
 * @param length Length of box
 * @param breadth Breadth of box
 * @param height Height of box (required named parameter)
 * @return Returns the volume
 */
int findVolume(int length, int breadth, {required int height}) {
  print('Length: $length');
  print('Breadth: $breadth');
  print('Height: $height');
  print('Volume: ${length * breadth * height}');
  int result = length * breadth * height;
  return result;
}

/**
 * Required positional parameters
 * Both parameters must be provided in order
 * 
 * @param age Person's age
 * @param name Person's name
 */
void requiredpositional(int age, String name) {
  print('Required Positional - Age: $age, Name: $name');
}

/**
 * Required named parameters
 * Both parameters must be provided, but by name
 * 
 * @param age Person's age
 * @param name Person's name
 */
void requiredname({required int age, required String name}) {
  print('Required Named - Age: $age, Name: $name');
}

/**
 * Optional positional parameters
 * Parameters can be omitted, will be null if not provided
 * 
 * @param age Person's age (optional)
 * @param name Person's name (optional)
 */
void positionalPerameter([int? age, String? name]) {
  print('Positional Parameters - Age: $age, Name: $name');
}

/**
 * Optional named parameters
 * Parameters can be omitted, called by name
 * 
 * @param age Person's age (optional)
 * @param city Person's city (optional)
 */
void namePerameter({int? age, String? city}) {
  print('Named Parameters - Age: $age, City: $city');
}

/**
 * Default optional positional parameters
 * Parameters have default values if not provided
 * 
 * @param sum Sum value (default: 5)
 * @param classs Class name (default: 'coding')
 */
void defaultOptionalposition([int sum = 5, String classs = 'coding']) {
  print('Default Optional Positional - Sum: $sum, Class: $classs');
}

/**
 * Default optional named parameters
 * Parameter has default value if not provided
 * 
 * @param add Add value (default: 10)
 */
void defaultOptionalname({int add = 10}) {
  print('Default Optional Named - Add: $add');
}

/**
 * ADDITIONAL EXAMPLES
 */

// Function with return type
int calculateSum(int a, int b) {
  return a + b;
}

// Function returning String
String greetUser(String name) {
  return 'Hello, $name!';
}

// Function returning bool
bool isAdult(int age) {
  return age >= 18;
}

// Function returning List
List<int> generateNumbers(int count) {
  List<int> numbers = [];
  for (int i = 1; i <= count; i++) {
    numbers.add(i);
  }
  return numbers;
}

// Function with mixed parameter types
void mixedParameters(String name, [int? age], {String? city, bool isActive = true}) {
  print('Name: $name');
  print('Age: $age');
  print('City: $city');
  print('Is Active: $isActive');
}
