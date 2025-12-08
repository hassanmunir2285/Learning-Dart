/**
 * FUNCTIONS BASICS IN DART
 * 
 * What is a Function?
 * A function is a block of code that performs a specific task.
 * Functions help in code reusability and organization.
 * 
 * FUNCTION SYNTAX:
 * returnType functionName(parameters) {
 *   // code to execute
 *   return value; // if return type is not void
 * }
 * 
 * TYPES OF FUNCTIONS:
 * 
 * 1. Functions with no parameters and no return type:
 *    void functionName() { code }
 * 
 * 2. Functions with parameters but no return type:
 *    void functionName(param1, param2) { code }
 * 
 * 3. Functions with return type but no parameters:
 *    returnType functionName() { return value; }
 * 
 * 4. Functions with both parameters and return type:
 *    returnType functionName(param1, param2) { return value; }
 * 
 * RETURN TYPES:
 * - void: Function doesn't return anything
 * - int, double, String, bool: Returns specific type
 * - List, Map, Set: Returns collection types
 * - Custom types: Returns objects of custom classes
 * 
 * FUNCTION CALLING:
 * - Functions are called by their name followed by parentheses
 * - If function has parameters, pass values inside parentheses
 * - If function returns value, you can store it in a variable
 */

void main() {
  print('=== FUNCTIONS BASICS ===\n');
  
  // Calling different types of functions
  print('--- Calling Functions ---');
  sum();
  addition();
  multiply(2, 3, 2);
  string('Hassan', 'Hamza');
  print('Age: ${age()}');
  print('Subtract: ${subtract()}');
  print('Minus: ${minius(5, 2)}');
  print('Name: ${nameTwo('hamza')}');
  print('List: ${nameYoyo()}');
}

/**
 * Function with no parameters and no return type
 * This function simply prints a message
 */
void sum() {
  print('THIS IS A FUNCTION');
}

/**
 * Function with no parameters but performs operations
 * This function calculates and prints the result
 */
void addition() {
  int x = 20;
  int y = 30;
  int result = x + y;
  print('Addition result: $result');
}

/**
 * Function with parameters
 * Takes three integer parameters and prints their product
 * 
 * @param numberOne First number
 * @param numberTwo Second number
 * @param numberThree Third number
 */
void multiply(int numberOne, int numberTwo, int numberThree) {
  int product = numberOne * numberTwo * numberThree;
  print('Product: $product');
}

/**
 * Function with String parameters
 * Concatenates two strings and prints the result
 * 
 * @param name1 First name
 * @param name2 Second name
 */
void string(String name1, String name2) {
  String fullName = name1 + ' ' + name2;
  print('Full name: $fullName');
}

/**
 * Function with return type but no parameters
 * Returns an integer value
 * 
 * @return Returns the age as integer
 */
int age() {
  return 5;
}

/**
 * Function that returns calculated value
 * Performs subtraction and returns the result
 * 
 * @return Returns the difference of two numbers
 */
int subtract() {
  int a = 15;
  int b = 5;
  return a - b;
}

/**
 * Function with parameters and return type
 * Takes two integers and returns their difference
 * 
 * @param c First number
 * @param d Second number
 * @return Returns the difference
 */
int minius(int c, int d) {
  return c - d;
}

/**
 * Function that returns a String
 * Takes a string parameter and returns it
 * 
 * @param dFour Input string
 * @return Returns the input string
 */
String nameTwo(String dFour) {
  return dFour;
}

/**
 * Function that returns a List
 * Creates and returns a list of integers
 * 
 * @return Returns a list of integers
 */
List<int> nameYoyo() {
  List<int> age = [1, 2, 3, 4, 5];
  return age;
}

/**
 * ADDITIONAL EXAMPLES
 */

// Function that returns boolean
bool isEven(int number) {
  return number % 2 == 0;
}

// Function that returns double
double calculateArea(double radius) {
  const double pi = 3.14159;
  return pi * radius * radius;
}

// Function with multiple return statements
String getGrade(int score) {
  if (score >= 90) {
    return 'A';
  } else if (score >= 80) {
    return 'B';
  } else if (score >= 70) {
    return 'C';
  } else {
    return 'F';
  }
}

// Function that doesn't return (void)
void printMessage(String message) {
  print('Message: $message');
}
