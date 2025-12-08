/**
 * OOP PROJECT: STUDENT MANAGEMENT SYSTEM
 * 
 * This project demonstrates Object-Oriented Programming concepts:
 * - Classes and Objects
 * - Encapsulation
 * - Inheritance
 * - Polymorphism
 * - Abstraction
 * 
 * PROJECT FEATURES:
 * 1. Student Class: Represents a student with properties and methods
 * 2. Course Class: Represents a course
 * 3. StudentManager Class: Manages students (CRUD operations)
 * 4. Grade Enum: Represents student grades
 * 5. Main Menu: Interactive menu for managing students
 * 
 * FUNCTIONALITY:
 * - Add Student
 * - View All Students
 * - Search Student
 * - Update Student
 * - Delete Student
 * - Calculate Statistics
 */

import 'dart:io';

void main() {
  print('=== STUDENT MANAGEMENT SYSTEM ===\n');
  
  StudentManager manager = StudentManager();
  
  while (true) {
    print('\n--- Main Menu ---');
    print('1. Add Student');
    print('2. View All Students');
    print('3. Search Student');
    print('4. Update Student');
    print('5. Delete Student');
    print('6. View Statistics');
    print('7. Exit');
    
    stdout.write('\nEnter your choice (1-7): ');
    String? choice = stdin.readLineSync();
    
    switch (choice) {
      case '1':
        addStudent(manager);
        break;
      case '2':
        viewAllStudents(manager);
        break;
      case '3':
        searchStudent(manager);
        break;
      case '4':
        updateStudent(manager);
        break;
      case '5':
        deleteStudent(manager);
        break;
      case '6':
        viewStatistics(manager);
        break;
      case '7':
        print('Exiting... Thank you!');
        return;
      default:
        print('Invalid choice! Please try again.');
    }
  }
}

/**
 * Add a new student
 */
void addStudent(StudentManager manager) {
  print('\n--- Add Student ---');
  
  stdout.write('Enter Student ID: ');
  String? id = stdin.readLineSync();
  
  stdout.write('Enter Name: ');
  String? name = stdin.readLineSync();
  
  stdout.write('Enter Age: ');
  String? ageInput = stdin.readLineSync();
  
  stdout.write('Enter Course: ');
  String? course = stdin.readLineSync();
  
  if (id != null && name != null && ageInput != null && course != null) {
    try {
      int age = int.parse(ageInput);
      Student student = Student(id, name, age, course);
      
      if (manager.addStudent(student)) {
        print('Student added successfully!');
      } else {
        print('Student with ID $id already exists!');
      }
    } catch (e) {
      print('Invalid age! Please enter a number.');
    }
  } else {
    print('Invalid input!');
  }
}

/**
 * View all students
 */
void viewAllStudents(StudentManager manager) {
  print('\n--- All Students ---');
  List<Student> students = manager.getAllStudents();
  
  if (students.isEmpty) {
    print('No students found.');
  } else {
    print('Total Students: ${students.length}\n');
    for (Student student in students) {
      student.displayInfo();
      print('');
    }
  }
}

/**
 * Search for a student
 */
void searchStudent(StudentManager manager) {
  print('\n--- Search Student ---');
  stdout.write('Enter Student ID: ');
  String? id = stdin.readLineSync();
  
  if (id != null) {
    Student? student = manager.findStudent(id);
    if (student != null) {
      student.displayInfo();
    } else {
      print('Student not found!');
    }
  }
}

/**
 * Update a student
 */
void updateStudent(StudentManager manager) {
  print('\n--- Update Student ---');
  stdout.write('Enter Student ID: ');
  String? id = stdin.readLineSync();
  
  if (id != null) {
    Student? student = manager.findStudent(id);
    if (student != null) {
      print('Current Information:');
      student.displayInfo();
      
      print('\nEnter new information (press Enter to keep current):');
      
      stdout.write('Name (${student.name}): ');
      String? name = stdin.readLineSync();
      if (name != null && name.isNotEmpty) {
        student.name = name;
      }
      
      stdout.write('Age (${student.age}): ');
      String? ageInput = stdin.readLineSync();
      if (ageInput != null && ageInput.isNotEmpty) {
        try {
          student.age = int.parse(ageInput);
        } catch (e) {
          print('Invalid age! Keeping current age.');
        }
      }
      
      stdout.write('Course (${student.course}): ');
      String? course = stdin.readLineSync();
      if (course != null && course.isNotEmpty) {
        student.course = course;
      }
      
      print('Student updated successfully!');
    } else {
      print('Student not found!');
    }
  }
}

