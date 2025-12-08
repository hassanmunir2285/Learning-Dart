/**
 * INTERFACE CLASS IN DART 3
 * 
 * WHAT IS AN INTERFACE CLASS?
 * An interface class can be implemented but not extended.
 * It's perfect for defining contracts that classes must follow,
 * while preventing inheritance.
 * 
 * KEY CHARACTERISTICS:
 * 
 * 1. CAN BE IMPLEMENTED:
 *    - Classes can implement it
 *    - Must implement all members
 *    - Use for contracts
 * 
 * 2. CANNOT BE EXTENDED:
 *    - No inheritance allowed
 *    - Prevents code reuse through extension
 *    - Forces explicit implementation
 * 
 * 3. CAN HAVE DEFAULT IMPLEMENTATIONS:
 *    - Can provide default methods
 *    - Implementers can override
 * 
 * 4. USE CASES:
 *    - API contracts
 *    - Service interfaces
 *    - Repository patterns
 *    - Plugin interfaces
 * 
 * WHEN TO USE:
 * - When you want to define a contract
 * - For service interfaces
 * - When you want to prevent inheritance
 * - For dependency injection
 */

void main() {
  print('=== INTERFACE CLASS IN DART 3 ===\n');
  
  // 1. BASIC INTERFACE CLASS
  print('--- Basic Interface Class ---');
  demonstrateBasicInterface();
  
  // 2. INTERFACE WITH MULTIPLE IMPLEMENTATIONS
  print('\n--- Interface with Multiple Implementations ---');
  demonstrateMultipleImplementations();
  
  // 3. INTERFACE FOR SERVICES
  print('\n--- Interface for Services ---');
  demonstrateInterfaceServices();
  
  // 4. INTERFACE WITH DEFAULT METHODS
  print('\n--- Interface with Default Methods ---');
  demonstrateInterfaceWithDefaults();
}

/**
 * Basic interface class
 */
void demonstrateBasicInterface() {
  // Interface class can be implemented
  Printer printer = ConsolePrinter();
  printer.print('Hello from interface!');
  
  // Can also extend and implement
  AdvancedPrinter advanced = AdvancedPrinter();
  advanced.print('Advanced printing');
  advanced.parentMethod();
}

// Interface class - can be implemented, not extended
abstract interface class Printer {
  void print(String message);
}

// Implementation
class ConsolePrinter implements Printer {
  @override
  void print(String message) {
    print('Console: $message');
  }
}

// Can extend another class and implement interface
class AdvancedPrinter extends BaseClass implements Printer {
  @override
  void print(String message) {
    print('Advanced: $message');
  }
  
  void parentMethod() {
    print('From parent class');
  }
}

class BaseClass {
  void parentMethod() {
    print('Base method');
  }
}

/**
 * Multiple implementations
 */
void demonstrateMultipleImplementations() {
  // Different implementations of same interface
  Repository fileRepo = FileRepository();
  Repository dbRepo = DatabaseRepository();
  
  fileRepo.save('data');
  dbRepo.save('data');
  
  fileRepo.load();
  dbRepo.load();
}

// Interface for repository pattern
abstract interface class Repository {
  void save(String data);
  void load();
}

// File implementation
class FileRepository implements Repository {
  @override
  void save(String data) {
    print('Saving to file: $data');
  }
  
  @override
  void load() {
    print('Loading from file');
  }
}

// Database implementation
class DatabaseRepository implements Repository {
  @override
  void save(String data) {
    print('Saving to database: $data');
  }
  
  @override
  void load() {
    print('Loading from database');
  }
}

/**
 * Interface for services
 */
void demonstrateInterfaceServices() {
  // Different service implementations
  PaymentService creditCard = CreditCardService();
  PaymentService paypal = PayPalService();
  
  creditCard.processPayment(100.0);
  paypal.processPayment(100.0);
}

// Interface for payment service
abstract interface class PaymentService {
  void processPayment(double amount);
  String getPaymentMethod();
}

class CreditCardService implements PaymentService {
  @override
  void processPayment(double amount) {
    print('Processing credit card payment: \$$amount');
  }
  
  @override
  String getPaymentMethod() => 'Credit Card';
}

class PayPalService implements PaymentService {
  @override
  void processPayment(double amount) {
    print('Processing PayPal payment: \$$amount');
  }
  
  @override
  String getPaymentMethod() => 'PayPal';
}

/**
 * Interface with default methods
 */
void demonstrateInterfaceWithDefaults() {
  // Interface can have default implementations
  Logger logger = FileLogger();
  logger.log('Message');
  logger.logError('Error message');
  
  // Can override default methods
  Logger customLogger = CustomLogger();
  customLogger.log('Custom message');
  customLogger.logError('Custom error');
}

// Interface with default implementation
abstract interface class Logger {
  void log(String message) {
    print('LOG: $message');
  }
  
  // Default implementation
  void logError(String error) {
    print('ERROR: $error');
  }
}

class FileLogger implements Logger {
  @override
  void log(String message) {
    print('File LOG: $message');
  }
  
  @override
  void logError(String error) {
    print('ERROR: $error'); // Implement default behavior
  }
}

class CustomLogger implements Logger {
  @override
  void log(String message) {
    print('Custom LOG: $message');
  }
  
  @override
  void logError(String error) {
    print('Custom ERROR: $error');
  }
}

/**
 * ADDITIONAL EXAMPLES
 */

// Interface for data access
abstract interface class DataAccess {
  Future<List<Map<String, dynamic>>> fetchAll();
  Future<Map<String, dynamic>?> fetchById(String id);
  Future<void> save(Map<String, dynamic> data);
  Future<void> delete(String id);
}

// Interface for notifications
abstract interface class NotificationService {
  void sendNotification(String message);
  void sendEmail(String to, String subject, String body);
  void sendSMS(String phone, String message);
}

// Interface for validators
abstract interface class Validator<T> {
  bool validate(T value);
  String? getErrorMessage(T value);
}

