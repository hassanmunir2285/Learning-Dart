import 'dart:io';

void sundayPractice() {
  // String interpolatio

  String start = "**";
  // String starts = "ABC";
  // print (start+starts);

  // String sumStars = starts + start + "1234";
  // start += "*";    ///
  start = start + "*";
  // print(start);

  // print("\ncall 1st time\n");
  // squarePattern(5);
  // print("\ncall 2nd time\n");
  // squarePattern(6);
  // print("\ncall 3rd time\n");
  // squarePattern(7);
  // rightTriangle(5);
  // squarePattern2(6);
  // invertedRightTriangle(5);
  // invertedRightTriangle2(5);
  // int i = 20;
  rightAlignedTriangle(5);
  // print(i);
  //
  // print('Enter 1  for optional perameter and 2 for required perameter');
  // int choice 1 = int.parse(stdin.read line syn():);
  //
  //
  // if ( choice == 2){
  // print ( 'enter 1 for required positional and 2 for required name' );
  // int choice 2 = int.parse(stdin.readLineSync());
  //
  // if ( choice 2 ==1 ){
  //   required positional( " Ali , 23");
  //
  //   else if ( choice 2== 2){
  //     required name ( name : 'ali', age : 23);
  //   }
  //
  //   }
  //
  // }
  // if else( choice 1 ==1 ){
  //   print('enter 1 for optional position perameter ,2 for optional name perameter');
  //   int choice 3 = int.parse(stdin.readLineSync():);
  //
  //   if ( choice 3==1){
  //     optional position peremeter ( 'ali , 'karachi');
  //
  //   }
  //   }

  // number of rows in the upper half of the diamond

  // int i = 5;
  //
  // for (int x = 1; x <= i; x++) {
  //   for (int y = 1; y <= i - x; y++) {
  //     stdout.write(' ');
  //   }
  //   for (int z = 1; z <= (2 * x - 1); z++) {
  //     stdout.write('*');
  //   }
  //
  //   print('');
  // }
  //
  // for (int x = i - 1 ; x >= 1; x--) {
  //   for (int y = 1; y <= i - x; y++) {
  //     stdout.write(' ');
  //   }
  //   for (int z = 1; z <= (2 * x - 1); z++) {
  //     stdout.write('*');
  //   }
  //
  //   print('');
  // }


  ///    ******** if / else and nested if / else EXAMPLE   *******////


  print('enter 1 for optional perameters or enter 2 for required perameters');
  int choice1 = int.parse(stdin.readLineSync()!);

  if (choice1 == 2) {
    print(
        'enter 1 for Required positional perameter or enter 2 for Required name perameters');
    int choice = int.parse(stdin.readLineSync()!);

    if (choice == 1) {
      requiredpositional(2, 'hamza');
    }
    else if (choice == 2) {
      requiredname(age: 15, name: 'Ali');
    }
    else {
      print('invalid condition');
    }
  }
  else if (choice1 == 1) {
    positionalPerameter(24, 'Tom');

    if (choice1 == 2) {
      namePerameter(age: 15, city : 'Ali');
    }
    else if (choice1 == 3) {

    }
    else {
      print(' invalid condition');
    }

    print(
        'enter 1 for default optional position and enter 2 for default optional name');
    int choice3 = int.parse(stdin.readLineSync()!);
    if (choice3 == 2) {
      defaultOptionalname(add: 10);
    }
  else if (choice3 == 1) {
    defaultOptionalposition(5);


  }
}
}
  void requiredpositional(int age, String name) {
    print('requiredPosition = Age$age ,Name$name');
  }
  void requiredname({ required int age, required String name}) {
    print('required name= Age$age , Name$name');
  }
  void positionalPerameter([ int ? age, String ? name]) {
    print('positional perameters = Age$age , Name$name{?? akber');
  }
  void namePerameter({ int? age, String? city}) {
    print('namePerameter = age$age , city$city');
    }
  void defaultOptionalposition([  int sum = 5 , String classs ='coding' ]){
  print ( 'defaultOptionalposition  = sum$sum , class$classs');
}
  void defaultOptionalname ( { int add = 10} ){
  print ( ' defaultOptionalname  = add $add');
}


// 2) Right-Angled Triangle
void rightTriangle(int n) {
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write("*");
    }
    print("");
  }
}

// 1) Square
void squarePattern(int n) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      stdout.write("*  ");
    }
    print("");
  }
}

void squarePattern2(int n) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      stdout.write('*  ');
    }
    print('');
  }
}


// 3) Inverted Right-Angled Triangle
void invertedRightTriangle(int n) {
  for (int i = n; i >= 1; i--) {
    for (int j = 1; j <= i; j++) {
      stdout.write("*");
    }
    print("");
  }
}

void invertedRightTriangle2(int n) {
  for (int i = 1; i < n; i++) {
    for (int j = 1; j < n - i + 1; j++) {
      stdout.write('*  ');
    }
    print('');
  }
}


// Right aligned half pyramid using 2 loops + if-else
void rightAlignedTriangle(int n) {
  for (int i = 1; i <= n; i++) {
    for (int j = 1; j <= n; j++) {
      if (j <= n - i) {
        stdout.write(" ");
      } else {
        stdout.write("*");
      }
    }
    print("");
  }
}