/**
 * Delete a student
 */
void deleteStudent(StudentManager manager) {
  print('\n--- Delete Student ---');
  stdout.write('Enter Student ID: ');
  String? id = stdin.readLineSync();
  
  if (id != null) {
    if (manager.deleteStudent(id)) {
      print('Student deleted successfully!');
    } else {
      print('Student not found!');
    }
  }
}

/**
 * View statistics
 */
void viewStatistics(StudentManager manager) {
  print('\n--- Statistics ---');
  List<Student> students = manager.getAllStudents();
  
  if (students.isEmpty) {
    print('No students to show statistics.');
    return;
  }
  
  print('Total Students: ${students.length}');
  
  // Average age
  double avgAge = students.map((s) => s.age).reduce((a, b) => a + b) / students.length;
  print('Average Age: ${avgAge.toStringAsFixed(2)}');
  
  // Students by course
  Map<String, int> courseCount = {};
  for (Student student in students) {
    courseCount[student.course] = (courseCount[student.course] ?? 0) + 1;
  }
  
  print('\nStudents by Course:');
  courseCount.forEach((course, count) {
    print('  $course: $count');
  });
}

/**
 * STUDENT CLASS
 * Represents a student with properties and methods
 */
class Student {
  String id;
  String name;
  int age;
  String course;
  Grade? grade;
  List<double> marks = [];
  
  Student(this.id, this.name, this.age, this.course);
  
  /**
   * Add marks for the student
   */
  void addMarks(double mark) {
    if (mark >= 0 && mark <= 100) {
      marks.add(mark);
      calculateGrade();
    } else {
      print('Invalid mark! Must be between 0 and 100.');
    }
  }
  
  /**
   * Calculate grade based on average marks
   */
  void calculateGrade() {
    if (marks.isEmpty) {
      grade = null;
      return;
    }
    
    double average = marks.reduce((a, b) => a + b) / marks.length;
    
    if (average >= 90) {
      grade = Grade.A;
    } else if (average >= 80) {
      grade = Grade.B;
    } else if (average >= 70) {
      grade = Grade.C;
    } else if (average >= 60) {
      grade = Grade.D;
    } else {
      grade = Grade.F;
    }
  }
  
  /**
   * Get average marks
   */
  double getAverage() {
    if (marks.isEmpty) return 0.0;
    return marks.reduce((a, b) => a + b) / marks.length;
  }
  
  /**
   * Display student information
   */
  void displayInfo() {
    print('Student ID: $id');
    print('Name: $name');
    print('Age: $age');
    print('Course: $course');
    if (grade != null) {
      print('Grade: ${grade!.name}');
    }
    if (marks.isNotEmpty) {
      print('Average Marks: ${getAverage().toStringAsFixed(2)}');
      print('Marks: $marks');
    }
  }
}

/**
 * GRADE ENUM
 * Represents student grades
 */
enum Grade {
  A,
  B,
  C,
  D,
  F
}

/**
 * STUDENT MANAGER CLASS
 * Manages collection of students
 */
class StudentManager {
  List<Student> _students = [];
  
  /**
   * Add a student
   * @return true if added, false if ID already exists
   */
  bool addStudent(Student student) {
    if (findStudent(student.id) != null) {
      return false; // Student with this ID already exists
    }
    _students.add(student);
    return true;
  }
  
  /**
   * Find student by ID
   */
  Student? findStudent(String id) {
    try {
      return _students.firstWhere((s) => s.id == id);
    } catch (e) {
      return null;
    }
  }
  
  /**
   * Delete student by ID
   * @return true if deleted, false if not found
   */
  bool deleteStudent(String id) {
    Student? student = findStudent(id);
    if (student != null) {
      _students.remove(student);
      return true;
    }
    return false;
  }
  
  /**
   * Get all students
   */
  List<Student> getAllStudents() {
    return List.from(_students);
  }
  
  /**
   * Get student count
   */
  int getStudentCount() {
    return _students.length;
  }
}

