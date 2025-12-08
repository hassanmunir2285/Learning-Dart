/**
 * MINI PROJECTS: CALCULATOR & CONVERTER
 * 
 * This file contains practical mini projects to practice Dart basics:
 * 
 * 1. CALCULATOR:
 *    - Basic arithmetic operations
 *    - User input for numbers and operation
 *    - Error handling
 * 
 * 2. UNIT CONVERTER:
 *    - Temperature conversion (Celsius, Fahrenheit, Kelvin)
 *    - Length conversion (Meters, Feet, Inches)
 *    - Weight conversion (Kilograms, Pounds)
 * 
 * These projects demonstrate:
 * - Input/Output operations
 * - Control flow (if-else, switch)
 * - Functions
 * - Error handling
 * - User interaction
 */

import 'dart:io';

void main() {
  print('=== MINI PROJECTS ===\n');
  
  print('Choose a project:');
  print('1. Calculator');
  print('2. Unit Converter');
  print('3. Exit');
  
  stdout.write('\nEnter your choice (1-3): ');
  String? choice = stdin.readLineSync();
  
  switch (choice) {
    case '1':
      calculator();
      break;
    case '2':
      unitConverter();
      break;
    case '3':
      print('Goodbye!');
      break;
    default:
      print('Invalid choice!');
  }
}

/**
 * CALCULATOR PROJECT
 * Performs basic arithmetic operations
 */
void calculator() {
  print('\n=== CALCULATOR ===\n');
  
  while (true) {
    print('1. Add  2. Subtract  3. Multiply  4. Divide  5. Modulus  6. Exit');
    stdout.write('Choice: ');
    String? op = stdin.readLineSync();
    if (op == '6') break;
    if (op == null || !['1', '2', '3', '4', '5'].contains(op)) continue;
    
    stdout.write('Number 1: ');
    String? n1 = stdin.readLineSync();
    stdout.write('Number 2: ');
    String? n2 = stdin.readLineSync();
    
    try {
      double num1 = double.parse(n1 ?? '0');
      double num2 = double.parse(n2 ?? '0');
      double result = 0;
      String operator = '';
      
      switch (op) {
        case '1': result = num1 + num2; operator = '+'; break;
        case '2': result = num1 - num2; operator = '-'; break;
        case '3': result = num1 * num2; operator = '*'; break;
        case '4':
          if (num2 == 0) { print('Error: Division by zero!'); continue; }
          result = num1 / num2; operator = '/'; break;
        case '5': result = num1 % num2; operator = '%'; break;
      }
      print('Result: $num1 $operator $num2 = $result\n');
    } catch (e) {
      print('Invalid input!');
    }
  }
}

/**
 * UNIT CONVERTER PROJECT
 * Converts between different units
 */
void unitConverter() {
  print('\n=== UNIT CONVERTER ===\n');
  
  while (true) {
    print('1. Temperature  2. Length  3. Weight  4. Exit');
    stdout.write('Choice: ');
    String? type = stdin.readLineSync();
    if (type == '4') break;
    
    switch (type) {
      case '1': temperatureConverter(); break;
      case '2': lengthConverter(); break;
      case '3': weightConverter(); break;
      default: print('Invalid choice!');
    }
  }
}

/**
 * Temperature Converter
 */
