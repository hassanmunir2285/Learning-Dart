/**
 * EXTENSIONS IN DART
 * 
 * WHAT ARE EXTENSIONS?
 * Extensions allow you to add functionality to existing classes
 * without modifying their source code.
 * 
 * KEY CONCEPTS:
 * 
 * 1. EXTENSION DECLARATION:
 *    - Syntax: extension ExtensionName on Type { }
 *    - Can add methods, getters, setters, operators
 *    - Cannot add instance variables
 * 
 * 2. EXTENSION METHODS:
 *    - Methods added to existing types
 *    - Can access instance using 'this'
 *    - Called like regular methods
 * 
 * 3. EXTENSION GETTERS/SETTERS:
 *    - Add computed properties
 *    - Access using 'this'
 * 
 * 4. EXTENSION OPERATORS:
 *    - Overload operators for existing types
 *    - Example: +, -, *, ==
 * 
 * BENEFITS:
 * - Add functionality without modifying original class
 * - Organize utility methods
 * - Improve code readability
 * - Work with third-party libraries
 * 
 * LIMITATIONS:
 * - Cannot add instance variables
 * - Cannot override existing methods
 * - Cannot access private members
 * - Must be in same library or imported
 */

void main() {
  print('=== EXTENSIONS IN DART ===\n');
  
  // 1. STRING EXTENSIONS
  print('--- String Extensions ---');
  String text = 'hello world';
  print('Original: $text');
  print('Capitalized: ${text.capitalize()}');
  print('Reversed: ${text.reverse()}');
  print('Word count: ${text.wordCount}');
  print('Is email: ${"user@example.com".isEmail}');
  
  // 2. INT EXTENSIONS
  print('\n--- Int Extensions ---');
  int number = 5;
  print('Number: $number');
  print('Factorial: ${number.factorial()}');
  print('Is even: ${number.isEven}');
  print('Is odd: ${number.isOdd}');
  print('Squared: ${number.squared}');
  print('To binary: ${number.toBinary()}');
  
  // 3. LIST EXTENSIONS
  print('\n--- List Extensions ---');
  List<int> numbers = [1, 2, 3, 4, 5];
  print('Numbers: $numbers');
  print('Sum: ${numbers.sum()}');
  print('Average: ${numbers.average()}');
  print('Max: ${numbers.max()}');
  print('Min: ${numbers.min()}');
  
  // 4. DATETIME EXTENSIONS
  print('\n--- DateTime Extensions ---');
  DateTime now = DateTime.now();
  print('Current date: ${now.formattedDate}');
  print('Is today: ${now.isToday}');
  print('Is weekend: ${now.isWeekend}');
  print('Age: ${DateTime(2000, 1, 1).age} years');
  
  // 5. PRACTICAL EXAMPLES
  print('\n--- Practical Examples ---');
  demonstratePracticalExtensions();
}

/**
 * String Extensions
 */
extension StringExtensions on String {
  // Method: Capitalize first letter
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
  
  // Method: Reverse string
  String reverse() {
    return split('').reversed.join('');
  }
  
  // Getter: Word count
  int get wordCount {
    return trim().isEmpty ? 0 : trim().split(RegExp(r'\s+')).length;
  }
  
  // Getter: Check if email
  bool get isEmail {
    return contains('@') && contains('.') && 
           indexOf('@') < lastIndexOf('.');
  }
  
  // Method: Remove whitespace
  String removeWhitespace() {
    return replaceAll(RegExp(r'\s+'), '');
  }
  
  // Method: Truncate
  String truncate(int length, {String suffix = '...'}) {
    if (this.length <= length) return this;
    return substring(0, length) + suffix;
  }
}

/**
 * Int Extensions
 */
extension IntExtensions on int {
  // Method: Calculate factorial
  int factorial() {
    if (this <= 1) return 1;
    return this * (this - 1).factorial();
  }
  
  // Getter: Check if even
  bool get isEven => this % 2 == 0;
  
  // Getter: Check if odd
  bool get isOdd => this % 2 != 0;
  
  // Getter: Square
  int get squared => this * this;
  
  // Method: Convert to binary
  String toBinary() {
    return toRadixString(2);
  }
  
  // Method: Check if prime
  bool isPrime() {
    if (this < 2) return false;
    for (int i = 2; i * i <= this; i++) {
      if (this % i == 0) return false;
    }
    return true;
  }
  
