import 'package:vm_service/src/vm_service.dart';

void wednesdayPractice(){

        // Null safety///

  int? x ;
  print( x);

  x = 30;
  print(x);

  String? name ;
  print(name);
  name = 'Hamza';
  print(name);

  String? name1;
  if (name1 == null){
    print('name1 is null');
  }

  //     ***   classes topic ***   //

Student student1 = Student();

  student1.age = 20;
  student1.name= 'HP';
  student1.grade='B';
  student1.studentID=2285;

  student1.displayInfo();
  student1.updateGrade('A');

  // **** class example # 2 ******////

  Person p1 = Person('john', 'male', 26);       // create person class
  p1.showData();

  print(p1.name);
}

// ********* Classes********////

class Student {

  String? name;
  int? age;
  String? grade;
  int? studentID;

  void displayInfo(){
    print('Student Name : $name');
    print('age : $age');
    print('grade : $grade ');
    print('studentID : $studentID');
    print('____________________');
  }
  void updateGrade(String newGrade){
    grade = newGrade;
    print('Grade updated to $newGrade for $name');
  }
}

//// ***** 2nd example *****/////

class Person {             // create person class
  String? name, sex ;
  int? year;

  Person(String name, sex, int year){        // construstors
    this.name = name;
    this.sex = sex;
    this.year= year;

  }

  void showData(){                        // Method
    print('Name = $name');
    print('sex = $sex');
    print('year = $year');

      
  }
}