void temperatureConverter() {
  print('\n--- Temperature Converter ---\n');
  
  print('From:');
  print('1. Celsius');
  print('2. Fahrenheit');
  print('3. Kelvin');
  
  stdout.write('Enter source unit (1-3): ');
  String? from = stdin.readLineSync();
  
  print('\nTo:');
  print('1. Celsius');
  print('2. Fahrenheit');
  print('3. Kelvin');
  
  stdout.write('Enter target unit (1-3): ');
  String? to = stdin.readLineSync();
  
  stdout.write('Enter temperature: ');
  String? tempInput = stdin.readLineSync();
  
  if (from == null || to == null || tempInput == null) {
    print('Invalid input!');
    return;
  }
  
  try {
    double temperature = double.parse(tempInput);
    double result = 0;
    String fromUnit = '';
    String toUnit = '';
    
    double celsius = switch (from) {
      '1' => temperature,
      '2' => (temperature - 32) * 5 / 9,
      '3' => temperature - 273.15,
      _ => 0,
    };
    fromUnit = switch (from) { '1' => 'Celsius', '2' => 'Fahrenheit', '3' => 'Kelvin', _ => '' };
    
    result = switch (to) {
      '1' => celsius,
      '2' => (celsius * 9 / 5) + 32,
      '3' => celsius + 273.15,
      _ => 0,
    };
    toUnit = switch (to) { '1' => 'Celsius', '2' => 'Fahrenheit', '3' => 'Kelvin', _ => '' };
    
    print('\n$temperature° $fromUnit = $result° $toUnit\n');
  } catch (e) {
    print('Error: Invalid temperature format!');
  }
}

/**
 * Length Converter
 */
void lengthConverter() {
  print('\n--- Length Converter ---\n');
  
  print('From:');
  print('1. Meters');
  print('2. Feet');
  print('3. Inches');
  
  stdout.write('Enter source unit (1-3): ');
  String? from = stdin.readLineSync();
  
  print('\nTo:');
  print('1. Meters');
  print('2. Feet');
  print('3. Inches');
  
  stdout.write('Enter target unit (1-3): ');
  String? to = stdin.readLineSync();
  
  stdout.write('Enter length: ');
  String? lengthInput = stdin.readLineSync();
  
  if (from == null || to == null || lengthInput == null) {
    print('Invalid input!');
    return;
  }
  
  try {
    double length = double.parse(lengthInput);
    double result = 0;
    String fromUnit = '';
    String toUnit = '';
    
    double meters = switch (from) {
      '1' => length,
      '2' => length * 0.3048,
      '3' => length * 0.0254,
      _ => 0,
    };
    fromUnit = switch (from) { '1' => 'Meters', '2' => 'Feet', '3' => 'Inches', _ => '' };
    
    result = switch (to) {
      '1' => meters,
      '2' => meters / 0.3048,
      '3' => meters / 0.0254,
      _ => 0,
    };
    toUnit = switch (to) { '1' => 'Meters', '2' => 'Feet', '3' => 'Inches', _ => '' };
    
    print('\n$length $fromUnit = ${result.toStringAsFixed(2)} $toUnit\n');
  } catch (e) {
    print('Error: Invalid length format!');
  }
}

/**
 * Weight Converter
 */
void weightConverter() {
  print('\n--- Weight Converter ---\n');
  
  print('From:');
  print('1. Kilograms');
  print('2. Pounds');
  
  stdout.write('Enter source unit (1-2): ');
  String? from = stdin.readLineSync();
  
  print('\nTo:');
  print('1. Kilograms');
  print('2. Pounds');
  
  stdout.write('Enter target unit (1-2): ');
  String? to = stdin.readLineSync();
  
  stdout.write('Enter weight: ');
  String? weightInput = stdin.readLineSync();
  
  if (from == null || to == null || weightInput == null) {
    print('Invalid input!');
    return;
  }
  
  try {
    double weight = double.parse(weightInput);
    double result = 0;
    String fromUnit = '';
    String toUnit = '';
    
    double kilograms = switch (from) {
      '1' => weight,
      '2' => weight * 0.453592,
      _ => 0,
    };
    fromUnit = switch (from) { '1' => 'Kilograms', '2' => 'Pounds', _ => '' };
    
    result = switch (to) {
      '1' => kilograms,
      '2' => kilograms / 0.453592,
      _ => 0,
    };
    toUnit = switch (to) { '1' => 'Kilograms', '2' => 'Pounds', _ => '' };
    
    print('\n$weight $fromUnit = ${result.toStringAsFixed(2)} $toUnit\n');
  } catch (e) {
    print('Error: Invalid weight format!');
  }
}

