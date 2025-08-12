 import 'dart:io';
import 'dart:core';

void tuesdayPractice (){
  num pi = 3.14;
  print(pi);

  List<int> score = [10, 20, 30];
  List<String> name = ['munir', 'naheed', 'hassan'];
  List<bool> booleanList =[true ,false , true];


  print(score.length);
print(name.length);
print(score[1]);
print(booleanList[1]);


for(int i =0 ;  i < score.length ; i++ ) {
  print('score ${score[i]}');
}
print('\n');

  for (int i = 0; i < name.length; i++) {
    print('name is ${name[i]}');
  }
  print('\n');

  for( int i= 0 ; i < name.length ; i++){
    print('my name is ${name[i]} and age is ${ score[i]} and luckyDay is ${ booleanList[i]}');
  }
  print('\n');

  var data = [ 11 , 12 , 13];
  for( var i = 0 ; i < data.length ; i++){
    print(data[i]);
  }
  print('\n');

  dynamic datas = [ 'hassan', 23.3, true];

  for(dynamic i = 0 ; i < datas.length ; i++) {
    print('my data is ${datas[i]}');
  }
  print('\n');

  List< String> names = [ 'Munir', 'Naheed', 'Hassan', 'Maryam', 'Hamza'];

   names.add('Pakistani');
   print(names);
   names.removeAt(2);
  print(names);
   names.removeLast();
  print(names);
   List revList = names.reversed.toList();
  print(revList);
  print(names);

  print('\n');
   for( dynamic i = 0; i < names.length; i++ ){
     print('my family members are ${names[i]}');

   }
  print('\n');
   List<int> age = [];
  stdout.write('please enter the numbers of your family members: ');
  int inputcount = int.parse(stdin.readLineSync()!);

  for (int i =1 ; i <= inputcount ; i++){
     stdout.write('please enter the age of your $i family member: ');
    age.add(int.parse(stdin.readLineSync()!));
   }
  print (age);

  print('\n');print('\n');print('\n');
}