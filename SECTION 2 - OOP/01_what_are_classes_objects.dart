/**
 * WHAT ARE CLASSES & OBJECTS IN DART
 * 
 * OBJECT-ORIENTED PROGRAMMING (OOP):
 * OOP is a programming paradigm that organizes code into objects.
 * Objects are instances of classes that contain both data and methods.
 * 
 * CLASS:
 * A class is a blueprint or template for creating objects.
 * It defines:
 * - Properties (variables/fields): Characteristics of the object
 * - Methods (functions): Behaviors/actions the object can perform
 * - Constructors: Special methods for creating objects
 * 
 * OBJECT:
 * An object is an instance of a class.
 * It is a concrete entity created from a class blueprint.
 * Multiple objects can be created from the same class.
 * 
 * KEY CONCEPTS:
 * 
 * 1. Encapsulation:
 *    - Bundling data and methods together
 *    - Data hiding using private members (prefixed with _)
 * 
 * 2. Class Members:
 *    - Instance variables: Belong to each object
 *    - Instance methods: Operate on instance variables
 *    - Static members: Belong to the class itself
 * 
 * 3. Object Creation:
 *    - Syntax: ClassName objectName = ClassName();
 *    - Objects are created using constructors
 * 
 * 4. Accessing Members:
 *    - Properties: object.propertyName
 *    - Methods: object.methodName()
 * 
 * BENEFITS OF OOP:
 * - Code Reusability
 * - Modularity
 * - Maintainability
 * - Abstraction
 * - Encapsulation
 */

void main() {
  print('=== CLASSES & OBJECTS IN DART ===\n');
  
  // Creating objects from BankAccount class
  print('--- Bank Account Example ---');
  BankAccount account1 = BankAccount("Ali", 1000);
  BankAccount account2 = BankAccount("Sara", 500);
  
  // Using the methods
  account1.checkBalance();
  account1.deposit(200);
  account1.withdraw(1500);
  account1.withdraw(300);
  
  print(""); // line break
  
  account2.checkBalance();
  account2.deposit(100);
  account2.withdraw(50);
  
  // Creating Student object
  print('\n--- Student Example ---');
  Student student1 = Student();
  
  student1.age = 20;
  student1.name = 'HP';
  student1.grade = 'B';
  student1.studentID = 2285;
  
  student1.displayInfo();
  student1.updateGrade('A');
  
  // Creating Person object
  print('\n--- Person Example ---');
  Person p1 = Person('john', 'male', 26);
  p1.showData();
  print('Name: ${p1.name}');
  
  // Multiple objects from same class
  print('\n--- Multiple Objects ---');
  Person p2 = Person('Alice', 'female', 25);
  Person p3 = Person('Bob', 'male', 30);
  
  p2.showData();
  p3.showData();
}

/**
 * A simple Bank Account system in Dart
 * Demonstrates class with properties and methods
 */
class BankAccount {
  String owner;      // Property: Account owner name
  double balance;    // Property: Account balance
  
  // Constructor: Initializes object with owner and balance
  BankAccount(this.owner, this.balance);
  
  /**
   * Deposit money into account
   * @param amount Amount to deposit
   */
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("$owner deposited \$${amount}. New balance: \$${balance}");
    } else {
      print("Deposit amount must be positive.");
    }
  }
  
  /**
   * Withdraw money from account
   * @param amount Amount to withdraw
   */
  void withdraw(double amount) {
    if (amount > 0 && amount <= balance) {
      balance -= amount;
      print("$owner withdrew \$${amount}. Remaining balance: \$${balance}");
    } else if (amount > balance) {
      print("Insufficient funds. Current balance: \$${balance}");
    } else {
      print("Withdrawal amount must be positive.");
    }
  }
  
  /**
   * Check and display account balance
   */
  void checkBalance() {
    print("Account Holder: $owner, Balance: \$${balance}");
  }
}

/**
 * Student class example
 * Demonstrates class with nullable properties
 */
class Student {
  String? name;      // Nullable property
  int? age;          // Nullable property
  String? grade;     // Nullable property
  int? studentID;    // Nullable property
  
  /**
   * Display student information
   */
  void displayInfo() {
    print('Student Name: $name');
    print('Age: $age');
    print('Grade: $grade');
    print('Student ID: $studentID');
    print('____________________');
  }
  
  /**
   * Update student grade
   * @param newGrade New grade to assign
   */
  void updateGrade(String newGrade) {
    grade = newGrade;
    print('Grade updated to $newGrade for $name');
  }
}

/**
 * Person class example
 * Demonstrates class with constructor
 */
class Person {
  String? name;  // Person's name
  String? sex;   // Person's gender
  int? year;      // Person's age
  
  /**
   * Constructor: Initializes Person object
   * @param name Person's name
   * @param sex Person's gender
   * @param year Person's age
   */
  Person(String name, sex, int year) {
    this.name = name;
    this.sex = sex;
    this.year = year;
  }
  
  /**
   * Display person's data
   */
  void showData() {
    print('Name = $name');
    print('Sex = $sex');
    print('Year = $year');
  }
}

/**
 * ADDITIONAL EXAMPLES
 */

// Simple Rectangle class
class Rectangle {
  double width;
  double height;
  
  Rectangle(this.width, this.height);
  
  // Method to calculate area
  double calculateArea() {
    return width * height;
  }
  
  // Method to calculate perimeter
  double calculatePerimeter() {
    return 2 * (width + height);
  }
  
  // Method to display information
  void displayInfo() {
    print('Rectangle: ${width}x$height');
    print('Area: ${calculateArea()}');
    print('Perimeter: ${calculatePerimeter()}');
  }
}

// Book class example
class Book {
  String title;
  String author;
  int pages;
  bool isAvailable;
  
  Book(this.title, this.author, this.pages, this.isAvailable);
  
  void displayInfo() {
    print('Title: $title');
    print('Author: $author');
    print('Pages: $pages');
    print('Available: $isAvailable');
  }
  
  void borrow() {
    if (isAvailable) {
      isAvailable = false;
      print('Book "$title" has been borrowed');
    } else {
      print('Book "$title" is not available');
    }
  }
  
  void returnBook() {
    isAvailable = true;
    print('Book "$title" has been returned');
  }
}
