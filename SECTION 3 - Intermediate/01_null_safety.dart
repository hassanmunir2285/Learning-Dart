/**
 * NULL SAFETY IN DART ( ?, !, late )
 * 
 * WHAT IS NULL SAFETY?
 * Null safety is a feature that prevents null reference errors
 * by making nullability explicit in the type system.
 * 
 * KEY CONCEPTS:
 * 
 * 1. NULLABLE TYPES (?):
 *    - Add ? after type to make it nullable
 *    - Syntax: String? name; (can be null)
 *    - Syntax: String name; (cannot be null)
 *    - Nullable variables can hold null or a value
 * 
 * 2. NULL-AWARE OPERATORS:
 *    - ?. (Null-aware access): Safely access properties/methods
 *    - ?? (Null-coalescing): Provide default value if null
 *    - ??= (Null-coalescing assignment): Assign if null
 *    - ! (Null assertion): Assert value is not null
 * 
 * 3. LATE KEYWORD:
 *    - For variables that will be initialized later
 *    - Must be initialized before first use
 *    - Runtime check ensures initialization
 *    - Syntax: late String name;
 * 
 * 4. REQUIRED KEYWORD:
 *    - For named parameters that must be provided
 *    - Cannot be null
 *    - Syntax: void func({required String name})
 * 
 * BENEFITS:
 * - Prevents NullPointerException errors
 * - Makes code more predictable
 * - Better IDE support and autocomplete
 * - Compile-time null checks
 */

void main() {
  print('=== NULL SAFETY IN DART ===\n');
  
  // 1. NULLABLE TYPES (?)
  print('--- Nullable Types (?) ---');
  
  // Nullable variables
  int? x;
  print('x (nullable int): $x'); // null
  
  x = 30;
  print('x after assignment: $x'); // 30
  
  String? name;
  print('name (nullable String): $name'); // null
  
  name = 'Hamza';
  print('name after assignment: $name'); // Hamza
  
  // Checking for null
  String? name1;
  if (name1 == null) {
    print('name1 is null');
  } else {
    print('name1 is not null: $name1');
  }
  
  // 2. NULL-AWARE OPERATORS
  print('\n--- Null-Aware Operators ---');
  
  // ?. (Null-aware access operator)
  String? maybeNull;
  int? length = maybeNull?.length; // Returns null if maybeNull is null
  print('maybeNull?.length: $length');
  
  maybeNull = 'Hello';
  length = maybeNull?.length;
  print('maybeNull?.length (after assignment): $length');
  
  // ?? (Null-coalescing operator)
  String? userName;
  String displayName = userName ?? 'Guest';
  print('Display name: $displayName');
  
  userName = 'John';
  displayName = userName ?? 'Guest';
  print('Display name: $displayName');
  
  // ??= (Null-coalescing assignment)
  String? email;
  email ??= 'default@example.com'; // Assigns if null
  print('Email: $email');
  
  email ??= 'another@example.com'; // Won't assign (already has value)
  print('Email (after second ??=): $email');
  
  // ! (Null assertion operator)
  print('\n--- Null Assertion Operator (!) ---');
  String? definitelyNotNull;
  definitelyNotNull = 'Hello';
  int len = definitelyNotNull!.length; // Asserts that value is not null
  print('Length: $len');
  
  // Warning: This will throw error if value is null
  // String? maybeNull2;
  // int len2 = maybeNull2!.length; // Runtime error!
  
  // 3. LATE KEYWORD
  print('\n--- Late Keyword ---');
  
  // Late variable - will be initialized later
  late String lateName;
  // print(lateName); // ❌ ERROR: Late variable not initialized
  
  lateName = 'Initialized later';
  print('Late name: $lateName');
  
  // Late with class
  late int lateNumber;
  lateNumber = 100;
  print('Late number: $lateNumber');
  
  // 4. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  
  // User class with nullable fields
  User user1 = User();
  user1.name = 'Alice';
  user1.displayInfo();
  
  User user2 = User();
  user2.name = 'Bob';
  user2.email = 'bob@example.com';
  user2.displayInfo();
  
  // Safe method calls
  String? text;
  print('Text length: ${text?.length ?? 0}');
  
  text = 'Hello World';
  print('Text length: ${text?.length ?? 0}');
  
  // Null-aware cascade
  List<int>? numbers;
  numbers?.add(1); // Won't execute if numbers is null
  print('Numbers: $numbers');
  
  numbers = [];
  numbers?.add(1);
  numbers?.add(2);
  print('Numbers: $numbers');
  
  // Chaining null-aware operators
  String? address;
  String? city = address?.toUpperCase();
  String result = city ?? 'Unknown';
  print('City: $result');
}

/**
 * User class demonstrating null safety
 */
class User {
  String? name;
  String? email;
  int? age;
  
  void displayInfo() {
    print('User Information:');
    print('Name: ${name ?? "Not provided"}');
    print('Email: ${email ?? "Not provided"}');
    print('Age: ${age ?? "Not provided"}');
    
    // Safe method calls
    name?.toUpperCase();
    email?.contains('@');
  }
  
  // Method with nullable return
  String? getEmailDomain() {
    return email?.split('@').last;
  }
}

/**
 * ADDITIONAL EXAMPLES
 */

// Class with late initialization
class Database {
  late String connectionString;
  
  void initialize(String connection) {
    connectionString = connection;
  }
  
  void connect() {
    print('Connecting to: $connectionString');
  }
}

// Function with nullable parameters
String? findUser(String? userId) {
  if (userId == null) {
    return null;
  }
  // Search logic here
  return 'User found: $userId';
}

// Nullable return type
int? parseNumber(String? input) {
  if (input == null) {
    return null;
  }
  return int.tryParse(input);
}

// Using null safety in collections
void demonstrateNullSafetyInCollections() {
  List<String?> names = ['Alice', null, 'Bob', null, 'Charlie'];
  
  // Filter out nulls
  List<String> nonNullNames = names.whereType<String>().toList();
  print('Non-null names: $nonNullNames');
  
  // Map with null handling
  List<String> upperNames = names
      .map((name) => name?.toUpperCase() ?? 'UNKNOWN')
      .toList();
  print('Upper names: $upperNames');
}

// Null safety with maps
void demonstrateNullSafetyInMaps() {
  Map<String, String?> userData = {
    'name': 'John',
    'email': null,
    'phone': '123-456-7890'
  };
  
  String name = userData['name'] ?? 'Unknown';
  String email = userData['email'] ?? 'No email';
  String phone = userData['phone'] ?? 'No phone';
  
  print('Name: $name');
  print('Email: $email');
  print('Phone: $phone');
}
