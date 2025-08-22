import 'dart:io';

void friidayPractice() {
  stdout.write('Enter loop type( for / while/ doWhile/forIn/ forEach): ');
  String loop_type = stdin.readLineSync()!.toLowerCase();

  List<String> fruit = [' apple', 'mango', 'banana'];

  if (loop_type == 'for') {
    print('\n ******   loop type is for****');
    for (int i = 1; i <= 6; i++) {
      print(' value of i $i');
      print(' value of i $i');
    }
  } else if (loop_type == 'while') {
    print(' \n ***** loop type is while ***** ');
    int i = 1;
    while (i <= 6) {
      print('value of i $i');
      i++;
    }
  } else if (loop_type == 'dowhile') {
    print('\n  ****** loop type is do while*****');
    int i = 1;
    do {
      print('value of i is $i');
      i++;
    } while (i <= 6);
  }
  else if (loop_type == 'for in') {
    print('\n ****** loop type is for in ******');
    for (String a in fruit) {
      print('fruits are $a');
    }
  }
  else if (loop_type == 'for each') {
    print(' \n ****** loop type is  for each');
    fruit.forEach((s) {
      print('fruits are $s');
    });
  }
  else {
  print(' not in given loop list');
  }

  // what are functions & types of functions.

  sum();
  addition();
  multiply(2, 3, 2);
  string('Hassan', 'Hamza');
  print(age());
  print(subtract());
  print(minius(5, 2));
  print(age());
  print(nameTwo('hamza'));

  // switch practice.
  print('Hamza \nMunir');
  print("\n**** While Loop Example ****");
  String day = 'Friday';

  print("\n******* For in Loop ******\n");

  List<int> number = [65, 60, 28, 25, 24];
  for (int i in number) {
  print("Ages are: $i");
  }
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  fruits.forEach((fruit) {
  print("Fruit: $fruit");
  });

  switch (day) {
  case 'monday':
  print('first day of week');
  break;

  case 'tuesday':
  print('2nd day of week');
  break;

  case 'wednesday':
  print('3rd day of week');
  break;

  case 'Friday':
  print('itx weekend');
  break;

  default:
  print('other day of week');
  }
}

void sum() {
  print('THIS IS FUNCTION');
}

void addition() {
  int x = 20;
  int y = 30;

  int result = x + y;

  print(result);
}

void multiply(int numberOne, int numberTwo, int numberThree) {
  print(numberOne * numberTwo * numberThree);
}

void string(String name1, String name2) {
  print(name1 + name2);
}

int age() {
  return 5;
}

int subtract() {
  int a = 15,
      b = 5;

  return a - b;
}

int minius(int c, int d) {
  return c - d;
}

String nameTwo(String dFour) {
  return dFour;
}

List<int> nameYoyo() {
  List<int> age = [1, 2, 3, 4, 5];
  return age;
}

/*
int findMaximumNumber(){

  return 0 ;
}*




/String name = ' a  b c d';
 */