  // Method: Power
  int power(int exponent) {
    if (exponent == 0) return 1;
    int result = 1;
    for (int i = 0; i < exponent; i++) {
      result *= this;
    }
    return result;
  }
}

/**
 * List Extensions
 */
extension ListExtensions<T extends num> on List<T> {
  // Method: Sum of numbers
  T sum() {
    if (isEmpty) return 0 as T;
    return reduce((a, b) => (a + b) as T);
  }
  
  // Method: Average
  double average() {
    if (isEmpty) return 0.0;
    return sum().toDouble() / length;
  }
  
  // Method: Maximum value
  T max() {
    if (isEmpty) throw StateError('List is empty');
    return reduce((a, b) => a > b ? a : b);
  }
  
  // Method: Minimum value
  T min() {
    if (isEmpty) throw StateError('List is empty');
    return reduce((a, b) => a < b ? a : b);
  }
}

/**
 * DateTime Extensions
 */
extension DateTimeExtensions on DateTime {
  // Getter: Formatted date
  String get formattedDate {
    return '${day.toString().padLeft(2, '0')}/'
           '${month.toString().padLeft(2, '0')}/'
           '$year';
  }
  
  // Getter: Is today
  bool get isToday {
    DateTime now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
  
  // Getter: Is weekend
  bool get isWeekend {
    return weekday == DateTime.saturday || weekday == DateTime.sunday;
  }
  
  // Method: Calculate age
  int get age {
    DateTime now = DateTime.now();
    int age = now.year - year;
    if (now.month < month || (now.month == month && now.day < day)) {
      age--;
    }
    return age;
  }
  
  // Method: Add days
  DateTime addDays(int days) {
    return add(Duration(days: days));
  }
  
  // Method: Days between
  int daysBetween(DateTime other) {
    return difference(other).inDays.abs();
  }
}

/**
 * Practical extension examples
 */
void demonstratePracticalExtensions() {
  // String utilities
  String email = '  USER@EXAMPLE.COM  ';
  print('Email: "$email"');
  print('Trimmed and lowercased: "${email.trim().toLowerCase()}"');
  print('Is valid email: ${email.trim().toLowerCase().isEmail}');
  
  // Number utilities
  int num = 7;
  print('\nNumber: $num');
  print('Is prime: ${num.isPrime()}');
  print('Power of 3: ${num.power(3)}');
  
  // List utilities
  List<int> scores = [85, 90, 78, 92, 88];
  print('\nScores: $scores');
  print('Total: ${scores.sum()}');
  print('Average: ${scores.average().toStringAsFixed(2)}');
  print('Highest: ${scores.max()}');
  print('Lowest: ${scores.min()}');
  
  // Date utilities
  DateTime birthDate = DateTime(1995, 5, 15);
  print('\nBirth date: ${birthDate.formattedDate}');
  print('Age: ${birthDate.age} years');
  print('Days until next birthday: ${birthDate.daysUntilNextBirthday()}');
}

/**
 * ADDITIONAL EXTENSIONS
 */

// Extension for nullable types
extension NullableStringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  
  String orEmpty() => this ?? '';
  
  String orDefault(String defaultValue) => this ?? defaultValue;
}

// Extension for Iterable
extension IterableExtensions<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
  
  T? get lastOrNull => isEmpty ? null : last;
  
  bool get isNotEmpty => !isEmpty;
}

// Extension for Map
extension MapExtensions<K, V> on Map<K, V> {
  Map<K, V> get reversed {
    return Map.fromEntries(entries.toList().reversed);
  }
  
  V? getOrNull(K key) => containsKey(key) ? this[key] : null;
}

// Extension for Duration
extension DurationExtensions on Duration {
  String get formatted {
    int hours = inHours;
    int minutes = inMinutes.remainder(60);
    int seconds = inSeconds.remainder(60);
    
    if (hours > 0) {
      return '${hours}h ${minutes}m ${seconds}s';
    } else if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }
}

// Extension method for DateTime (additional)
extension DateTimeAdditionalExtensions on DateTime {
  int daysUntilNextBirthday() {
    DateTime now = DateTime.now();
    DateTime nextBirthday = DateTime(now.year, month, day);
    
    if (nextBirthday.isBefore(now)) {
      nextBirthday = DateTime(now.year + 1, month, day);
    }
    
    return now.daysBetween(nextBirthday);
  }
}

