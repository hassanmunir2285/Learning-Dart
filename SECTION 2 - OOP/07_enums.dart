/**
 * ENUMS IN DART
 * 
 * WHAT IS AN ENUM?
 * An enum (enumeration) is a special type that represents
 * a fixed set of constant values.
 * 
 * KEY CONCEPTS:
 * 
 * 1. Enum Declaration:
 *    - Syntax: enum EnumName { value1, value2, value3 }
 *    - Values are compile-time constants
 *    - Each value has an index (0-based)
 * 
 * 2. Enum Properties:
 *    - name: String name of the enum value
 *    - index: Integer index of the enum value
 *    - values: List of all enum values
 * 
 * 3. Enum Usage:
 *    - Type-safe way to represent fixed options
 *    - Used in switch statements
 *    - Prevents invalid values
 * 
 * BENEFITS:
 * - Type Safety: Prevents invalid values
 * - Readability: Self-documenting code
 * - IDE Support: Autocomplete and refactoring
 * - Switch Exhaustiveness: Compiler can check all cases
 * 
 * COMMON USE CASES:
 * - Status values (success, error, loading)
 * - Days of week
 * - Directions (north, south, east, west)
 * - User roles (admin, user, guest)
 * - Order status (pending, processing, completed)
 */

void main() {
  print('=== ENUMS IN DART ===\n');
  
  // Basic enum usage
  print('--- Basic Enum Usage ---');
  Days today = Days.Thursday;
  print('Today: $today');
  print('Today name: ${today.name}');
  print('Today index: ${today.index}');
  
  if (today.name == "Thursday") {
    print("Mid of the week!");
  }
  
  // Enum with switch statement
  print('\n--- Enum with Switch ---');
  Status s = Status.success;
  print("Status: $s");
  print("Status name: ${s.name}");
  
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
  
  // Enum values iteration
  print('\n--- Iterating Enum Values ---');
  print('All days:');
  for (Days day in Days.values) {
    print('  ${day.name} (index: ${day.index})');
  }
  
  // Enum comparison
  print('\n--- Enum Comparison ---');
  Days day1 = Days.Monday;
  Days day2 = Days.Monday;
  Days day3 = Days.Tuesday;
  
  print('day1 == day2: ${day1 == day2}'); // true
  print('day1 == day3: ${day1 == day3}'); // false
  
  // Practical examples
  print('\n--- Practical Examples ---');
  
  // User role example
  UserRole user = UserRole.admin;
  print('User role: ${user.name}');
  checkAccess(user);
  
  // Order status example
  OrderStatus order = OrderStatus.processing;
  print('Order status: ${order.name}');
  processOrder(order);
  
  // Direction example
  Direction dir = Direction.north;
  print('Direction: ${dir.name}');
  move(dir);
}

/**
 * Basic enum for days of week
 */
enum Days {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday
}

/**
 * Enum for status values
 */
enum Status {
  success,
  error,
  loading
}

/**
 * PRACTICAL EXAMPLES
 */

// User role enum
enum UserRole {
  admin,
  user,
  guest
}

void checkAccess(UserRole role) {
  switch (role) {
    case UserRole.admin:
      print("Full access granted");
      break;
    case UserRole.user:
      print("Standard access granted");
      break;
    case UserRole.guest:
      print("Limited access granted");
      break;
  }
}

// Order status enum
enum OrderStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled
}

void processOrder(OrderStatus status) {
  switch (status) {
    case OrderStatus.pending:
      print("Order is pending");
      break;
    case OrderStatus.processing:
      print("Order is being processed");
      break;
    case OrderStatus.shipped:
      print("Order has been shipped");
      break;
    case OrderStatus.delivered:
      print("Order has been delivered");
      break;
    case OrderStatus.cancelled:
      print("Order has been cancelled");
      break;
  }
}

// Direction enum
enum Direction {
  north,
  south,
  east,
  west
}

void move(Direction direction) {
  switch (direction) {
    case Direction.north:
      print("Moving north");
      break;
    case Direction.south:
      print("Moving south");
      break;
    case Direction.east:
      print("Moving east");
      break;
    case Direction.west:
      print("Moving west");
      break;
  }
}

// Priority enum
enum Priority {
  low,
  medium,
  high,
  urgent
}

// HTTP method enum
enum HttpMethod {
  get,
  post,
  put,
  delete,
  patch
}

// Color enum
enum Color {
  red,
  green,
  blue,
  yellow,
  orange,
  purple
}

// Size enum
enum Size {
  small,
  medium,
  large,
  extraLarge
}

// Payment method enum
enum PaymentMethod {
  creditCard,
  debitCard,
  paypal,
  bankTransfer,
  cash
}

// Using enums in classes
class Task {
  String title;
  Priority priority;
  Status status;
  
  Task(this.title, this.priority, this.status);
  
  void displayInfo() {
    print('Task: $title');
    print('Priority: ${priority.name}');
    print('Status: ${status.name}');
  }
  
  void updateStatus(Status newStatus) {
    status = newStatus;
    print('Status updated to: ${newStatus.name}');
  }
}

// Using enums with methods
void demonstrateEnumUsage() {
  Task task = Task("Learn Dart", Priority.high, Status.pending);
  task.displayInfo();
  task.updateStatus(Status.processing);
  task.displayInfo();
}
